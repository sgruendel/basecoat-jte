const { execFileSync } = require('node:child_process');
const fs = require('node:fs');
const path = require('node:path');

const root = path.resolve(__dirname, '..');
const libraryPom = 'basecoat-jte/pom.xml';
const demoPom = 'demo/pom.xml';
const templateDir = 'demo/src/main/jte/basecoat';
const files = [libraryPom, demoPom, 'README.md', 'package.json', 'package-lock.json'];
const basecoatPackage = 'basecoat-css';
const projectVersion = /(<artifactId>basecoat-jte<\/artifactId>\s*<version>)([^<]+)(<\/version>)/;
const templateSource = /(https:\/\/github\.com\/hunvreus\/basecoat\/blob\/)([^/\s]+)(\/)/g;
const semver = /^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)$/;

function replaceField(content, file, field, pattern, value) {
    if (!pattern.test(content)) throw new Error(`Cannot find ${field} in ${file}`);
    return content.replace(pattern, (_, prefix, current, suffix) => prefix + value + suffix);
}

// npm resolves the tarball URL and integrity hash that the lockfile needs.
function npmInstall(projectRoot, version) {
    execFileSync('npm', ['install', '--save-exact', '--no-audit', '--no-fund', `${basecoatPackage}@${version}`], {
        cwd: projectRoot,
        stdio: 'inherit',
    });
}

function sync(version, { projectRoot = root, check = false, install = npmInstall } = {}) {
    // Templates link to the upstream Basecoat macros they are ported from.
    const templates = fs
        .readdirSync(path.join(projectRoot, templateDir))
        .filter((file) => file.endsWith('.jte'))
        .sort()
        .map((file) => `${templateDir}/${file}`);

    // Read and validate every file before changing any of them.
    const originals = new Map(
        [...files, ...templates].map((file) => [file, fs.readFileSync(path.join(projectRoot, file), 'utf8')]),
    );
    if (version === undefined && check) {
        const match = originals.get(libraryPom).match(projectVersion);
        if (!match) throw new Error(`Cannot find project version in ${libraryPom}`);
        version = match[2];
    }
    if (!semver.test(version ?? '')) {
        throw new Error(`Version must be major.minor.patch, got: ${version}`);
    }

    const jte = originals.get(libraryPom).match(/<jte\.version>([^<]+)<\/jte\.version>/)?.[1];
    if (!jte) throw new Error(`Cannot find jte.version in ${libraryPom}`);

    const updates = new Map(originals);
    let pom = replaceField(originals.get(libraryPom), libraryPom, 'project version', projectVersion, version);
    pom = replaceField(pom, libraryPom, 'SCM tag', /(<scm>[\s\S]*?<tag>)([^<]+)(<\/tag>)/, `v${version}`);
    updates.set(libraryPom, pom);

    // The demo builds against the library in the same reactor, so both must agree.
    let demo = replaceField(
        originals.get(demoPom),
        demoPom,
        'library version',
        /(<basecoat-jte\.version>)([^<]+)(<\/basecoat-jte\.version>)/,
        version,
    );
    demo = replaceField(demo, demoPom, 'JTE version', /(<jte\.version>)([^<]+)(<\/jte\.version>)/, jte);
    updates.set(demoPom, demo);

    let readme = originals.get('README.md');
    readme = replaceField(
        readme,
        'README.md',
        'Maven dependency version',
        /(<groupId>io\.github\.sgruendel<\/groupId>\s*<artifactId>basecoat-jte<\/artifactId>\s*<version>)([^<]+)(<\/version>)/,
        version,
    );
    readme = replaceField(
        readme,
        'README.md',
        'Gradle dependency version',
        /(implementation\("io\.github\.sgruendel:basecoat-jte:)([^"\s]+)("\))/,
        version,
    );
    // The library version matches the Basecoat version the templates are ported from.
    readme = replaceField(
        readme,
        'README.md',
        'Basecoat badge alt text',
        /(\[!\[Basecoat )([^\]]+)(\]\[basecoat-badge\]\])/,
        version,
    );
    readme = replaceField(
        readme,
        'README.md',
        'Basecoat badge version',
        /(\[basecoat-badge\]: https:\/\/img\.shields\.io\/badge\/Basecoat-)([^-]+)(-)/,
        version,
    );
    readme = replaceField(
        readme,
        'README.md',
        'compatible Basecoat version',
        /(Compatible with\s*\[Basecoat )([^\]]+)(\])/,
        version,
    );
    readme = replaceField(
        readme,
        'README.md',
        'compatible Basecoat release',
        /(Compatible with\s*\[Basecoat [^\]]+\]\(https:\/\/github\.com\/hunvreus\/basecoat\/releases\/tag\/)([^)]+)(\))/,
        version,
    );
    readme = replaceField(
        readme,
        'README.md',
        'kitchen sink Basecoat version',
        /(the current Basecoat version )(\d+\.\d+\.\d+)(,)/,
        version,
    );
    updates.set('README.md', readme);

    for (const file of templates) {
        // Not every template has an upstream counterpart, so a missing link is fine.
        updates.set(
            file,
            originals.get(file).replace(templateSource, (_, prefix, current, suffix) => prefix + version + suffix),
        );
    }

    // The demo uses the Basecoat CSS and JavaScript the templates are ported from.
    let lockedBasecoat;
    for (const file of ['package.json', 'package-lock.json']) {
        const json = JSON.parse(originals.get(file));
        if (typeof json.version !== 'string') throw new Error(`Cannot find package version in ${file}`);
        const manifest = file === 'package.json' ? json : json.packages?.[''];
        if (typeof manifest?.version !== 'string') throw new Error(`Cannot find root package version in ${file}`);
        if (typeof manifest.dependencies?.[basecoatPackage] !== 'string') {
            throw new Error(`Cannot find ${basecoatPackage} dependency in ${file}`);
        }
        const needsUpdate =
            json.version !== version ||
            manifest.version !== version ||
            manifest.dependencies[basecoatPackage] !== version;
        json.version = version;
        manifest.version = version;
        manifest.dependencies[basecoatPackage] = version;
        if (file === 'package-lock.json') {
            lockedBasecoat = json.packages[`node_modules/${basecoatPackage}`]?.version;
        }
        if (needsUpdate) updates.set(file, JSON.stringify(json, null, 2) + '\n');
    }
    const staleInstall = lockedBasecoat !== version;

    const changed = [...updates].filter(([file, content]) => content !== originals.get(file));
    if (check && (changed.length || staleInstall)) {
        const stale = changed.map(([file]) => file);
        if (staleInstall && !stale.includes('package-lock.json')) stale.push('package-lock.json');
        throw new Error(
            `Versions do not match ${version} (JTE ${jte}): ${stale.join(', ')}. ` +
                `Run npm run sync-version -- ${version}.`,
        );
    }
    if (!check) {
        for (const [file, content] of changed) fs.writeFileSync(path.join(projectRoot, file), content);
        if (staleInstall) install(projectRoot, version);
    }
    const summary = `library ${version}, ${basecoatPackage} ${version}, JTE ${jte}`;
    console.log(check ? `Verified ${summary}.` : `Synced ${summary} in ${changed.length} files.`);
}

if (require.main === module) {
    const args = process.argv.slice(2);
    const check = args[0] === '--check';
    if (check) args.shift();
    if (args.length > 1 || (!check && args.length !== 1)) {
        console.error('Usage: node scripts/sync-version.js <version> | --check [version]');
        process.exitCode = 1;
    } else {
        try {
            sync(args[0], { check });
        } catch (error) {
            console.error(error.message);
            process.exitCode = 1;
        }
    }
}

module.exports = { sync };

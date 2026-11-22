const assert = require("node:assert/strict");
const fs = require("node:fs");
const os = require("node:os");
const path = require("node:path");
const { test } = require("node:test");
const { sync } = require("./sync-version");

const files = ["basecoat-jte/pom.xml", "demo/pom.xml", "README.md", "package.json", "package-lock.json"];

function fixture(t) {
  const projectRoot = fs.mkdtempSync(path.join(os.tmpdir(), "basecoat-jte-version-test-"));
  t.after(() => fs.rmSync(projectRoot, { recursive: true, force: true }));
  for (const file of files) {
    const target = path.join(projectRoot, file);
    fs.mkdirSync(path.dirname(target), { recursive: true });
    fs.copyFileSync(path.resolve(__dirname, "..", file), target);
  }
  const read = file => fs.readFileSync(path.join(projectRoot, file), "utf8");
  const write = (file, content) => fs.writeFileSync(path.join(projectRoot, file), content);
  const snapshot = () => files.map(file => [file, read(file)]);
  const quiet = t.mock.method(console, "log", () => {});
  t.after(() => quiet.mock.restore());
  return { projectRoot, read, write, snapshot };
}

function nextPatch(version) {
  const parts = version.split(".");
  parts[2] = String(Number(parts[2]) + 1);
  return parts.join(".");
}

function currentVersion(project) {
  return project.read("basecoat-jte/pom.xml").match(/<artifactId>basecoat-jte<\/artifactId>\s*<version>([^<]+)</)[1];
}

test("sync updates every release field and check mode accepts the result", t => {
  const project = fixture(t);
  const version = nextPatch(currentVersion(project));
  sync(version, { projectRoot: project.projectRoot });

  const pom = project.read("basecoat-jte/pom.xml");
  assert.ok(pom.includes(`<artifactId>basecoat-jte</artifactId>\n    <version>${version}</version>`));
  assert.ok(pom.includes(`<tag>v${version}</tag>`));
  assert.ok(project.read("demo/pom.xml").includes(`<basecoat-jte.version>${version}</basecoat-jte.version>`));
  assert.ok(project.read("README.md").includes(`io.github.sgruendel:basecoat-jte:${version}`));
  assert.match(project.read("README.md"),
    new RegExp(`<artifactId>basecoat-jte</artifactId>\\s*<version>${version.replaceAll(".", "\\.")}</version>`));
  assert.equal(JSON.parse(project.read("package.json")).version, version);
  const lock = JSON.parse(project.read("package-lock.json"));
  assert.equal(lock.version, version);
  assert.equal(lock.packages[""].version, version);

  sync(undefined, { projectRoot: project.projectRoot, check: true });
  sync(version, { projectRoot: project.projectRoot, check: true });
});

test("sync aligns the demo JTE version with the library", t => {
  const project = fixture(t);
  project.write("demo/pom.xml", project.read("demo/pom.xml").replace(/<jte\.version>[^<]+</, "<jte.version>0.0.1<"));
  assert.throws(() => sync(undefined, { projectRoot: project.projectRoot, check: true }), /demo\/pom\.xml/);

  sync(currentVersion(project), { projectRoot: project.projectRoot });
  const jte = project.read("basecoat-jte/pom.xml").match(/<jte\.version>([^<]+)</)[1];
  assert.ok(project.read("demo/pom.xml").includes(`<jte.version>${jte}</jte.version>`));
});

test("check mode reports stale fields without writing", t => {
  const project = fixture(t);
  project.write("README.md", project.read("README.md").replace(/(basecoat-jte:)[^"\s]+/, "$19.9.9"));
  const before = project.snapshot();
  assert.throws(() => sync(undefined, { projectRoot: project.projectRoot, check: true }), /README\.md/);
  assert.deepEqual(project.snapshot(), before);
});

test("sync rejects invalid versions before writing", t => {
  const project = fixture(t);
  const before = project.snapshot();
  for (const version of ["1.2", "1.2.3-SNAPSHOT", "v1.2.3", "01.2.3", undefined]) {
    assert.throws(() => sync(version, { projectRoot: project.projectRoot }), /major\.minor\.patch/);
  }
  assert.deepEqual(project.snapshot(), before);
});

test("sync fails when a release field is missing", t => {
  const project = fixture(t);
  project.write("demo/pom.xml", project.read("demo/pom.xml").replace(/<basecoat-jte\.version>[^<]+<\/basecoat-jte\.version>/, ""));
  const before = project.snapshot();
  assert.throws(() => sync(nextPatch(currentVersion(project)), { projectRoot: project.projectRoot }),
    /Cannot find library version in demo\/pom\.xml/);
  assert.deepEqual(project.snapshot(), before);
});

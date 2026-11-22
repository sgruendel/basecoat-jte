# Releasing Basecoat for JTE

Only the `basecoat-jte` library module is published to Maven Central. The root aggregator POM and the
`demo` module are never deployed.

Maven Central releases are built, signed, and published locally. Keep the signing
private key and Central Portal credentials on your machine.

The [GitHub release workflow](.github/workflows/release.yml) runs when a
`vMAJOR.MINOR.PATCH` tag is pushed. It requires verification to pass (the library on
Java 21 and 25, the demo on Java 25, version checks, and script tests), then creates
a GitHub release with generated notes using GitHub's automatic token.

## Local setup

Install [mise](https://mise.jdx.dev/) and Node.js 22 or newer for the npm commands.
Before running a release, install the Temurin JDK 21 through mise:

```sh
mise install java@temurin-21
mise exec java@temurin-21 -- java -version
```

The version check should report Java 21. Both Maven Central npm scripts explicitly
run Maven with this JDK through `mise exec java@temurin-21` and build only the
library module (`-pl basecoat-jte`). The demo needs Java 25 and is verified by CI.

Configure a `central` server in your local `~/.m2/settings.xml`, adding it alongside
any existing server entries:

```xml
<server>
    <id>central</id>
    <username>YOUR_CENTRAL_TOKEN_USERNAME</username>
    <password>YOUR_CENTRAL_TOKEN_PASSWORD</password>
</server>
```

Both values come from the same Central Portal user token. Keep this file outside
the repository.

The signing private key must be in your local GPG keyring and its public key must
be available to Maven Central's validators. Maven uses your local GPG agent and
can prompt for the key's passphrase through pinentry. If you have multiple signing
keys, pass `-- -Dgpg.keyname=YOUR_SIGNING_KEY_FINGERPRINT` to both npm release commands.
No Central or GPG secrets are required in GitHub Actions.

## Prepare and publish

1. Select the release version. The library version matches the Basecoat version the component templates are
   ported from (see "Compatible with" in the README), so a release for Basecoat 1.1.0 is version 1.1.0:

   ```sh
   npm run sync-version -- 1.1.0
   ```

   This updates the library version and SCM tag in `basecoat-jte/pom.xml`, the
   library and JTE versions the demo builds against in `demo/pom.xml`, the README
   dependency snippets, and the npm package and lockfile versions. Repeating the
   command repairs stale fields even when the POM already has the requested version.
   `--check` only verifies files and never writes them.

2. Check the changes locally:

   ```sh
   npm test
   npm run sync-version -- --check
   mise exec java@25 -- ./mvnw verify
   npm run release:maven-central
   ```

   `./mvnw verify` builds and tests the library and the demo, which compiles every
   component template against the library. `release:maven-central` runs a clean build
   and the library tests on Java 21, creates the source and Javadoc JARs, and signs the
   release artifacts locally. It does not upload them. Enter the signing key's
   passphrase if GPG prompts.

3. Commit the intended files and push the release commit for CI verification:

   ```sh
   git add basecoat-jte/pom.xml demo/pom.xml README.md package.json package-lock.json
   git commit -m "chore(release): prepare 1.1.0"
   git push origin main
   ```

   Wait for the Verify workflow on that commit to pass.

4. From the committed release sources, sign and publish locally:

   ```sh
   npm run publish:maven-central
   ```

   `publish:maven-central` runs the Maven deployment lifecycle for the library,
   including tests and signing, and uploads the release to Maven Central. It enables
   automatic publication and waits for Central to report it as published; no manual
   Portal approval is required. Both npm commands omit batch mode so local GPG
   passphrase prompts can work.

5. After Maven Central publication succeeds, create and push the matching tag:

   ```sh
   git tag v1.1.0
   git push origin v1.1.0
   ```

   The GitHub Release action verifies the tagged commit and creates the GitHub
   release. Pushing a tag does not publish anything to Maven Central. Consumers copy
   the component templates from `demo/src/main/jte/basecoat/` at this tag.

Published Maven Central versions cannot be replaced. Use a new version for every
release. If publication succeeds but GitHub release creation fails, create the
GitHub release for the existing tag separately; do not deploy that version again.

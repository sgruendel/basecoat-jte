const fs = require("fs");
const path = require("path");

// Generates JTE templates for the canonical Lucide icon set using the shared
// `scripts/templates/lucide-icon.jte` stub and writes them to `src/main/jte/lucide`.
// Source SVGs are read from the installed Lucide package in `node_modules`.

const rootDir = __dirname + "/..";
const iconsAndAliasesPath = path.join(
  rootDir,
  "node_modules",
  "lucide",
  "dist",
  "esm",
  "iconsAndAliases.js",
);
const iconsDir = path.join(
  rootDir,
  "node_modules",
  "lucide",
  "dist",
  "esm",
  "icons",
);
const outputDir = path.join(rootDir, "src", "main", "jte", "lucide");
const templateFilePath = path.join(
  rootDir,
  "scripts",
  "templates",
  "lucide-icon.jte",
);
const templateSource = fs.readFileSync(templateFilePath, "utf8");
const templateTokenPattern = /\{\{([A-Z_]+)\}\}/g;

function toLowerCamelCase(value) {
  return value.charAt(0).toLowerCase() + value.slice(1);
}

function fileNameToLowerCamelCase(fileName) {
  return fileName.replace(/-([a-zA-Z0-9])/g, (_, letter) =>
    letter.toUpperCase(),
  );
}

function escapeAttributeValue(value) {
  return String(value).replace(/&/g, "&amp;").replace(/"/g, "&quot;");
}

function parseCanonicalIcons() {
  const source = fs.readFileSync(iconsAndAliasesPath, "utf8");
  const lines = source.split(/\r?\n/);
  const canonicalIcons = [];
  const seenFiles = new Set();

  for (const line of lines) {
    if (!line.startsWith("export ")) {
      continue;
    }

    const fileMatch = line.match(/from '\.\/icons\/(.+?)\.js';$/);
    if (!fileMatch) {
      continue;
    }

    const iconFileName = fileMatch[1];
    if (seenFiles.has(iconFileName)) {
      continue;
    }

    const exportMatches = [...line.matchAll(/default as ([A-Za-z0-9]+)/g)];
    if (exportMatches.length === 0) {
      throw new Error(`Could not parse export name from line: ${line}`);
    }

    seenFiles.add(iconFileName);
    canonicalIcons.push({
      exportName: exportMatches[0][1],
      iconFileName,
    });
  }

  return canonicalIcons;
}

function parseIconNodes(iconFileName) {
  const iconFilePath = path.join(iconsDir, `${iconFileName}.js`);
  const source = fs.readFileSync(iconFilePath, "utf8");
  const iconDefinitionMatch = source.match(
    /const\s+\w+\s*=\s*(\[[\s\S]*?\]);\s*export\s*\{/,
  );

  if (!iconDefinitionMatch) {
    throw new Error(`Could not parse icon definition from ${iconFilePath}`);
  }

  return Function(`return ${iconDefinitionMatch[1]};`)();
}

function renderChildNode([tagName, attributes]) {
  const entries = Object.entries(attributes);
  const renderedAttributes = entries.map(([name, value]) => {
    return `${name}="${escapeAttributeValue(value)}"`;
  });

  if (renderedAttributes.join(" ").length <= 80) {
    return `  <${tagName} ${renderedAttributes.join(" ")} />`;
  }

  return `  <${tagName}\n${renderedAttributes.map((attribute) => `    ${attribute}`).join("\n")}\n  />`;
}

function renderTemplateSource(values) {
  const expectedTokens = new Set(["ICON_FILE_NAME", "CHILDREN"]);

  for (const token of Object.keys(values)) {
    if (!expectedTokens.has(token)) {
      throw new Error(`Unexpected template token: ${token}`);
    }
  }

  const templateTokens = new Set(templateSource.matchAll(templateTokenPattern));
  for (const match of templateTokens) {
    const token = match[1];
    if (!Object.hasOwn(values, token)) {
      throw new Error(`Missing template value for ${token}`);
    }
  }

  const content = templateSource.replaceAll(
    templateTokenPattern,
    (_, token) => {
      return values[token];
    },
  );

  const unreplacedTokenMatch = content.match(templateTokenPattern);
  if (unreplacedTokenMatch) {
    throw new Error(`Unreplaced template token: ${unreplacedTokenMatch[1]}`);
  }

  return content;
}

function renderTemplate(exportName, iconFileName, childNodes) {
  const templateName = fileNameToLowerCamelCase(iconFileName);
  const children = childNodes.map(renderChildNode).join("\n");

  return {
    templateName,
    content: renderTemplateSource({
      ICON_FILE_NAME: iconFileName,
      CHILDREN: children,
    }),
  };
}

function main() {
  fs.mkdirSync(outputDir, { recursive: true });

  const icons = parseCanonicalIcons();
  const expectedTemplateNames = new Set();
  let writtenCount = 0;

  for (const icon of icons) {
    const childNodes = parseIconNodes(icon.iconFileName);
    const template = renderTemplate(
      icon.exportName,
      icon.iconFileName,
      childNodes,
    );
    const outputPath = path.join(outputDir, `${template.templateName}.jte`);

    expectedTemplateNames.add(`${template.templateName}.jte`);
    fs.writeFileSync(outputPath, template.content, "utf8");
    writtenCount += 1;
  }

  for (const fileName of fs.readdirSync(outputDir)) {
    if (!fileName.endsWith(".jte")) {
      continue;
    }

    if (!expectedTemplateNames.has(fileName)) {
      fs.unlinkSync(path.join(outputDir, fileName));
    }
  }

  console.log(`Generated ${writtenCount} Lucide JTE templates in ${outputDir}`);
}

main();

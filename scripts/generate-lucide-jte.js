const fs = require("fs");
const path = require("path");

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
const optionalSvgAttributes = [
  {
    parameterName: "role",
    parameterType: "String",
    defaultValue: "null",
    attributeName: "role",
  },
  {
    parameterName: "ariaLabel",
    parameterType: "String",
    defaultValue: "null",
    attributeName: "aria-label",
  },
  {
    parameterName: "ariaHidden",
    parameterType: "Boolean",
    defaultValue: "null",
    attributeName: "aria-hidden",
  },
  {
    parameterName: "focusable",
    parameterType: "Boolean",
    defaultValue: "null",
    attributeName: "focusable",
  },
];

function toLowerCamelCase(value) {
  return value.charAt(0).toLowerCase() + value.slice(1);
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
  const renderedAttributes = Object.entries(attributes)
    .map(([name, value]) => `${name}="${escapeAttributeValue(value)}"`)
    .join(" ");

  return `  <${tagName} ${renderedAttributes} />`;
}

function renderTemplateSource(values) {
  const expectedTokens = new Set([
    "ICON_FILE_NAME",
    "OPTIONAL_PARAMS",
    "OPTIONAL_ATTRIBUTES",
    "CHILDREN",
  ]);

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

function renderOptionalParams() {
  return optionalSvgAttributes
    .map(({ parameterType, parameterName, defaultValue }) => {
      return `@param ${parameterType} ${parameterName} = ${defaultValue}`;
    })
    .join("\n");
}

function renderOptionalAttributes() {
  return optionalSvgAttributes
    .map(({ parameterName, attributeName }) => {
      return `  ${attributeName}="\$\{${parameterName}}"`;
    })
    .join("\n");
}

function renderTemplate(exportName, iconFileName, childNodes) {
  const templateName = toLowerCamelCase(exportName);
  const children = childNodes.map(renderChildNode).join("\n");

  return {
    templateName,
    content: renderTemplateSource({
      ICON_FILE_NAME: iconFileName,
      OPTIONAL_PARAMS: renderOptionalParams(),
      OPTIONAL_ATTRIBUTES: renderOptionalAttributes(),
      CHILDREN: children,
    }),
  };
}

function main() {
  fs.mkdirSync(outputDir, { recursive: true });

  const icons = parseCanonicalIcons();
  let writtenCount = 0;

  for (const icon of icons) {
    const childNodes = parseIconNodes(icon.iconFileName);
    const template = renderTemplate(
      icon.exportName,
      icon.iconFileName,
      childNodes,
    );
    const outputPath = path.join(outputDir, `${template.templateName}.jte`);

    fs.writeFileSync(outputPath, template.content, "utf8");
    writtenCount += 1;
  }

  console.log(`Generated ${writtenCount} Lucide JTE templates in ${outputDir}`);
}

main();

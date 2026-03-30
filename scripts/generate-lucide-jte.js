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

function renderTemplate(exportName, iconFileName, childNodes) {
  const templateName = toLowerCamelCase(exportName);
  const children = childNodes.map(renderChildNode).join("\n");

  return {
    templateName,
    content: `<%-- see https://lucide.dev/icons/${iconFileName} --%>\n\n@param String classAppend = null\n@param int size = 24\n@param String color = "currentColor"\n@param int strokeWidth = 2\n@param boolean absoluteStrokeWidth = false\n\n<%-- see https://github.com/lucide-icons/lucide/blob/main/packages/vue/src/Icon.ts#L50 --%>\n!{ final var calculatedStrokeWidth = absoluteStrokeWidth ? Double.toString(strokeWidth * 24.0 / size) : Integer.toString(strokeWidth); }\n\n<svg\n  xmlns="http://www.w3.org/2000/svg"\n  width="\${size}"\n  height="\${size}"\n  viewBox="0 0 24 24"\n  fill="none"\n  stroke="\${color}"\n  stroke-width="\${calculatedStrokeWidth}"\n  stroke-linecap="round"\n  stroke-linejoin="round"\n  class="lucide lucide-${iconFileName}-icon lucide-${iconFileName} \${classAppend}"\n>\n${children}\n</svg>\n`,
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

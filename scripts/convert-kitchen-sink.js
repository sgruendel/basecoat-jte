const fs = require("fs");
const path = require("path");

// Converts kitchen sink Nunjucks component pages into JTE partials and updates
// the aggregate `kitchenSink.jte` page. The converter maps Lucide shortcodes to
// LucideIcons helpers and comments out all non-Lucide macro usage.
// Macro-heavy components that have been ported to native JTE are sourced from
// dedicated files in `scripts/templates/kitchen-sink/` so reruns stay reproducible.

const rootDir = path.join(__dirname, "..");
const kitchenSinkDir = path.join(rootDir, "demo", "src", "main", "jte", "kitchenSink");
const kitchenSinkPagePath = path.join(
  rootDir,
  "demo",
  "src",
  "main",
  "jte",
  "kitchenSink.jte",
);
const kitchenSinkTemplateDir = path.join(
  rootDir,
  "scripts",
  "templates",
  "kitchen-sink",
);

const slugToTemplateName = {
  "alert-dialog": "alertDialog",
  "dropdown-menu": "dropdownMenu",
  "radio-group": "radioGroup",
};

const explicitTemplateFileByName = {
  alertDialog: "alertDialog.jte",
  breadcrumb: "breadcrumb.jte",
  combobox: "combobox.jte",
  dialog: "dialog.jte",
  dropdownMenu: "dropdownMenu.jte",
  popover: "popover.jte",
  select: "select.jte",
  skeleton: "skeleton.jte",
  tabs: "tabs.jte",
  toast: "toast.jte",
};

const lucidePattern =
  /\{%\s*lucide\s+"([^"]+)"(?:\s*,\s*\{([\s\S]*?)\})?\s*%\}/g;
const lucideAttributePattern = /"([^"]+)"\s*:\s*"([^\"]*)"/g;

function camelFromSlug(slug) {
  return slug.replace(/-([a-zA-Z0-9])/g, (_, letter) => letter.toUpperCase());
}

function templateNameFromStem(stem) {
  return slugToTemplateName[stem] || camelFromSlug(stem);
}

function parseLucideAttributes(source) {
  if (!source) {
    return [];
  }

  return [...source.matchAll(lucideAttributePattern)].map(([, key, value]) => ({
    key,
    value,
  }));
}

function renderLucideCall(iconName, attributeSource) {
  const camelName = camelFromSlug(iconName);
  const helperName = `lucide${camelName[0].toUpperCase()}${camelName.slice(1)}`;
  const attrs = [];

  for (const attribute of parseLucideAttributes(attributeSource)) {
    switch (attribute.key) {
      case "class":
        attrs.push(`"class", "${attribute.value}"`);
        break;
      case "role":
        attrs.push(`"role", "${attribute.value}"`);
        break;
      case "aria-label":
        attrs.push(`"aria-label", "${attribute.value}"`);
        break;
      case "aria-hidden":
        attrs.push(`"aria-hidden", "${attribute.value.toLowerCase()}"`);
        break;
      case "focusable":
        attrs.push(`"focusable", "${attribute.value.toLowerCase()}"`);
        break;
      default:
        break;
    }
  }

  const options = attrs.length === 1
    ? `.attr(${attrs[0]})`
    : attrs.length > 1 ? `.attrs(Map.of(${attrs.join(", ")}))` : "";
  return `\${${helperName}()${options}}`;
}

function commentOutNonLucideTags(line) {
  return line.replace(/(\{%[\s\S]*?%\}|\{\{[\s\S]*?\}\})/g, (match) => {
    if (match.includes("lucide")) {
      return match;
    }

    return `<%-- ${match.replace(/\s+/g, " ").trim()} --%>`;
  });
}

function convertLine(line) {
  let converted = line.replace(/\$\{/g, "\\${");
  converted = converted.replace(
    lucidePattern,
    (_, iconName, attributeSource) => {
      return renderLucideCall(iconName, attributeSource);
    },
  );

  converted = commentOutNonLucideTags(converted);
  converted = converted.replace(/`\\\$\{percent\}%`/g, "percent + '%'");

  return converted;
}

function convertTemplate(source) {
  const imports = ["@import static io.github.sgruendel.lucide.jte.LucideIcons.*"];
  if ([...source.matchAll(lucidePattern)].some(([, iconName, attributeSource]) =>
    renderLucideCall(iconName, attributeSource).includes(".attrs(Map.of("))) {
    imports.push("@import java.util.Map");
  }
  return (
    imports.join("\n") + "\n\n" + source
      .split(/\r?\n/)
      .map(convertLine)
      .join("\n")
      .replace(/\n{3,}/g, "\n\n")
      .trim() + "\n"
  );
}

function normalizeDocsLinks(source) {
  return source.replaceAll(
    'href="/components/',
    'href="https://basecoatui.com/components/',
  );
}

function loadExplicitTemplate(templateName) {
  const fileName = explicitTemplateFileByName[templateName];
  if (!fileName) {
    return null;
  }

  return fs.readFileSync(path.join(kitchenSinkTemplateDir, fileName), "utf8");
}

function renderKitchenSinkPage(templateNames) {
  const componentCalls = templateNames
    .map(
      (templateName) =>
        `                @template.kitchenSink.${templateName}()`,
    )
    .join("\n");

  return `@template.layouts.layout(\n  title = "Kitchen Sink",\n  description = "A collection of all the components available in Basecoat.",\n  content = @\`\n    <div class="flex gap-x-10 justify-center">\n        <div>\n            <header class="space-y-2 mb-8">\n                <h1 class="text-3xl font-semibold tracking-tight">Kitchen Sink</h1>\n                <p class="text-muted-foreground">A collection of all the components available in Basecoat.</p>\n            </header>\n            <div class="grid gap-4 flex-1">\n${componentCalls}\n            </div>\n        </div>\n        <div class="hidden text-sm xl:block w-full max-w-50">\n            <%-- toc omitted --%>\n        </div>\n    </div>\n  \`\n)\n`;
}

function main() {
  const fileNames = fs
    .readdirSync(kitchenSinkDir)
    .filter((fileName) => fileName.endsWith(".njk"))
    .sort();

  const templateNames = [];

  for (const fileName of fileNames) {
    const inputPath = path.join(kitchenSinkDir, fileName);
    const stem = path.basename(fileName, ".njk");
    const templateName = templateNameFromStem(stem);
    const outputPath = path.join(kitchenSinkDir, `${templateName}.jte`);
    const source = fs.readFileSync(inputPath, "utf8");
    const explicitTemplate = loadExplicitTemplate(templateName);
    const output = normalizeDocsLinks(
      explicitTemplate || convertTemplate(source),
    );

    fs.writeFileSync(outputPath, output, "utf8");
    templateNames.push(templateName);
  }

  fs.writeFileSync(
    kitchenSinkPagePath,
    renderKitchenSinkPage(templateNames),
    "utf8",
  );
  console.log(`Converted ${fileNames.length} kitchen sink templates.`);
}

main();

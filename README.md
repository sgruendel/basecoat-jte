# basecoat-jte

basecoat components as jte templates

Lucide JTE templates

These templates are generated from the installed `lucide` npm package.

## Regenerate templates

From the repository root, run:

```sh
npm run generate:lucide-jte
```

The generator script reads `node_modules/lucide/dist/esm/iconsAndAliases.js` and writes templates into `src/main/jte/lucide`.

## Canonical icons only

Generation uses canonical Lucide icons only, not alias exports.

- `iconsAndAliases.js` contains multiple alias names for some icons
- the generator keeps the first export for each icon file
- this avoids duplicate templates for the same SVG

Example: `AlarmCheck` is generated from `alarm-clock-check`, while the alias `AlarmClockCheck` is not generated as a second template.

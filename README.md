# basecoat-jte

 [![Maven Tests](https://github.com/sgruendel/basecoat-jte/actions/workflows/maven-tests.yml/badge.svg)](https://github.com/sgruendel/basecoat-jte/actions/workflows/maven-tests.yml)

JTE templates for [Basecoat](https://basecoatui.com/) components and [Lucide](https://lucide.dev/) icons.

This repository shows how to use Basecoat with:

- reusable JTE component templates in `src/main/jte/basecoat`
- generated Lucide icon templates in `src/main/jte/lucide`
- example usages in `src/main/jte/kitchenSink`
- toast partials in `src/main/jte/partials/toast`

## What This Repo Contains

- `src/main/jte/basecoat`
  JTE templates that mirror the original Basecoat Nunjucks macros.
- `src/main/jte/lucide`
  Generated JTE templates for canonical Lucide icons.
- `src/main/jte/kitchenSink`
  Example pages showing how to use the components and icons.
- `src/main/jte/partials/toast`
  Small toast partials used by the kitchen sink examples.
- `scripts/generate-lucide-jte.js`
  Generates Lucide JTE templates from the installed `lucide` npm package.

## Using Lucide Icons

Each icon is a JTE template under `src/main/jte/lucide`.

Example:

```jte
@import java.util.Map

@template.lucide.bookOpen(attrs = Map.of("class", "size-4"))
@template.lucide.circleCheck(attrs = Map.of("aria-hidden", "true"))
@template.lucide.loaderCircle(
  attrs = Map.of(
    "class", "animate-spin",
    "role", "status",
    "aria-label", "Loading"
  )
)
```

Supported icon params:

- `size`
- `color`
- `strokeWidth`
- `absoluteStrokeWidth`
- `attrs`

`attrs` is the place for HTML attributes such as:

- `class`
- `role`
- `aria-label`
- `aria-hidden`
- `focusable`
- `data-*`

Important:

- for ARIA and `focusable`, use string values like `"true"` and `"false"`
- icon names are generated from canonical Lucide file names, not alias export names

Example:

- `circle-check` -> `@template.lucide.circleCheck()`
- `circle-check-big` -> `@template.lucide.circleCheckBig()`

## Using Basecoat Component Templates

Reusable component templates live in `src/main/jte/basecoat`.

Current component templates include:

- `dialog.jte`
- `dropdownMenu.jte`
- `popover.jte`
- `select.jte`
- `tabs.jte`
- `toast.jte`
- `toaster.jte`

Most of these templates support an `attrs`-style API through `Map<?, ?>` parameters for passing HTML attributes through to the rendered elements.

Example dialog usage:

```jte
@import java.util.Map

@template.basecoat.dialog(
  id = "demo-dialog",
  trigger = "Open dialog",
  triggerAttrs = Map.of("class", "btn-outline"),
  title = "Edit profile",
  description = "Make changes to your profile here.",
  content = @`
    <form class="form grid gap-4">
      <div class="grid gap-3">
        <label for="name">Name</label>
        <input id="name" type="text" value="Pedro Duarte" />
      </div>
    </form>


  `,
  footer = @`
    <button type="button" class="btn-outline">Cancel</button>
    <button type="button" class="btn">Save</button>


  `
)
```

Example dropdown usage:

```jte
@import java.util.Map

@template.basecoat.dropdownMenu(
  id = "demo-dropdown",
  triggerText = "Open",
  triggerAttrs = Map.of("class", "btn-outline"),
  popoverAttrs = Map.of("class", "min-w-56"),
  content = @`
    <div role="menuitem">Profile</div>
    <div role="menuitem">Billing</div>
    <hr role="separator">
    <div role="menuitem">Log out</div>


  `
)
```

Example select usage:

```jte
@import java.util.List
@import java.util.Map
@import com.basecoatui.jte.util.BasecoatSelect.Item

@template.basecoat.select(
  id = "fruit-select",
  name = "fruit",
  triggerAttrs = Map.of("class", "w-[180px]"),
  selected = "blueberry",
  items = List.of(
    Item.of("Fruits", List.of(
      Item.of("Apple", "apple"),
      Item.of("Banana", "banana"),
      Item.of("Blueberry", "blueberry")
    ))
  )
)
```

## Toast Partials

Example toast partials live in `src/main/jte/partials/toast`.

They are intended to be rendered into the toaster container, for example via htmx.

Example toaster:

```jte
@template.basecoat.toaster()
```

Example toast partial usage:

```jte
@template.partials.toast.success()
```

## Kitchen Sink

The kitchen sink examples under `src/main/jte/kitchenSink` are the best reference for how the JTE templates are meant to be used.

They show:

- direct Lucide icon usage
- Basecoat component template usage
- form/select/dropdown/tab/dialog patterns
- toast examples and partial rendering

## Regenerate Lucide Icon Templates

From the repository root:

```sh
npm run generate:lucide-jte
```

## Run The Demo

The Spring Boot app serves the kitchen sink demo at `/`.

For local development, run Spring Boot and the webpack dev server in two terminals.

1. Start the Spring Boot app on port `8080`:

```sh
./mvnw spring-boot:run
```

2. Start the webpack dev server on port `8081`:

```sh
npm install
npm run devserver
```

3. Open the demo in your browser:

```text
http://localhost:8081
```

The webpack dev server proxies requests to the Spring Boot app on `http://localhost:8080`, while serving the frontend assets with live reload.

If you do not need the webpack dev server, you can also build the frontend assets once and run only Spring Boot:

```sh
npm install
npm run build
./mvnw spring-boot:run
```

Then open:

```text
http://localhost:8080
```

## Build

```sh
./mvnw -q -DskipTests compile
```

## Notes

- Lucide templates are generated from the installed `lucide` package in `node_modules`
- only canonical Lucide icons are generated, not duplicate alias exports
- generated icon names follow the icon file name, converted to lower camel case

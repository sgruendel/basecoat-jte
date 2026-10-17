# basecoat-jte

[![Maven Tests](https://github.com/sgruendel/basecoat-jte/actions/workflows/maven-tests.yaml/badge.svg)](https://github.com/sgruendel/basecoat-jte/actions/workflows/maven-tests.yaml)

JTE templates for [Basecoat](https://basecoatui.com/) components, using
[Lucide for JTE](https://github.com/sgruendel/lucide-jte) for icons.

Compatible with
[Basecoat 1.0.1](https://github.com/hunvreus/basecoat/releases/tag/1.0.1) and
[Lucide for JTE 1.59.0](https://github.com/sgruendel/lucide-jte).

This repository shows how to use Basecoat with:

- reusable JTE component templates in `src/main/jte/basecoat`
- Lucide icons from the `io.github.sgruendel:lucide-jte` Maven dependency
- example usages in `src/main/jte/kitchenSink`
- toast partials in `src/main/jte/partials/toast`

## What This Repo Contains

- `src/main/jte/basecoat`
  JTE templates that mirror the original Basecoat Nunjucks macros.
- `src/main/jte/kitchenSink`
  Example pages showing how to use the components and icons.
- `src/main/jte/partials/toast`
  Small toast partials used by the kitchen sink examples.

The kitchen sink examples are still based on the previous Basecoat version
0.3.11 and might look a bit off compared to the current Basecoat version 1.0.1,
but they are the best reference for how the JTE templates are meant to be used.

For icon imports, styling, attributes, naming, and accessibility, see the
[Lucide for JTE documentation](https://github.com/sgruendel/lucide-jte#use-icons-in-a-jte-template).

## Using Basecoat Component Templates

Reusable component templates live in `src/main/jte/basecoat`.

Current component templates include:

- `combobox.jte`
- `command.jte`
- `commandDialog.jte`
- `commandInput.jte`
- `dialog.jte`
- `dropdownMenu.jte`
- `popover.jte`
- `select.jte`
- `sidebar.jte`
- `tabs.jte`
- `toast.jte`
- `toaster.jte`

Supporting render helpers are also present for nested item structures:

- `commandRenderItems.jte`
- `dropdownRenderItems.jte`
- `selectRenderItems.jte`
- `sidebarRenderItems.jte`

Most of these templates support an `attrs`-style API through `Map<?, ?>` parameters for passing HTML attributes through
to the rendered elements.

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
    <hr role="separator" />
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
    Item.of(
      "Fruits",
      List.of(Item.of("Apple", "apple"), Item.of("Banana", "banana"), Item.of("Blueberry", "blueberry"))
    )
  )
)
```

## Toast Partials

Example toast partials live in `src/main/jte/partials/toast`.

Current toast partials include:

- `success.jte`
- `info.jte`
- `warning.jte`
- `error.jte`

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

The kitchen sink examples under `src/main/jte/kitchenSink` are the best reference for how the JTE templates are meant to
be used.

They show:

- direct Lucide icon usage
- Basecoat component template usage
- form/select/dropdown/tab/dialog patterns
- toast examples and partial rendering

## Run The Demo

The Spring Boot app serves the kitchen sink demo at `/`.

Requires Node.js 20.19+ or 22.12+ and Java 25+.

For local development, run Spring Boot and the Vite dev server in two terminals.

1. Start the Spring Boot app on port `8080`:

```sh
./mvnw spring-boot:run
```

1. Start the Vite dev server on port `8081`:

```sh
npm install
npm run dev
```

1. Open the demo in your browser:

```text
http://localhost:8081
```

The Vite dev server proxies pages and backend requests to the Spring Boot app on `http://localhost:8080`.
It serves JavaScript modules and CSS directly, with CSS hot updates and page reloads for JTE template changes.

To run without the Vite dev server, build the frontend assets once and run only Spring Boot:

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
npm ci
npm run build
./mvnw -q -DskipTests compile
```

Vite writes production JavaScript and CSS to `target/classes/static`, where Spring Boot serves them.
Rebuild the frontend after `./mvnw clean`, which removes that directory.

## Notes

- Lucide icons come from the Maven dependency and need no local template generation
- only canonical Lucide icons have helpers, not duplicate alias exports
- icon helper names use the `lucide` prefix followed by the camel case icon name

## Prompt to convert from shadcn-examples

This repository is a conversion of the React based shadcn-examples which are linked here under shadcn-examples/
and running locally on <http://localhost:3000>.

It's a JTE base Spring Boot app using <https://basecoatui.com/llms.txt> and some JTE templates instead of the optional Nunjucks or Jinja macros
in src/main/jte/basecoat/

So far, the Admin Dashboard example has been ported with some TODOs still open, except for the Data Table on the Outline tab. Currently, there is outlinePanel.jte with some generated, non-functional Javascript code to replicate React behavior.

Ignore the JavaScript and create a proper server-side solution using pagination, sorting etc. endpoints in ExampleController using htmx where it makes sense. The backend should use the same fake data as the React clientside Javascript has, but the implementation should allow for later proper db service layer to be added without refactoring of APIs.

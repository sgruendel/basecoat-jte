# basecoat-jte

[![Verify](https://github.com/sgruendel/basecoat-jte/actions/workflows/verify.yml/badge.svg)](https://github.com/sgruendel/basecoat-jte/actions/workflows/verify.yml)

JTE templates for [Basecoat](https://basecoatui.com/) components, using
[Lucide for JTE](https://github.com/sgruendel/lucide-jte) for icons.

Compatible with
[Basecoat 1.1.0](https://github.com/hunvreus/basecoat/releases/tag/1.1.0) and
[Lucide for JTE 1.70.0](https://github.com/sgruendel/lucide-jte/releases/tag/v1.70.0).

## What This Repo Contains

- `basecoat-jte`
  The library published to Maven Central as `io.github.sgruendel:basecoat-jte`: `JteHelper`, which renders
  `attrs`-style maps as escaped HTML attributes, the sealed `BasecoatItem` hierarchy the component templates take as
  items (see [Items](#items)), and the `BasecoatTab` and `BasecoatToast` records.
  Requires Java 21+ and depends on `jte-runtime`. It expects Jackson 3 from the application, as Spring Boot 4 web
  applications provide; only `JsonHelper` needs it, which the select and combobox templates use.
- `demo`
  A Spring Boot app with the component templates and examples. It is not published.
  - `demo/src/main/jte/basecoat`
    JTE templates that mirror the original Basecoat Nunjucks macros.
  - `demo/src/main/jte/kitchenSink`
    Example pages showing how to use the components and icons.
  - `demo/src/main/jte/examples/adminDashboard`
    A port of the shadcn admin dashboard example.
  - `demo/src/main/jte/partials/toast`
    Small toast partials used by the kitchen sink examples.

The kitchen sink examples are still based on the previous Basecoat version
0.3.11 and might look a bit off compared to the current Basecoat version 1.1.0,
but they are the best reference for how the JTE templates are meant to be used.

For icon imports, styling, attributes, naming, and accessibility, see the
[Lucide for JTE documentation](https://github.com/sgruendel/lucide-jte#use-icons-in-a-jte-template).

## Installation

The component templates are not part of the library JAR. You copy them into your project and own them from then on,
like shadcn/ui components. The library provides the Java classes they need, so you don't have to copy those too.

1. Add the library and Lucide for JTE to your build. The library is meant for Spring Boot 4 applications: it declares
   Jackson 3 (`tools.jackson.core:jackson-databind`) as `provided`, which the Spring Boot 4 web starter includes.

   Spring Boot 3 and earlier include Jackson 2 (`com.fasterxml.jackson`) instead. Without Jackson 3, the select and
   combobox templates fail with a `NoClassDefFoundError` when rendering multiple selection. Other applications must
   add `tools.jackson.core:jackson-databind` 3.x themselves; this setup is untested with Spring Boot 3.

   Maven:

   ```xml
   <dependency>
       <groupId>io.github.sgruendel</groupId>
       <artifactId>basecoat-jte</artifactId>
       <version>1.1.0</version>
   </dependency>
   <dependency>
       <groupId>io.github.sgruendel</groupId>
       <artifactId>lucide-jte</artifactId>
       <version>1.73.0</version>
   </dependency>
   ```

   Gradle:

   ```kotlin
   implementation("io.github.sgruendel:basecoat-jte:1.1.0")
   implementation("io.github.sgruendel:lucide-jte:1.73.0")
   ```

2. Copy `demo/src/main/jte/basecoat/` from the matching `vX.Y.Z` tag into your project's `src/main/jte/basecoat/`.
   The templates import their helpers from `io.github.sgruendel.basecoat.jte`.

3. Include Basecoat's CSS and JavaScript from the [`basecoat-css`](https://www.npmjs.com/package/basecoat-css)
   npm package, as the demo does in `demo/src/main/resources/css/app.css` and `demo/src/main/resources/js/app.js`.

To update, diff `demo/src/main/jte/basecoat/` between the old and new release tags and apply the changes to your
copies.

## Using Basecoat Component Templates

Reusable component templates live in `demo/src/main/jte/basecoat`.

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
@import io.github.sgruendel.basecoat.jte.BasecoatItem
@import io.github.sgruendel.basecoat.jte.BasecoatItem.Group
@import io.github.sgruendel.basecoat.jte.BasecoatItem.Option

@template.basecoat.select(
  id = "fruit-select",
  name = "fruit",
  triggerAttrs = Map.of("class", "w-[180px]"),
  selected = "blueberry",
  items = List.of(
    Group.of(
      "Fruits",
      List.of(Option.of("Apple", "apple"), Option.of("Banana", "banana"), Option.of("Blueberry", "blueberry"))
    ),
    BasecoatItem.SEPARATOR,
    Option.of(@`<span class="text-muted-foreground">Other</span>`, "other").withLabel("Other")
  )
)
```

### Items

The select, combobox, dropdown menu, command, and sidebar templates take their items as a
`List<? extends BasecoatItem>`. `BasecoatItem` is a sealed interface: `Group` and `Separator` (via
`BasecoatItem.SEPARATOR`) work in every component, and each component has its own leaf types.

| Component | Leaf types |
| --- | --- |
| `select`, `combobox` | `Option` |
| `dropdownMenu`, `command`, `commandDialog` | `MenuItem` |
| `sidebar` | `NavItem`, `Submenu` |

A template throws an `IllegalArgumentException` for leaf types it doesn't render. Labels are plain text and
HTML-escaped. Each leaf also has a factory taking JTE `Content` for rich labels, which is rendered instead of the text
label. Optional fields are set with `with*` methods, for example
`MenuItem.of("Profile").withUrl("/profile").withIcon(lucideUser()).withDisabled(true)`.

## Toast Partials

Example toast partials live in `demo/src/main/jte/partials/toast`.

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

The kitchen sink examples under `demo/src/main/jte/kitchenSink` are the best reference for how the JTE templates are meant to
be used.

They show:

- direct Lucide icon usage
- Basecoat component template usage
- form/select/dropdown/tab/dialog patterns
- toast examples and partial rendering

## Run The Demo

The Spring Boot app serves the kitchen sink demo at `/`.

Requires Node.js 20.19+ or 22.12+ and Java 25+.

The demo depends on the library module. Install it into your local Maven repository first, and again after
changing it:

```sh
./mvnw install -pl basecoat-jte
```

For local development, run Spring Boot and the Vite dev server in two terminals.

1. Start the Spring Boot app on port `8080`:

```sh
./mvnw -pl demo spring-boot:run
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
./mvnw -pl demo spring-boot:run
```

Then open:

```text
http://localhost:8080
```

## Build

```sh
npm ci
npm run build
./mvnw verify
```

`./mvnw verify` builds and tests both modules; the library alone builds with `./mvnw verify -pl basecoat-jte`.
The library targets Java 21, while the demo needs Java 25.

Vite writes production JavaScript and CSS to `demo/target/classes/static`, where Spring Boot serves them.
Rebuild the frontend after `./mvnw clean`, which removes that directory.

## Releasing

Only the `basecoat-jte` library is published to Maven Central. See [RELEASING.md](RELEASING.md).

## Notes

- Lucide icons come from the Maven dependency and need no local template generation
- only canonical Lucide icons have helpers, not duplicate alias exports
- icon helper names use the `lucide` prefix followed by the camel case icon name

## Prompt to convert from shadcn-examples

This repository is a conversion of the React based shadcn-examples which are linked here under shadcn-examples/
and running locally on <http://localhost:3000>.

It's a JTE base Spring Boot app using <https://basecoatui.com/llms.txt> and some JTE templates instead of the optional Nunjucks or Jinja macros
in demo/src/main/jte/basecoat/

So far, the Admin Dashboard example has been ported with some TODOs still open, except for the Data Table on the Outline tab. Currently, there is outlinePanel.jte with some generated, non-functional Javascript code to replicate React behavior.

Ignore the JavaScript and create a proper server-side solution using pagination, sorting etc. endpoints in ExampleController using htmx where it makes sense. The backend should use the same fake data as the React clientside Javascript has, but the implementation should allow for later proper db service layer to be added without refactoring of APIs.

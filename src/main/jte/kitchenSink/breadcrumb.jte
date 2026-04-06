@import java.util.List
@import java.util.Map
@import com.basecoatui.jte.util.BasecoatSelect.Item

<section id="breadcrumb" class="w-full rounded-lg border scroll-mt-14">
  <header class="border-b px-4 py-3 flex items-center justify-between">
    <h2 class="text-sm font-medium">Breadcrumb</h2>
    <a
      href="https://basecoatui.com/components/breadcrumb"
      class="text-muted-foreground hover:text-foreground"
      data-tooltip="See documentation"
      data-side="left"
    >
      @template.lucide.bookOpen(attrs = Map.of("class", "size-4"))
    </a>
  </header>
  <div class="p-4">
    <ol
      class="text-muted-foreground flex flex-wrap items-center gap-1.5 text-sm break-words sm:gap-2.5"
    >
      <li class="inline-flex items-center gap-1.5">
        <a href="#" class="hover:text-foreground transition-colors">Home</a>
      </li>
      <li>@template.lucide.chevronRight(attrs = Map.of("class", "size-3.5"))</li>
      <li class="inline-flex items-center gap-1.5">
        @template.basecoat.dropdownMenu(
          id = "demo-breadcrumb-menu",
          triggerContent = @`@template.lucide.ellipsis()`,
          triggerAttrs = Map.of("class", "flex size-9 items-center justify-center h-4 w-4 hover:text-foreground cursor-pointer"),
          popoverAttrs = Map.of("class", "p-1"),
          items = List.of(
            Item.of("Documentation"),
            Item.of("Themes"),
            Item.of("GitHub")
          )
        )
      </li>
      <li>@template.lucide.chevronRight(attrs = Map.of("class", "size-3.5"))</li>
      <li class="inline-flex items-center gap-1.5">
        <a href="#" class="hover:text-foreground transition-colors"
          >Components</a
        >
      </li>
      <li>@template.lucide.chevronRight(attrs = Map.of("class", "size-3.5"))</li>
      <li class="inline-flex items-center gap-1.5">
        <span class="text-foreground font-normal">Breadcrumb</span>
      </li>
    </ol>
  </div>
</section>

@import java.util.Map

<section id="popover" class="w-full rounded-lg border scroll-mt-14">
  <header class="border-b px-4 py-3 flex items-center justify-between">
    <h2 class="text-sm font-medium">Popover</h2>
    <a
      href="https://basecoatui.com/components/popover"
      class="text-muted-foreground hover:text-foreground"
      data-tooltip="See documentation"
      data-side="left"
    >
      @template.lucide.bookOpen(classAppend = "size-4")
    </a>
  </header>
  <div class="p-4">
    @template.basecoat.popover(
      id = "demo-popover",
      triggerText = "Open popover",
      triggerAttrs = Map.of("class", "btn-outline"),
      popoverAttrs = Map.of("class", "w-80"),
      content = @`
        <div class="grid gap-4">
          <header class="grid gap-1.5">
            <h4 class="leading-none font-medium">Dimensions</h4>
            <p class="text-muted-foreground text-sm">Set the dimensions for the layer.</p>
          </header>
          <form class="form grid gap-2">
            <div class="grid grid-cols-3 items-center gap-4">
              <label for="demo-popover-width">Width</label>
              <input type="text" id="demo-popover-width" value="100%" class="col-span-2 h-8"/>
            </div>
            <div class="grid grid-cols-3 items-center gap-4">
              <label for="demo-popover-max-width">Max. width</label>
              <input type="text" id="demo-popover-max-width" value="300px" class="col-span-2 h-8"/>
            </div>
            <div class="grid grid-cols-3 items-center gap-4">
              <label for="demo-popover-height">Height</label>
              <input type="text" id="demo-popover-height" value="25px" class="col-span-2 h-8"/>
            </div>
            <div class="grid grid-cols-3 items-center gap-4">
              <label for="demo-popover-max-height">Max. height</label>
              <input type="text" id="demo-popover-max-height" value="none" class="col-span-2 h-8"/>
            </div>
          </form>
        </div>

      `
    )
  </div>
</section>

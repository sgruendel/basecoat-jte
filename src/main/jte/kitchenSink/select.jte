@import java.util.List
@import java.util.Map
@import com.basecoatui.jte.util.BasecoatSelect.Item

<section id="select" class="w-full rounded-lg border scroll-mt-14">
  <header class="border-b px-4 py-3 flex items-center justify-between">
    <h2 class="text-sm font-medium">Select</h2>
    <a
      href="https://basecoatui.com/components/select"
      class="text-muted-foreground hover:text-foreground"
      data-tooltip="See documentation"
      data-side="left"
    >
      @template.lucide.bookOpen(classAppend = "size-4")
    </a>
  </header>
  <div class="p-4 gap">
    <div class="flex flex-col gap-4">
      <div class="flex flex-wrap items-center gap-2 md:flex-row">
        <select class="select w-[180px]">
          <optgroup label="Fruits">
            <option>Apple</option>
            <option>Banana</option>
            <option>Blueberry</option>
          </optgroup>
          <optgroup label="Grapes">
            <option>Pineapple</option>
          </optgroup>
        </select>
        <select class="select w-[180px]" disabled>
          <option>Disabled</option>
        </select>
      </div>

      <div class="flex flex-wrap items-center gap-4">
        <div class="flex flex-wrap items-center gap-2 md:flex-row">
          @template.basecoat.select(
            id = "select-default",
            triggerAttrs = Map.of("class", "w-[180px]"),
            selected = "blueberry",
            items = List.of(
              Item.of(
                "Fruits",
                List.of(
                  Item.of("Apple", "apple"),
                  Item.of("Banana", "banana"),
                  Item.of("Blueberry", "blueberry")
                )
              ),
              Item.of(
                "Grapes",
                List.of(
                  Item.of("Pineapple", "pineapple")
                )
              )
            )
          )
          @template.basecoat.select(
            id = "select-scrollbar",
            triggerAttrs = Map.of("class", "w-[180px]"),
            listboxAttrs = Map.of("class", "scrollbar overflow-y-auto max-h-64"),
            options = @`
              @for(int i = 0; i < 100; i++)
                <div role="option" data-value="item-${i}">Item ${i}</div>
              @endfor

            `
          )

          @template.basecoat.select(
            id = "select-disabled",
            triggerAttrs = Map.of("disabled", true, "class", "w-[180px]"),
            options = @`
              <div role="option" data-value="disabled">Disabled</div>

            `
          )

          @template.basecoat.select(
            id = "select-with-icon",
            name = "chart-type",
            triggerAttrs = Map.of("class", "w-[180px]"),
            options = @`
              <div type="button" role="option" data-value="bar">
                <span class="flex items-center gap-2">
                  @template.lucide.chartBar(
                classAppend = "text-muted-foreground"
              )
                  Bar
                </span>
              </div>
              <div type="button" role="option" data-value="line">
                <span class="flex items-center gap-2">
                  @template.lucide.chartLine(
                classAppend = "text-muted-foreground"
              )
                  Line
                </span>
              </div>
              <div type="button" role="option" data-value="pie">
                <span class="flex items-center gap-2">
                  @template.lucide.chartPie(
                classAppend = "text-muted-foreground"
              )
                  Pie
                </span>
              </div>






            `
          )
        </div>
      </div>
    </div>
  </div>
</section>

<section id="select"  class="w-full rounded-lg border scroll-mt-14">
  <header class="border-b px-4 py-3 flex items-center justify-between">
    <h2 class="text-sm font-medium">Select</h2>
    <a href="https://basecoatui.com/components/select" class="text-muted-foreground hover:text-foreground" data-tooltip="See documentation" data-side="left">
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
          <div id="select-default" class="select">
            <button type="button" class="w-[180px] btn-outline" id="select-default-trigger" aria-haspopup="listbox" aria-expanded="false" aria-controls="select-default-listbox">
              <span></span>
              @template.lucide.chevronsUpDown(classAppend = "text-muted-foreground opacity-50 shrink-0")
            </button>
            <div id="select-default-popover" data-popover aria-hidden="true">
              <div role="listbox" id="select-default-listbox" aria-labelledby="select-default-trigger">
                <div role="group" aria-labelledby="select-default-fruits"><span id="select-default-fruits" role="heading">Fruits</span><div role="option" data-value="apple">Apple</div><div role="option" data-value="banana">Banana</div><div role="option" data-value="blueberry" aria-selected="true">Blueberry</div></div>
                <div role="group" aria-labelledby="select-default-grapes"><span id="select-default-grapes" role="heading">Grapes</span><div role="option" data-value="pineapple">Pineapple</div></div>
              </div>
            </div>
            <input type="hidden" name="select-default" value="blueberry" />
          </div>

          <div id="select-scrollbar" class="select">
            <button type="button" class="w-[180px] btn-outline" id="select-scrollbar-trigger" aria-haspopup="listbox" aria-expanded="false" aria-controls="select-scrollbar-listbox">
              <span></span>
              @template.lucide.chevronsUpDown(classAppend = "text-muted-foreground opacity-50 shrink-0")
            </button>
            <div id="select-scrollbar-popover" data-popover aria-hidden="true" class="scrollbar overflow-y-auto max-h-64">
              <div role="listbox" id="select-scrollbar-listbox" aria-labelledby="select-scrollbar-trigger">
                <div role="option" data-value="item-0">Item 0</div>
                <div role="option" data-value="item-1">Item 1</div>
                <div role="option" data-value="item-2">Item 2</div>
                <div role="option" data-value="item-3">Item 3</div>
                <div role="option" data-value="item-4">Item 4</div>
                <div role="option" data-value="item-5">Item 5</div>
              </div>
            </div>
            <input type="hidden" name="select-scrollbar" value="" />
          </div>

          <div id="select-disabled" class="select">
            <button type="button" class="w-[180px] btn-outline" id="select-disabled-trigger" aria-haspopup="listbox" aria-expanded="false" aria-controls="select-disabled-listbox" disabled>
              <span></span>
              @template.lucide.chevronsUpDown(classAppend = "text-muted-foreground opacity-50 shrink-0")
            </button>
            <div id="select-disabled-popover" data-popover aria-hidden="true">
              <div role="listbox" id="select-disabled-listbox" aria-labelledby="select-disabled-trigger">
                <div role="option" data-value="disabled">Disabled</div>
              </div>
            </div>
            <input type="hidden" name="select-disabled" value="disabled" />
          </div>

          <div id="select-with-icon" class="select">
            <button type="button" class="w-[180px] btn-outline" id="select-with-icon-trigger" aria-haspopup="listbox" aria-expanded="false" aria-controls="select-with-icon-listbox">
              <span></span>
              @template.lucide.chevronsUpDown(classAppend = "text-muted-foreground opacity-50 shrink-0")
            </button>
            <div id="select-with-icon-popover" data-popover aria-hidden="true">
              <div role="listbox" id="select-with-icon-listbox" aria-labelledby="select-with-icon-trigger">
                <div role="option" data-value="bar">
                  <span class="flex items-center gap-2">
                    @template.lucide.chartColumn(classAppend = "text-muted-foreground")
                    Bar
                  </span>
                </div>
                <div role="option" data-value="line">
                  <span class="flex items-center gap-2">
                    @template.lucide.chartLine(classAppend = "text-muted-foreground")
                    Line
                  </span>
                </div>
                <div role="option" data-value="pie">
                  <span class="flex items-center gap-2">
                    @template.lucide.chartPie(classAppend = "text-muted-foreground")
                    Pie
                  </span>
                </div>
              </div>
            </div>
            <input type="hidden" name="chart-type" value="" />
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

@import com.basecoatui.jte.util.BasecoatItem
@import com.basecoatui.jte.util.BasecoatTab
@import gg.jte.Content
@import gg.jte.support.ForSupport
@import java.lang.management.MemoryManagerMXBean
@import java.util.List
@import java.util.Map
@import com.basecoatui.jte.util.BasecoatSelect.Item

@param String data

!{
  final List<Item> viewItems = List.of(
    Item.of("Outline", "outline"),
    Item.of("Past Performance", "past-performance"),
    Item.of("Key Personnel", "key-personnel"),
    Item.of("Focus Documents", "focus-documents")
  );

  final List<Item> columnItems = List.of(
    Item.of("Section Type", "type"),
    Item.of("Status", "status"),
    Item.of("Target", "target"),
    Item.of("Reviewer", "reviewer")
  );

  final List<Item> pageSizeItems = List.of(
    Item.of("10", "10"),
    Item.of("20", "20"),
    Item.of("30", "30"),
    Item.of("40", "40"),
    Item.of("50", "50")
  );

  final var emptyPanel = @`<div class="aspect-video rounded-lg border border-dashed"></div>`;
}

<%--
- The tabs container gets contents! so its tablist and panels participate directly in that flex row. ! is needed because
  basecoat's unlayered .tabs{display:flex} otherwise beats Tailwind's layered contents utility.
- Panels get basis-full! (basecoat's [role=tabpanel]{flex:1} overrides w-full) and order-1, so they wrap full-width
  below while the buttons stay on the tablist's line.
--%>
<section class="flex w-full flex-wrap items-center gap-2 px-4 lg:px-6" aria-label="Document views">
  <span class="sr-only" id="view-selector-label">View</span>

  @template.basecoat.select(
    id = "view-selector",
    selected = viewItems.getFirst().value(),
    items = viewItems,
    mainAttrs = Map.of("class", "w-fit lg:hidden"),
    triggerAttrs = Map.of("class", "w-48", "aria-labelledby", "view-selector-label view-selector-trigger")
  )

  @template.basecoat.tabs(
    id = "document-tabs",
    tabs = List.of(
      new BasecoatTab(
        "Outline",
        null,
        Map.of("data-view", "outline"),
        @`
          @template.examples.adminDashboard.components.dataTable.outlinePanel(
            pageSizeItems = pageSizeItems
          )
        `,
        Map.of("class", "order-1 mt-6 basis-full!", "data-view", "outline")
      ),
      new BasecoatTab(
        null,
        @`Past Performance <span class="badge" data-variant="secondary">3</span>`,
        Map.of("data-view", "past-performance"),
        emptyPanel,
        Map.of("class", "order-1 mt-6 basis-full!", "data-view", "past-performance")
      ),
      new BasecoatTab(
        null,
        @`Key Personnel <span class="badge" data-variant="secondary">2</span>`,
        Map.of("data-view", "key-personnel"),
        emptyPanel,
        Map.of("class", "order-1 mt-6 basis-full!", "data-view", "key-personnel")
      ),
      new BasecoatTab(
        "Focus Documents",
        null,
        Map.of("data-view", "focus-documents"),
        emptyPanel,
        Map.of("class", "order-1 mt-6 basis-full!", "data-view", "focus-documents")
      )
    ),
    mainAttrs = Map.of("class", "contents!"),
    tablistAttrs = Map.of("class", "dashboard-tab-list hidden lg:flex")
  )

  <div class="ml-auto flex items-center gap-2">
    @template.basecoat.dropdownMenu(
      id = "columns-menu",
      triggerContent = @`
        @template.lucide.columns2()
        <span class="hidden lg:inline">Customize Columns</span>
        <span class="lg:hidden">Columns</span>
        @template.lucide.chevronDown()
      `,
      triggerAttrs = Map.of("class", "btn", "data-variant", "outline", "data-size", "sm"),
      popoverAttrs = Map.of("class", "w-56", "data-align", "end"),
      content = @`
        <div role="heading">Visible columns</div>
        @for(var column : columnItems)
          <div role="menuitemcheckbox" aria-checked="true" data-column-toggle="${column.value()}">
            <span data-indicator="true">✓</span>
            ${column.label()}
          </div>
        @endfor
      `
    )
    <button type="button" class="btn" data-variant="outline" data-size="sm">
      <span aria-hidden="true">＋</span><span class="hidden lg:inline">Add Section</span>
    </button>
  </div>
</section>

<dialog
  id="row-details"
  class="drawer"
  data-side="right"
  aria-labelledby="row-details-title"
  aria-describedby="row-details-description"
>
  <article>
    <header>
      <h2 id="row-details-title">Document details</h2>
      <p id="row-details-description">Showing total visitors for the last 6 months</p>
    </header>
    <section class="scrollbar px-4">
      <div id="detail-chart-section">
        <div class="detail-chart-box">
          <canvas id="detail-chart" aria-label="Visitors for the selected document"></canvas>
        </div>
        <hr class="my-4" />
        <div class="grid gap-2 text-sm">
          <div class="font-medium">Trending up by 5.2% this month ↗</div>
          <p class="text-muted-foreground">
            Showing total visitors for the last 6 months. This is sample supporting data for the selected document.
          </p>
        </div>
        <hr class="my-4" />
      </div>
      <form id="detail-form" class="flex flex-col gap-4">
        <input type="hidden" id="detail-id" />
        <div class="grid gap-2">
          <label for="detail-header">Header</label><input id="detail-header" class="input" />
        </div>
        <div class="grid grid-cols-2 gap-4">
          <div class="grid gap-2">
            <label for="detail-type-trigger">Type</label>
            @template.basecoat.select(
              id = "detail-type",
              items = List.of(Item.of("Type A", "type-a"), Item.of("Type B", "type-b"), Item.of("Type C", "type-c")),
              triggerAttrs = Map.of("class", "w-full")
            )
            TODO {{ select(id="detail-type", items=typeItems, trigger_attrs={ class: "w-full" }) }}
          </div>
          <div class="grid gap-2">
            <label for="detail-status-trigger">Status</label>
            TODO {{ select(id="detail-status", items=statusItems, trigger_attrs={ class: "w-full" }) }}
          </div>
        </div>
        <div class="grid grid-cols-2 gap-4">
          <div class="grid gap-2">
            <label for="detail-target">Target</label><input id="detail-target" class="input" />
          </div>
          <div class="grid gap-2"><label for="detail-limit">Limit</label><input id="detail-limit" class="input" /></div>
        </div>
        <div class="grid gap-2">
          <label for="detail-reviewer-trigger">Reviewer</label>
          TODO {{ select(id="detail-reviewer", items=reviewerItems, trigger_attrs={ class: "w-full" }) }}
        </div>
      </form>
    </section>
    <footer>
      <button type="submit" form="detail-form" class="btn">Submit</button>
      <button type="button" class="btn" data-variant="outline" onclick="this.closest('dialog').close()">Done</button>
    </footer>
  </article>
</dialog>

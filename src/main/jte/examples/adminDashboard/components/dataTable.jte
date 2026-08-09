@import com.basecoatui.jte.examples.models.OutlinePage
@import com.basecoatui.jte.util.BasecoatTab
@import gg.jte.Content
@import java.util.List
@import java.util.Map
@import com.basecoatui.jte.util.BasecoatSelect.Item

@param OutlinePage page

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
    Item.of("Limit", "limit"),
    Item.of("Reviewer", "reviewer")
  );

  final List<Item> pageSizeItems = List.of(
    Item.of("10", "10"),
    Item.of("20", "20"),
    Item.of("30", "30"),
    Item.of("40", "40"),
    Item.of("50", "50")
  );

  final Content emptyPanel = @`<div class="aspect-video rounded-lg border border-dashed"></div>`;
}

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
            page = page,
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
    tablistAttrs = Map.of("class", "hidden lg:flex")
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
  </div>
</section>

<dialog id="row-details" class="drawer" data-side="right" aria-label="Document details"></dialog>

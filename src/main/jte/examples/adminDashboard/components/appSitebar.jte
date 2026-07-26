@import java.util.List
@import java.util.Map
@import com.basecoatui.jte.util.BasecoatSidebar.Item
@import com.basecoatui.jte.util.BasecoatSidebar.ItemType
@import com.basecoatui.jte.examples.model.User

@param User user

@template.basecoat.sidebar(
  id="sidebar",
  mainAttrs = Map.of("class", "h-auto border-r"),
  headerAttrs = Map.of("class", "border-b"),
  header = @`<span class="text-base font-semibold">Acme Inc.</span>`,
  menu = List.of(
    Item.group("Home",
      List.of(
        Item.of("Dashboard", "#", @`@template.lucide.gauge()`),
        Item.of("Lifecycle", "#", @`@template.lucide.layoutList()`),
        Item.of("Analytics", "#", @`@template.lucide.chartColumnBig()`),
        Item.of("Projects", "#", @`@template.lucide.folder()`),
        Item.of("Team", "#", @`@template.lucide.users()`)
      )
    ),
    Item.group("Documents",
      List.of(
        Item.of("Data Library", "#", @`@template.lucide.database()`),
        Item.of("Reports", "#", @`@template.lucide.clipboardClock()`),
        Item.of("Word Assistant", "#", @`@template.lucide.fileText()`),
        new Item(ItemType.ITEM, null, "More", "#", false, false, null,
          Map.of("class", "text-sidebar-foreground/70"), @`@template.lucide.ellipsis()`)
      )
    ),
    new Item(ItemType.GROUP, null, null, null, false, false,
      List.of(
        Item.of("Settings", "#", @`@template.lucide.settings()`),
        Item.of("Get Help", "#", @`@template.lucide.circleQuestionMark()`),
        Item.of("Search", "#", @`@template.lucide.search()`)
      ),
      Map.of("class", "mt-auto"),
      null)
    )
  ),
  footer = @`@template.examples.adminDashboard.components-manual.navUser(user = user)`
)

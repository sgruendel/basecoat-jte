@import gg.jte.Content
@import gg.jte.support.ForSupport
@import java.util.List

!{
  record Item(String name, String url, Content icon) {}

  final List<Item> documents = List.of(
    new Item("Data Library", "#", @`@template.lucide.database()`),
    new Item("Reports", "#", @`@template.lucide.clipboardClock()`),
    new Item("Word Assistant", "#", @`@template.lucide.fileText()`),
    new Item("More", "#", @`@template.lucide.ellipsis()`)
  );
  // TODO DropdownMenuContent
}

<div role="group" aria-labelledby="documents-nav-heading">
  <h3 id="documents-nav-heading">Documents</h3>
  <ul>
    @for(var documentLoop : ForSupport.of(documents))
      <li>
        <a href="${documentLoop.get().url}" class="${documentLoop.isLast() ? "text-sidebar-foreground/70" : null}">
          ${documentLoop.get().icon}
          <span>${documentLoop.get().name}</span>
        </a>
      </li>
    @endfor
  </ul>
</div>

@import java.util.List
@import gg.jte.Content

!{
  record Item(String name, Content icon) {}

  final var items = List.of(
    new Item("Dashboard", @`@template.lucide.gauge()`),
    new Item("Lifecycle", @`@template.lucide.layoutList()`),
    new Item("Analytics", @`@template.lucide.chartColumnBig()`),
    new Item("Projects", @`@template.lucide.folder()`),
    new Item("Team", @`@template.lucide.users()`)
  );
}

<div role="group" aria-labelledby="home-nav-heading">
  <h3 id="home-nav-heading">Home</h3>
  <ul>
    @for(var item : items)
      <li>
        <a href="#">
          ${item.icon}
          <span>${item.name}</span>
        </a>
      </li>
    @endfor
  </ul>
</div>

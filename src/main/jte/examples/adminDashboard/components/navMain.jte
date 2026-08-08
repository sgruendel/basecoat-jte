@import java.util.List
@import java.util.Map

!{
  // TODO replace Map.entry with a record
  final var items = List.of(
    Map.entry("Dashboard", @`@template.lucide.gauge()`),
    Map.entry("Lifecycle", @`@template.lucide.layoutList()`),
    Map.entry("Analytics", @`@template.lucide.chartColumnBig()`),
    Map.entry("Projects", @`@template.lucide.folder()`),
    Map.entry("Team", @`@template.lucide.users()`)
  );
}

<div role="group" aria-labelledby="home-nav-heading">
  <h3 id="home-nav-heading">Home</h3>
  <ul>
    @for(var item : items)
      <li>
        <a href="#">
          ${item.getValue()}
          <span>${item.getKey()}</span>
        </a>
      </li>
    @endfor
  </ul>
</div>

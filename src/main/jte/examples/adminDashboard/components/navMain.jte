@import static io.github.sgruendel.lucide.jte.LucideIcons.*

@import java.util.List
@import gg.jte.Content
!{
  record Item(String name, Content icon) {}

  final var items = List.of(
    new Item("Dashboard", @`${lucideGauge()}`),
    new Item("Lifecycle", @`${lucideLayoutList()}`),
    new Item("Analytics", @`${lucideChartColumnBig()}`),
    new Item("Projects", @`${lucideFolder()}`),
    new Item("Team", @`${lucideUsers()}`)
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

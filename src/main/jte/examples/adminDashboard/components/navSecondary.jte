@import gg.jte.Content

@import java.util.List

@import static io.github.sgruendel.lucide.jte.LucideIcons.*

!{
  record Item(String name, String url, Content icon) {}

  final var navSecondary = List.of(
    new Item("Settings", "#", @`${lucideSettings()}`),
    new Item("Get Help", "#", @`${lucideCircleQuestionMark()}`),
    new Item("Search", "#", @`${lucideSearch()}`)
  );
}

<div role="group" class="mt-auto">
  <ul>
    @for(var item : navSecondary)
      <li>
        <a href="${item.url}">
          ${item.icon}
          <span>${item.name}</span>
        </a>
      </li>
    @endfor
  </ul>
</div>

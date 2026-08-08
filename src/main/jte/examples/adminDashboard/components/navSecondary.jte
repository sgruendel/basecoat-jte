@import gg.jte.Content
@import java.util.List

!{
  record Item(String name, String url, Content icon) {}

  final var navSecondary = List.of(
    new Item("Settings", "#", @`@template.lucide.settings()`),
    new Item("Get Help", "#", @`@template.lucide.circleQuestionMark()`),
    new Item("Search", "#", @`@template.lucide.search()`)
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

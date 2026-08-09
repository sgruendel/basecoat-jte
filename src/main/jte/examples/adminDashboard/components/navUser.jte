@import java.util.Map
@import com.basecoatui.jte.examples.models.User

@param User user

!{
  final var avatar = @`
    <span class="avatar" data-size="sm">
      <img src="${user.avatarUrl()}" alt="${user.name()}"/>
      <span>CN</span>
    </span>
    <span class="grid min-w-0 flex-1 text-left leading-tight">
      <span class="truncate text-sm font-medium">${user.name()}</span>
      <span class="text-muted-foreground truncate text-xs">${user.email()}</span>
    </span>
  `;
}

@template.basecoat.dropdownMenu(
  id = "sidebar-user",
  triggerContent = @`
    ${avatar}
    @template.lucide.ellipsisVertical()
  `,
  content = @`
    <div role="heading" class="flex items-center gap-2">${avatar}</div>
    <hr role="separator" />
    <div role="menuitem">
      @template.lucide.circleUser()
      Account
    </div>
    <div role="menuitem">
      @template.lucide.creditCard()
      Billing
    </div>
    <div role="menuitem">
      @template.lucide.bell()
      Notifications
    </div>
    <hr role="separator" />
    <div role="menuitem">
      @template.lucide.logOut()
      Log out
    </div>
  `,
  mainAttrs = Map.of("class", "w-full"),
  triggerAttrs = Map.of("class", "btn h-auto w-full justify-start p-2", "data-variant", "ghost"),
  popoverAttrs = Map.of("class", "min-w-56", "data-side", "right", "data-align", "end")
)

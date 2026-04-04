@import java.util.Map

<section id="dropdown-menu" class="w-full rounded-lg border scroll-mt-14">
  <header class="border-b px-4 py-3 flex items-center justify-between">
    <h2 class="text-sm font-medium">Dropdown Menu</h2>
    <a
      href="https://basecoatui.com/components/dropdown-menu"
      class="text-muted-foreground hover:text-foreground"
      data-tooltip="See documentation"
      data-side="left"
    >
      @template.lucide.bookOpen(classAppend = "size-4")
    </a>
  </header>
  <div class="p-4">
    <div class="flex flex-wrap items-start gap-4">
      @template.basecoat.dropdownMenu(
        id = "dropdown-menu-default",
        triggerText = "Open",
        content = @`
          <div role="group" aria-labelledby="account-options">
            <div role="heading" id="account-options">My Account</div>
            <div role="menuitem">Profile <span class="text-muted-foreground ml-auto text-xs tracking-widest">⇧⌘P</span></div>
            <div role="menuitem">Billing <span class="text-muted-foreground ml-auto text-xs tracking-widest">⌘B</span></div>
            <div role="menuitem">Settings <span class="text-muted-foreground ml-auto text-xs tracking-widest">⌘S</span></div>
            <div role="menuitem">Keyboard shortcuts <span class="text-muted-foreground ml-auto text-xs tracking-widest">⌘K</span></div>
          </div>
          <hr role="separator">
          <div role="menuitem">GitHub</div>
          <div role="menuitem">Support</div>
          <div role="menuitem" aria-disabled="true">API</div>
          <hr role="separator">
          <div role="menuitem">Logout <span class="text-muted-foreground ml-auto text-xs tracking-widest">⇧⌘P</span></div>
        `
      )

      @template.basecoat.dropdownMenu(
        id = "dropdown-menu-checkboxes",
        triggerText = "Checkboxes",
        content = @`
          <div role="group" aria-labelledby="account-options">
            <div role="heading" id="account-options">Account Options</div>
            <div role="menuitem">@template.lucide.user() Profile <span class="text-muted-foreground ml-auto text-xs tracking-widest">⇧⌘P</span></div>
            <div role="menuitem">@template.lucide.creditCard() Billing <span class="text-muted-foreground ml-auto text-xs tracking-widest">⌘B</span></div>
            <div role="menuitem">@template.lucide.settings() Settings <span class="text-muted-foreground ml-auto text-xs tracking-widest">⌘S</span></div>
          </div>
          <hr role="separator">
          <div role="group" aria-labelledby="appearance-options">
            <div role="heading" id="appearance-options">Appearance</div>
            <div role="menuitemcheckbox" aria-checked="true" class="group">
              @template.lucide.check(
            classAppend = "invisible group-aria-checked:visible",
            ariaHidden = true,
            focusable = false
          )
              Status Bar
              <span class="text-muted-foreground ml-auto text-xs tracking-widest">⇧⌘P</span>
            </div>
            <div role="menuitemcheckbox" aria-checked="false" class="group" aria-disabled="true">
              @template.lucide.check(
            classAppend = "invisible group-aria-checked:visible",
            ariaHidden = true,
            focusable = false
          )
              Activity Bar
              <span class="text-muted-foreground ml-auto text-xs tracking-widest">⌘B</span>
            </div>
            <div role="menuitemcheckbox" aria-checked="false" class="group">
              @template.lucide.check(
            classAppend = "invisible group-aria-checked:visible",
            ariaHidden = true,
            focusable = false
          )
              Panel
              <span class="text-muted-foreground ml-auto text-xs tracking-widest">⌘S</span>
            </div>
          </div>
          <hr role="separator">
          <div role="menuitem">@template.lucide.logOut() Logout <span class="text-muted-foreground ml-auto text-xs tracking-widest">⇧⌘P</span></div>






        `
      )

      <script>
        (() => {
          const dropdownMenu = document.querySelector(
            "#dropdown-menu-checkboxes",
          );
          const checkboxes = dropdownMenu.querySelectorAll(
            'div[role="menuitemcheckbox"]',
          );
          checkboxes.forEach((checkbox) => {
            checkbox.addEventListener("click", () => {
              const isChecked =
                checkbox.getAttribute("aria-checked") === "true";
              checkbox.setAttribute("aria-checked", !isChecked);
            });
          });
        })();
      </script>


      @template.basecoat.dropdownMenu(
        id = "dropdown-menu-radio-group",
        triggerText = "Radio Group",
        content = @`
          <div role="group" aria-labelledby="position-options">
            <span id="position-options" role="heading">Panel Position</span>
            <hr role="separator">
            <div role="menuitemradio" aria-checked="false" class="group">
              <div class="size-4 flex items-center justify-center">
                <div class="size-2 rounded-full bg-foreground invisible group-aria-checked:visible" aria-hidden="true" focusable="false"></div>
              </div>
              Status Bar
              <span class="text-muted-foreground ml-auto text-xs tracking-widest">⇧⌘P</span>
            </div>
            <div role="menuitemradio" aria-checked="true" class="group">
              <div class="size-4 flex items-center justify-center">
                <div class="size-2 rounded-full bg-foreground invisible group-aria-checked:visible" aria-hidden="true" focusable="false"></div>
              </div>
              Activity Bar
              <span class="text-muted-foreground ml-auto text-xs tracking-widest">⌘B</span>
            </div>
            <div role="menuitemradio" aria-checked="false" class="group">
              <div class="size-4 flex items-center justify-center">
                <div class="size-2 rounded-full bg-foreground invisible group-aria-checked:visible" aria-hidden="true" focusable="false"></div>
              </div>
              Panel
              <span class="text-muted-foreground ml-auto text-xs tracking-widest">⌘S</span>
            </div>
          </div>






        `
      )
      <script>
        (() => {
          const dropdownMenu = document.querySelector(
            "#dropdown-menu-radio-group",
          );
          const radioButtons = dropdownMenu.querySelectorAll(
            'div[role="menuitemradio"]',
          );
          radioButtons.forEach((radioButton) => {
            radioButton.addEventListener("click", () => {
              radioButtons.forEach((radioButton) => {
                radioButton.setAttribute("aria-checked", "false");
              });
              radioButton.setAttribute("aria-checked", "true");
            });
          });
        })();
      </script>

      <div id="dropdown-profile-wide" class="dropdown-menu">
        <button
          type="button"
          id="dropdown-profile-wide-trigger"
          aria-haspopup="menu"
          aria-controls="dropdown-profile-wide-menu"
          aria-expanded="false"
          class="btn-outline h-12 justify-start px-2 md:max-w-[200px]"
        >
          <img
            alt="@hunvreus"
            src="https://github.com/hunvreus.png"
            class="size-8 shrink-0 rounded-full"
          />
          <div class="grid flex-1 text-left text-sm leading-tight">
            <span class="truncate font-medium">hunvreus</span>
            <span class="text-muted-foreground truncate text-xs"
              >hunvreus@example.com</span
            >
          </div>
          @template.lucide.chevronsUpDown(
            classAppend = "text-muted-foreground ml-auto"
          )
        </button>
        <div
          id="dropdown-profile-wide-popover"
          data-popover
          aria-hidden="true"
          class="min-w-56"
        >
          <div
            role="menu"
            id="dropdown-profile-wide-menu"
            aria-labelledby="dropdown-profile-wide-trigger"
          >
            <div class="flex items-center gap-2 px-1 py-1.5 text-left text-sm">
              <img
                alt="@hunvreus"
                src="https://github.com/hunvreus.png"
                class="size-8 shrink-0 rounded-full"
              />
              <div class="grid flex-1 text-left text-sm leading-tight">
                <span class="truncate font-medium">hunvreus</span>
                <span class="text-muted-foreground truncate text-xs"
                  >hunvreus@example.com</span
                >
              </div>
            </div>
            <hr role="separator" />
            <div role="menuitem">@template.lucide.star() Upgrade to Pro</div>
            <hr role="separator" />
            <div role="menuitem">@template.lucide.user() Account</div>
            <div role="menuitem">@template.lucide.creditCard() Billing</div>
            <div role="menuitem">@template.lucide.bell() Notifications</div>
            <hr role="separator" />
            <div role="menuitem">@template.lucide.logOut() Signout</div>
          </div>
        </div>
      </div>

      <div id="dropdown-profile-avatar" class="dropdown-menu">
        <button
          type="button"
          id="dropdown-profile-avatar-trigger"
          aria-haspopup="menu"
          aria-controls="dropdown-profile-avatar-menu"
          aria-expanded="false"
          class="btn-icon-ghost rounded-full size-8"
        >
          <img
            alt="@hunvreus"
            src="https://github.com/hunvreus.png"
            class="size-8 shrink-0 rounded-full"
          />
        </button>
        <div
          id="dropdown-profile-avatar-popover"
          data-popover
          aria-hidden="true"
          data-align="end"
          class="min-w-56"
        >
          <div
            role="menu"
            id="dropdown-profile-avatar-menu"
            aria-labelledby="dropdown-profile-avatar-trigger"
          >
            <div class="flex items-center gap-2 px-1 py-1.5 text-left text-sm">
              <img
                alt="@hunvreus"
                src="https://github.com/hunvreus.png"
                class="size-8 shrink-0 rounded-full"
              />
              <div class="grid flex-1 text-left text-sm leading-tight">
                <span class="truncate font-medium">hunvreus</span>
                <span class="text-muted-foreground truncate text-xs"
                  >hunvreus@example.com</span
                >
              </div>
            </div>
            <hr role="separator" />
            <div role="menuitem">@template.lucide.star() Upgrade to Pro</div>
            <hr role="separator" />
            <div role="menuitem">@template.lucide.user() Account</div>
            <div role="menuitem">@template.lucide.creditCard() Billing</div>
            <div role="menuitem">@template.lucide.bell() Notifications</div>
            <hr role="separator" />
            <div role="menuitem">@template.lucide.logOut() Signout</div>
          </div>
        </div>
      </div>

      <div id="dropdown-actions" class="dropdown-menu">
        <button
          type="button"
          id="dropdown-actions-trigger"
          aria-haspopup="menu"
          aria-controls="dropdown-actions-menu"
          aria-expanded="false"
          class="btn-icon-ghost"
        >
          @template.lucide.ellipsis()
        </button>
        <div
          id="dropdown-actions-popover"
          data-popover
          aria-hidden="true"
          class="min-w-32"
        >
          <div
            role="menu"
            id="dropdown-actions-menu"
            aria-labelledby="dropdown-actions-trigger"
          >
            <div role="menuitem">@template.lucide.pencil() Edit</div>
            <div role="menuitem">@template.lucide.share() Share</div>
            <hr role="separator" />
            <div
              role="menuitem"
              class="text-destructive hover:bg-destructive/10 dark:hover:bg-destructive/20 focus:bg-destructive/10 dark:focus:bg-destructive/20 focus:text-destructive [&_svg]:!text-destructive"
            >
              @template.lucide.trash2() Delete
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

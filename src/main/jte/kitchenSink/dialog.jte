@import java.util.Map

<section id="dialog" class="w-full rounded-lg border scroll-mt-14">
  <header class="border-b px-4 py-3 flex items-center justify-between">
    <h2 class="text-sm font-medium">Dialog</h2>
    <a
      href="https://basecoatui.com/components/dialog"
      class="text-muted-foreground hover:text-foreground"
      data-tooltip="See documentation"
      data-side="left"
    >
      @template.lucide.bookOpen(classAppend = "size-4")
    </a>
  </header>
  <div class="p-4">
    <div class="flex flex-wrap items-center gap-4">
      @template.basecoat.dialog(
        id = "demo-dialog-edit-profile",
        trigger = "Edit Profile",
        title = "Edit profile",
        description = "This is a dialog with scrollable content.",
        triggerAttrs = Map.of("class", "btn-outline"),
        dialogAttrs = Map.of("class", "w-full sm:max-w-[425px] max-h-[612px]"),
        content = @`
          <form class="form grid gap-4">
            <div class="grid gap-3">
              <label for="demo-dialog-edit-profile-name">Name</label>
              <input type="text" value="Pedro Duarte" id="demo-dialog-edit-profile-name" />
            </div>
            <div class="grid gap-3">
              <label for="demo-dialog-edit-profile-username">Username</label>
              <input type="text" value="@peduarte" id="demo-dialog-edit-profile-username" />
            </div>
          </form>


        `,
        footer = @`
          <button class="btn-outline" type="button" onclick="document.getElementById('demo-dialog-edit-profile').close()">
            Cancel
          </button>
          <button class="btn" type="button" onclick="document.getElementById('demo-dialog-edit-profile').close()">
            Save changes
          </button>


        `
      )

      @template.basecoat.dialog(
        id = "dialog-example",
        trigger = "Scrollable content",
        title = "Scrollable Content",
        description = "This is a dialog with scrollable content.",
        triggerAttrs = Map.of("class", "btn-outline"),
        dialogAttrs = Map.of("class", "w-full sm:max-w-[425px] max-h-[612px]"),
        bodyAttrs = Map.of("class", "overflow-y-auto scrollbar"),
        content = @`
          <div class="space-y-4 text-sm">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
          </div>

        `,
        footer = @`
          <button class="btn-outline" type="button" onclick="document.getElementById('dialog-example').close()">
            Close
          </button>

        `
      )
    </div>
  </div>
</section>

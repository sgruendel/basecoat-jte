@import java.util.List
@import java.util.Map
@import com.basecoatui.jte.util.BasecoatTab

<section id="tabs" class="w-full rounded-lg border scroll-mt-14">
  <header class="border-b px-4 py-3 flex items-center justify-between">
    <h2 class="text-sm font-medium">Tabs</h2>
    <a
      href="https://basecoatui.com/components/tabs"
      class="text-muted-foreground hover:text-foreground"
      data-tooltip="See documentation"
      data-side="left"
    >
      @template.lucide.bookOpen(attrs = Map.of("class", "size-4"))
    </a>
  </header>
  <div class="p-4">
    <div class="flex flex-col gap-6">
      @template.basecoat.tabs(
        id = "demo-tabs-with-panels",
        tabs = List.of(
          BasecoatTab.of("Account",
            @`
          <div class="card">
            <header>
              <h2>Account</h2>
              <p>
                Make changes to your account here. Click save when you're done.
              </p>
            </header>
            <section>
              <form class="form grid gap-6">
                <div class="grid gap-3">
                  <label for="demo-tabs-account-name">Name</label>
                  <input
                    type="text"
                    id="demo-tabs-account-name"
                    value="Pedro Duarte"
                  />
                </div>
                <div class="grid gap-3">
                  <label for="demo-tabs-account-username">Username</label>
                  <input
                    type="text"
                    id="demo-tabs-account-username"
                    value="@peduarte"
                  />
                </div>
              </form>
            </section>
            <footer>
              <button type="button" class="btn">Save changes</button>
            </footer>
          </div>
        `),
          BasecoatTab.of("Password",
            @`
          <div class="card">
            <header>
              <h2>Password</h2>
              <p>
                Change your password here. After saving, you'll be logged out.
              </p>
            </header>
            <section>
              <form class="form grid gap-6">
                <div class="grid gap-3">
                  <label for="demo-tabs-password-current"
                    >Current password</label
                  >
                  <input type="password" id="demo-tabs-password-current" />
                </div>
                <div class="grid gap-3">
                  <label for="demo-tabs-password-new">New password</label>
                  <input type="password" id="demo-tabs-password-new" />
                </div>
              </form>
            </section>
            <footer>
              <button type="button" class="btn">Save Password</button>
            </footer>
          </div>
        `)
        ),
        mainAttrs = Map.of("class", "max-w-[300px]"),
        tablistAttrs = Map.of("class", "w-full")
      )

      @template.basecoat.tabs(
        id = "demo-tabs-without-panels",
        tabs = List.of(
          BasecoatTab.of("Home"),
          BasecoatTab.of("Settings")
        )
      )

      @template.basecoat.tabs(
        id = "demo-tabs-disabled",
        tabs = List.of(
          BasecoatTab.of("Home"),
          BasecoatTab.of("Disabled", Map.of("disabled", true))
        )
      )

      @template.basecoat.tabs(
        id = "demo-tabs-with-icons",
        tabs = List.of(
          BasecoatTab.of(@`
          @template.lucide.appWindow()
              Preview
        `),
          BasecoatTab.of(@`
          @template.lucide.code()
              Code
        `)
        )
      )
    </div>
  </div>
</section>

@import java.util.Map

@import static io.github.sgruendel.lucide.jte.LucideIcons.*

<section id="alert-dialog" class="w-full scroll-mt-14 rounded-lg border">
  <header class="flex items-center justify-between border-b px-4 py-3">
    <h2 class="text-sm font-medium">Alert Dialog</h2>
    <a
      href="https://basecoatui.com/components/alert-dialog"
      class="text-muted-foreground hover:text-foreground"
      data-tooltip="See documentation"
      data-side="left"
    >
      ${lucideBookOpen().cssClass("size-4")}
    </a>
  </header>
  <div class="p-4">
    @template.basecoat.dialog(
      id = "alert-dialog-demo",
      title = "Are you absolutely sure?",
      description = "This action cannot be undone. This will permanently delete your account and remove your data from our servers.",
      trigger = "Open dialog",
      triggerAttrs = Map.of("class", "btn-outline"),
      footer = @`
        <button class="btn-outline" type="button" onclick="document.getElementById('alert-dialog-demo').close()">
          Cancel
        </button>
        <button class="btn-primary" type="button" onclick="document.getElementById('alert-dialog-demo').close()">
          Continue
        </button>
      `,
      closeButton = false,
      closeOnOverlayClick = false
    )
  </div>
</section>

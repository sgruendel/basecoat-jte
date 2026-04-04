<section id="alert-dialog" class="w-full rounded-lg border scroll-mt-14">
  <header class="border-b px-4 py-3 flex items-center justify-between">
    <h2 class="text-sm font-medium">Alert Dialog</h2>
    <a
      href="https://basecoatui.com/components/alert-dialog"
      class="text-muted-foreground hover:text-foreground"
      data-tooltip="See documentation"
      data-side="left"
    >
      @template.lucide.bookOpen(classAppend = "size-4")
    </a>
  </header>
  <div class="p-4">
    @template.basecoat.dialog(
      id = "alert-dialog-demo",
      title = "Are you absolutely sure?",
      description = "This action cannot be undone. This will permanently delete your account and remove your data from our servers.",
      trigger = "Open dialog",
      triggerClass = "btn-outline",
      footer = @`
        <button class="btn-outline" type="button" onclick="document.getElementById('alert-dialog-demo').close()">Cancel</button>
        <button class="btn-primary" type="button" onclick="document.getElementById('alert-dialog-demo').close()">Continue</button>
      `,
      closeButton = false,
      closeOnOverlayClick = false
    )
  </div>
</section>

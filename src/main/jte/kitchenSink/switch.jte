@import static io.github.sgruendel.lucide.jte.LucideIcons.*

<section id="switch" class="w-full scroll-mt-14 rounded-lg border">
  <header class="flex items-center justify-between border-b px-4 py-3">
    <h2 class="text-sm font-medium">Switch</h2>
    <a
      href="https://basecoatui.com/components/switch"
      class="text-muted-foreground hover:text-foreground"
      data-tooltip="See documentation"
      data-side="left"
    >
      ${lucideBookOpen().cssClass("size-4")}
    </a>
  </header>
  <div class="p-4">
    <div class="inline-flex flex-col gap-y-6">
      <label class="label">
        <input type="checkbox" name="switch" role="switch" class="input" />
        Airplane Mode
      </label>
      <label class="label">
        <input
          type="checkbox"
          name="switch"
          role="switch"
          class="input checked:bg-blue-500 dark:checked:bg-blue-600"
          checked
        />
        Bluetooth
      </label>
      <label
        class="label gap-6 rounded-lg border p-4 leading-none has-[input[type='checkbox']:checked]:border-blue-600"
      >
        <div class="grid gap-1">
          <h2 class="text-sm font-medium">Share across devices</h2>
          <p class="text-muted-foreground text-sm">
            Focus is shared across devices, and turns off when you leave the app.
          </p>
        </div>
        <input type="checkbox" name="switch" role="switch" class="input checked:bg-blue-500 dark:checked:bg-blue-600" />
      </label>
    </div>
  </div>
</section>

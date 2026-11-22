@import static io.github.sgruendel.lucide.jte.LucideIcons.*

<section id="checkbox" class="w-full scroll-mt-14 rounded-lg border">
  <header class="flex items-center justify-between border-b px-4 py-3">
    <h2 class="text-sm font-medium">Checkbox</h2>
    <a
      href="https://basecoatui.com/components/checkbox"
      class="text-muted-foreground hover:text-foreground"
      data-tooltip="See documentation"
      data-side="left"
    >
      ${lucideBookOpen().cssClass("size-4")}
    </a>
  </header>
  <div class="p-4">
    <div class="flex max-w-lg flex-col gap-6">
      <label class="label gap-3">
        <input type="checkbox" class="input" />
        Accept terms and conditions
      </label>
      <div class="flex items-start gap-3">
        <input type="checkbox" id="demo-checkbox-label-and-description" class="input" />
        <div class="grid gap-2">
          <label for="demo-checkbox-label-and-description" class="label">Accept terms and conditions</label>
          <p class="text-muted-foreground text-sm">By clicking this checkbox, you agree to the terms and conditions.</p>
        </div>
      </div>
      <label class="label gap-3">
        <input type="checkbox" class="input" disabled />
        Enable notifications
      </label>
      <label
        class="hover:bg-accent/50 flex items-start gap-3 rounded-lg border p-3 has-[input[type='checkbox']:checked]:border-blue-600 has-[input[type='checkbox']:checked]:bg-blue-50 dark:has-[input[type='checkbox']:checked]:border-blue-900 dark:has-[input[type='checkbox']:checked]:bg-blue-950"
      >
        <input
          type="checkbox"
          class="input checked:border-blue-600 checked:bg-blue-600 checked:after:bg-white dark:checked:border-blue-700 dark:checked:bg-blue-700"
          checked
        />
        <div class="grid gap-2">
          <h2 class="text-sm leading-none font-medium">Enable notifications</h2>
          <p class="text-muted-foreground text-sm">You can enable or disable notifications at any time.</p>
        </div>
      </label>
    </div>
  </div>
</section>

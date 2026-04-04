@template.layouts.layout(
  title = "Kitchen Sink",
  description = "A collection of all the components available in Basecoat.",
  content = @`
    <div class="flex gap-x-10 justify-center">
        <div>
            <header class="space-y-2 mb-8">
                <h1 class="text-3xl font-semibold tracking-tight">Kitchen Sink</h1>
                <p class="text-muted-foreground">A collection of all the components available in Basecoat.</p>
            </header>
            <div class="grid gap-4 flex-1">
                @template.kitchenSink.accordion()
                @template.kitchenSink.alert()
                @template.kitchenSink.alertDialog()
                @template.kitchenSink.avatar()
                @template.kitchenSink.badge()
                @template.kitchenSink.breadcrumb()
                @template.kitchenSink.button()
                @template.kitchenSink.card()
                @template.kitchenSink.checkbox()
                @template.kitchenSink.combobox()
                @template.kitchenSink.dialog()
                @template.kitchenSink.dropdownMenu()
                @template.kitchenSink.form()
                @template.kitchenSink.input()
                @template.kitchenSink.label()
                @template.kitchenSink.pagination()
                @template.kitchenSink.popover()
                @template.kitchenSink.radioGroup()
                @template.kitchenSink.select()
                @template.kitchenSink.skeleton()
                @template.kitchenSink.slider()
                @template.kitchenSink.switch()
                @template.kitchenSink.table()
                @template.kitchenSink.tabs()
                @template.kitchenSink.textarea()
                @template.kitchenSink.toast()
                @template.kitchenSink.tooltip()
            </div>
        </div>
        <div class="hidden text-sm xl:block w-full max-w-50">
            <%-- toc omitted --%>
        </div>
    </div>

  `
)

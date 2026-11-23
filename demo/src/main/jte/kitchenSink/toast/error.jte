@import io.github.sgruendel.basecoat.jte.BasecoatToast.Button
@import io.github.sgruendel.basecoat.jte.BasecoatToast.Category

@template.basecoat.toast(
    category = Category.ERROR,
    title = "Event has not been created",
    cancel = Button.of("Dismiss", "close()")
)

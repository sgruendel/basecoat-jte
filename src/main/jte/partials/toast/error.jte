@import com.basecoatui.jte.util.BasecoatToast.Button
@import com.basecoatui.jte.util.BasecoatToast.Category

@template.basecoat.toast(
  category = Category.ERROR,
  title = "Event has not been created",
  cancel = Button.of("Dismiss", "close()")
)

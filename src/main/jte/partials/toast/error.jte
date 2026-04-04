@import com.basecoatui.jte.util.BasecoatToast.Category
@import com.basecoatui.jte.util.BasecoatToast.Button

@template.basecoat.toast(
  category = Category.ERROR,
  title = "Event has not been created",
  cancel = Button.of("Dismiss", "close()")
)

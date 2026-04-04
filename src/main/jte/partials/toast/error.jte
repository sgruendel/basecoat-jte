@import com.basecoatui.jte.util.BasecoatToast.Category
@import com.basecoatui.jte.util.BasecoatToastButton

@template.basecoat.toast(
  category = Category.ERROR,
  title = "Event has not been created",
  cancel = new BasecoatToastButton(null, "Dismiss", "close()")
)

<%-- see https://lucide.dev/icons/indian-rupee --%>

@import java.util.Map
@import com.basecoatui.jte.util.JteHelper

@param int size = 24
@param String color = "currentColor"
@param int strokeWidth = 2
@param boolean absoluteStrokeWidth = false
@param Map<?, ?> attrs = null

<%-- see https://github.com/lucide-icons/lucide/blob/main/packages/vue/src/Icon.ts#L50 --%>
!{final var calculatedStrokeWidth = absoluteStrokeWidth ? Double.toString(strokeWidth * 24.0 / size) : Integer.toString(strokeWidth);}

<svg
  xmlns="http://www.w3.org/2000/svg"
  width="${size}"
  height="${size}"
  viewBox="0 0 24 24"
  fill="none"
  stroke="${color}"
  stroke-width="${calculatedStrokeWidth}"
  stroke-linecap="round"
  stroke-linejoin="round"
  class="${JteHelper.classAppend("lucide lucide-indian-rupee-icon lucide-indian-rupee", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M6 3h12" />
  <path d="M6 8h12" />
  <path d="m6 13 8.5 8" />
  <path d="M6 13h3" />
  <path d="M9 13c6.667 0 6.667-10 0-10" />
</svg>

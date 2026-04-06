<%-- see https://lucide.dev/icons/repeat-2 --%>

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
  class="${JteHelper.classAppend("lucide lucide-repeat-2-icon lucide-repeat-2", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="m2 9 3-3 3 3" />
  <path d="M13 18H7a2 2 0 0 1-2-2V6" />
  <path d="m22 15-3 3-3-3" />
  <path d="M11 6h6a2 2 0 0 1 2 2v10" />
</svg>

<%-- see https://lucide.dev/icons/arrows-up-from-line --%>

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
  class="${JteHelper.classAppend("lucide lucide-arrows-up-from-line-icon lucide-arrows-up-from-line", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="m4 6 3-3 3 3" />
  <path d="M7 17V3" />
  <path d="m14 6 3-3 3 3" />
  <path d="M17 17V3" />
  <path d="M4 21h16" />
</svg>

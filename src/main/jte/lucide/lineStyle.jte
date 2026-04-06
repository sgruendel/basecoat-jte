<%-- see https://lucide.dev/icons/line-style --%>

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
  class="${JteHelper.classAppend("lucide lucide-line-style-icon lucide-line-style", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M11 5h2" />
  <path d="M15 12h6" />
  <path d="M19 5h2" />
  <path d="M3 12h6" />
  <path d="M3 19h18" />
  <path d="M3 5h2" />
</svg>

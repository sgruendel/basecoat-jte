<%-- see https://lucide.dev/icons/microwave --%>

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
  class="${JteHelper.classAppend("lucide lucide-microwave-icon lucide-microwave", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <rect width="20" height="15" x="2" y="4" rx="2" />
  <rect width="8" height="7" x="6" y="8" rx="1" />
  <path d="M18 8v7" />
  <path d="M6 19v2" />
  <path d="M18 19v2" />
</svg>

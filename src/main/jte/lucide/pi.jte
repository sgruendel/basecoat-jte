<%-- see https://lucide.dev/icons/pi --%>

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
  class="${JteHelper.classAppend("lucide lucide-pi-icon lucide-pi", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <line x1="9" x2="9" y1="4" y2="20" />
  <path d="M4 7c0-1.7 1.3-3 3-3h13" />
  <path d="M18 20c-1.7 0-3-1.3-3-3V4" />
</svg>

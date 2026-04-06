<%-- see https://lucide.dev/icons/alarm-clock-minus --%>

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
  class="${JteHelper.classAppend("lucide lucide-alarm-clock-minus-icon lucide-alarm-clock-minus", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <circle cx="12" cy="13" r="8" />
  <path d="M5 3 2 6" />
  <path d="m22 6-3-3" />
  <path d="M6.38 18.7 4 21" />
  <path d="M17.64 18.67 20 21" />
  <path d="M9 13h6" />
</svg>

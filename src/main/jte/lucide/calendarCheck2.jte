<%-- see https://lucide.dev/icons/calendar-check-2 --%>

@import java.util.Map
@import com.basecoatui.jte.util.JteHelper

@param int size = 24
@param String fill = "none"
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
  fill="${fill}"
  stroke="${color}"
  stroke-width="${calculatedStrokeWidth}"
  stroke-linecap="round"
  stroke-linejoin="round"
  class="${JteHelper.classAppend("lucide lucide-calendar-check-2-icon lucide-calendar-check-2", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M 19 3 L 5 3" />
  <path d="M 21 13 L 21 5" />
  <path d="M 21 5 A2 2 0 0 0 19 3" />
  <path d="M 3 19 A2 2 0 0 0 5 21" />
  <path d="M 3 5 L 3 19" />
  <path d="M 5 3 A2 2 0 0 0 3 5" />
  <path d="m16 19 2 2 4-4" />
  <path d="M16 2v3" />
  <path d="M3 9h18" />
  <path d="M5 21 L12.5 21" />
  <path d="M8 2v3" />
</svg>

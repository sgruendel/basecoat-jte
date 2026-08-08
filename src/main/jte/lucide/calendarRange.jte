<%-- see https://lucide.dev/icons/calendar-range --%>

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
  class="${JteHelper.classAppend("lucide lucide-calendar-range-icon lucide-calendar-range", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <rect x="3" y="3" width="18" height="18" rx="2" />
  <path d="M16 2v3" />
  <path d="M3 9h18" />
  <path d="M8 2v3" />
  <path d="M17 13h-6" />
  <path d="M13 17H7" />
  <path d="M7 13h.01" />
  <path d="M17 17h.01" />
</svg>

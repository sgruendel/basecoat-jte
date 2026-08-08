<%-- see https://lucide.dev/icons/calendar-search --%>

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
  class="${JteHelper.classAppend("lucide lucide-calendar-search-icon lucide-calendar-search", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M16 2v3" />
  <path d="M21 10.69V5a2 2 0 00-2-2H5a2 2 0 00-2 2v14a2 2 0 002 2h7.25" />
  <path d="m22 21-1.875-1.875" />
  <path d="M3 9h18" />
  <path d="M8 2v3" />
  <circle cx="18" cy="17" r="3" />
</svg>

<%-- see https://lucide.dev/icons/calendar-arrow-up --%>

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
  class="${JteHelper.classAppend("lucide lucide-calendar-arrow-up-icon lucide-calendar-arrow-up", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="m14 17 4-4 4 4" />
  <path d="M16 2v3" />
  <path d="M18 21v-8" />
  <path d="M21 10.343V5a2 2 0 00-2-2H5a2 2 0 00-2 2v14a2 2 0 002 2h9" />
  <path d="M3 9h18" />
  <path d="M8 2v3" />
</svg>

<%-- see https://lucide.dev/icons/calendar-off --%>

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
  class="${JteHelper.classAppend("lucide lucide-calendar-off-icon lucide-calendar-off", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M16 2v3" />
  <path d="m2 2 20 20" />
  <path d="M21 9h-5.5" />
  <path d="M3 9h6" />
  <path d="M3.586 3.586A2 2 0 003 5v14a2 2 0 002 2h14a2 2 0 001.414-.586" />
  <path d="M8.656 3H19a2 2 0 012 2v10.344" />
</svg>

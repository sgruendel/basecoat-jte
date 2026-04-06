<%-- see https://lucide.dev/icons/chart-gantt --%>

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
  class="${JteHelper.classAppend("lucide lucide-chart-gantt-icon lucide-chart-gantt", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M10 6h8" />
  <path d="M12 16h6" />
  <path d="M3 3v16a2 2 0 0 0 2 2h16" />
  <path d="M8 11h7" />
</svg>

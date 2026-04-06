<%-- see https://lucide.dev/icons/chart-bar-decreasing --%>

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
  class="${JteHelper.classAppend("lucide lucide-chart-bar-decreasing-icon lucide-chart-bar-decreasing", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M3 3v16a2 2 0 0 0 2 2h16" />
  <path d="M7 11h8" />
  <path d="M7 16h3" />
  <path d="M7 6h12" />
</svg>

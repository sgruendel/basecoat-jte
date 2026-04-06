<%-- see https://lucide.dev/icons/chart-column-stacked --%>

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
  class="${JteHelper.classAppend("lucide lucide-chart-column-stacked-icon lucide-chart-column-stacked", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M11 13H7" />
  <path d="M19 9h-4" />
  <path d="M3 3v16a2 2 0 0 0 2 2h16" />
  <rect x="15" y="5" width="4" height="12" rx="1" />
  <rect x="7" y="8" width="4" height="9" rx="1" />
</svg>

<%-- see https://lucide.dev/icons/monitor-pc --%>

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
  class="${JteHelper.classAppend("lucide lucide-monitor-pc-icon lucide-monitor-pc", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M10 15H4a2 2 0 01-2-2V7a2 2 0 012-2h6" />
  <path d="M10 19H5" />
  <path d="M14 11h8" />
  <path d="M14 7h8" />
  <path d="M18 17h.01" />
  <path d="M9 19v-4" />
  <rect x="14" y="3" width="8" height="18" rx="1" />
</svg>

<%-- see https://lucide.dev/icons/monitor-x --%>

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
  class="${JteHelper.classAppend("lucide lucide-monitor-x-icon lucide-monitor-x", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="m14.5 12.5-5-5" />
  <path d="m9.5 12.5 5-5" />
  <rect width="20" height="14" x="2" y="3" rx="2" />
  <path d="M12 17v4" />
  <path d="M8 21h8" />
</svg>

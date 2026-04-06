<%-- see https://lucide.dev/icons/square-divide --%>

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
  class="${JteHelper.classAppend("lucide lucide-square-divide-icon lucide-square-divide", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <rect width="18" height="18" x="3" y="3" rx="2" ry="2" />
  <line x1="8" x2="16" y1="12" y2="12" />
  <line x1="12" x2="12" y1="16" y2="16" />
  <line x1="12" x2="12" y1="8" y2="8" />
</svg>

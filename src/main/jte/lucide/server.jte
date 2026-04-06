<%-- see https://lucide.dev/icons/server --%>

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
  class="${JteHelper.classAppend("lucide lucide-server-icon lucide-server", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <rect width="20" height="8" x="2" y="2" rx="2" ry="2" />
  <rect width="20" height="8" x="2" y="14" rx="2" ry="2" />
  <line x1="6" x2="6.01" y1="6" y2="6" />
  <line x1="6" x2="6.01" y1="18" y2="18" />
</svg>

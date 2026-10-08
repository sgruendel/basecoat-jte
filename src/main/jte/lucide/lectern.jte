<%-- see https://lucide.dev/icons/lectern --%>

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
  class="${JteHelper.classAppend("lucide lucide-lectern-icon lucide-lectern", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path
    d="M15 13h4a2 2 0 001.901-1.38l1.057-4.333A1 1 0 0021 6H3a1 1 0 00-.958 1.287L3.1 11.621A2 2 0 005.001 13h4"
  />
  <path d="M15 22V11a1 1 0 00-1-1h-4a1 1 0 00-1 1v11" />
  <path d="M18 22H6" />
  <path d="M18 6V3a1 1 0 00-1-1h-3" />
</svg>

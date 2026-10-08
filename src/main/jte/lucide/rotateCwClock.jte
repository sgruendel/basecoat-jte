<%-- see https://lucide.dev/icons/rotate-cw-clock --%>

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
  class="${JteHelper.classAppend("lucide lucide-rotate-cw-clock-icon lucide-rotate-cw-clock", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 7v5l4 2" />
  <path d="M16 8h5V3" />
  <path d="m21 8-2.3-2.3A9.7 9.7 0 0012 3a9 9 0 109 9" />
</svg>

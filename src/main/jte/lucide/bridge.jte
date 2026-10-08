<%-- see https://lucide.dev/icons/bridge --%>

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
  class="${JteHelper.classAppend("lucide lucide-bridge-icon lucide-bridge", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M10 9.728V16" />
  <path d="M14 9.728V16" />
  <path d="M18 20V4" />
  <path d="m22 11-4-4A7.5 7.5 0 0 1 6 7l-4 4" />
  <path d="M22 16H2" />
  <path d="M6 20V4" />
</svg>

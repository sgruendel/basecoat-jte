<%-- see https://lucide.dev/icons/rainbow --%>

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
  class="${JteHelper.classAppend("lucide lucide-rainbow-icon lucide-rainbow", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M22 17a10 10 0 0 0-20 0" />
  <path d="M6 17a6 6 0 0 1 12 0" />
  <path d="M10 17a2 2 0 0 1 4 0" />
</svg>

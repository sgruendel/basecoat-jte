<%-- see https://lucide.dev/icons/circle-off --%>

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
  class="${JteHelper.classAppend("lucide lucide-circle-off-icon lucide-circle-off", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="m2 2 20 20" />
  <path d="M8.35 2.69A10 10 0 0 1 21.3 15.65" />
  <path d="M19.08 19.08A10 10 0 1 1 4.92 4.92" />
</svg>

<%-- see https://lucide.dev/icons/layers-arrow-down --%>

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
  class="${JteHelper.classAppend("lucide lucide-layers-arrow-down-icon lucide-layers-arrow-down", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 7v15" />
  <path d="M2 12a1 1 0 00.58.91l5.093 2.316" />
  <path d="M22 12a1 1 0 01-.59.92l-5.077 2.308" />
  <path
    d="M8 10.37 2.6 7.91a1 1 0 010-1.831l8.57-3.9a2 2 0 011.66.001l8.59 3.91a1 1 0 010 1.831l-5.392 2.45"
  />
  <path d="m9 19 3 3 3-3" />
</svg>

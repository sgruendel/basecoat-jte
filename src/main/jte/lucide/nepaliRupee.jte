<%-- see https://lucide.dev/icons/nepali-rupee --%>

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
  class="${JteHelper.classAppend("lucide lucide-nepali-rupee-icon lucide-nepali-rupee", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M18 16.173 A4.74 4.74 0 0 0 13.496 8.005" />
  <path d="M4 3 L20 3" />
  <path d="M5 13 L13.5 21" />
  <path d="M5 13 L9 13" />
  <path d="M8 13 C15.5 13 14.667 3 8 3" />
</svg>

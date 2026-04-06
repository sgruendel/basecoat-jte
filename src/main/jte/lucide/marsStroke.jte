<%-- see https://lucide.dev/icons/mars-stroke --%>

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
  class="${JteHelper.classAppend("lucide lucide-mars-stroke-icon lucide-mars-stroke", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="m14 6 4 4" />
  <path d="M17 3h4v4" />
  <path d="m21 3-7.75 7.75" />
  <circle cx="9" cy="15" r="6" />
</svg>

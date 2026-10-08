<%-- see https://lucide.dev/icons/vector-polygon --%>

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
  class="${JteHelper.classAppend("lucide lucide-vector-polygon-icon lucide-vector-polygon", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="m12.828 4.813 5.344 2.375" />
  <path d="m15.769 18.153 3.461-8.306" />
  <path d="m5.687 14.074 7.625 4.852" />
  <path d="M9.772 5.579 5.228 11.42" />
  <circle cx="11" cy="4" r="2" />
  <circle cx="15" cy="20" r="2" />
  <circle cx="20" cy="8" r="2" />
  <circle cx="4" cy="13" r="2" />
</svg>

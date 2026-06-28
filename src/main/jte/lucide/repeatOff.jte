<%-- see https://lucide.dev/icons/repeat-off --%>

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
  class="${JteHelper.classAppend("lucide lucide-repeat-off-icon lucide-repeat-off", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M11.656 6H21l-4-4" />
  <path d="M17.898 17.898A4 4 0 0 1 17 18H3l4-4" />
  <path d="m2 2 20 20" />
  <path d="M21 13v1a4 4 0 0 1-.171 1.159" />
  <path d="m21 6-4 4" />
  <path d="M3 11v-1a4 4 0 0 1 3.102-3.898" />
  <path d="m7 22-4-4" />
</svg>

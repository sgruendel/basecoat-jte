<%-- see https://lucide.dev/icons/ruler-dimension-line --%>

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
  class="${JteHelper.classAppend("lucide lucide-ruler-dimension-line-icon lucide-ruler-dimension-line", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M10 15v-3" />
  <path d="M14 15v-3" />
  <path d="M18 15v-3" />
  <path d="M2 8V4" />
  <path d="M22 6H2" />
  <path d="M22 8V4" />
  <path d="M6 15v-3" />
  <rect x="2" y="12" width="20" height="8" rx="2" />
</svg>

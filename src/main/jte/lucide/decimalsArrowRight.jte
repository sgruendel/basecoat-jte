<%-- see https://lucide.dev/icons/decimals-arrow-right --%>

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
  class="${JteHelper.classAppend("lucide lucide-decimals-arrow-right-icon lucide-decimals-arrow-right", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M10 18h10" />
  <path d="m17 21 3-3-3-3" />
  <path d="M3 11h.01" />
  <rect x="15" y="3" width="5" height="8" rx="2.5" />
  <rect x="6" y="3" width="5" height="8" rx="2.5" />
</svg>

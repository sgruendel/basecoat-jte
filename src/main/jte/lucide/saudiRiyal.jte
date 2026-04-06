<%-- see https://lucide.dev/icons/saudi-riyal --%>

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
  class="${JteHelper.classAppend("lucide lucide-saudi-riyal-icon lucide-saudi-riyal", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="m20 19.5-5.5 1.2" />
  <path d="M14.5 4v11.22a1 1 0 0 0 1.242.97L20 15.2" />
  <path d="m2.978 19.351 5.549-1.363A2 2 0 0 0 10 16V2" />
  <path d="M20 10 4 13.5" />
</svg>

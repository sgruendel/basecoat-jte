<%-- see https://lucide.dev/icons/vector-square --%>

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
  class="${JteHelper.classAppend("lucide lucide-vector-square-icon lucide-vector-square", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M17.055 4.533a24 24 0 00-10.11 0" />
  <path d="M19.467 17.055a24 24 0 000-10.11" />
  <path d="M4.533 6.945a24 24 0 000 10.11" />
  <path d="M6.945 19.467a24 24 0 0010.11 0" />
  <circle cx="19" cy="19" r="2" />
  <circle cx="19" cy="5" r="2" />
  <circle cx="5" cy="19" r="2" />
  <circle cx="5" cy="5" r="2" />
</svg>

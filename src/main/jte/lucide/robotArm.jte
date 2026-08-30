<%-- see https://lucide.dev/icons/robot-arm --%>

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
  class="${JteHelper.classAppend("lucide lucide-robot-arm-icon lucide-robot-arm", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 21 7.5 8.322" />
  <path d="m14 7 1.75-3.767a.5.5 0 0 1 .662-.172L20 5.005" />
  <path d="m20 8.998-3.588 1.944a.5.5 0 0 1-.662-.172L14 7H8" />
  <path d="M3.486 21h10" />
  <path d="M5 21V8.732" />
  <circle cx="6" cy="7" r="2" />
</svg>

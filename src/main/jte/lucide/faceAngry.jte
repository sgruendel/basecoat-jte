<%-- see https://lucide.dev/icons/face-angry --%>

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
  class="${JteHelper.classAppend("lucide lucide-face-angry-icon lucide-face-angry", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M15 11V9.416" />
  <path d="M17 9a5 5 0 00-3 1" />
  <path d="M7 9a5 5 0 013 1" />
  <path d="M9 11V9.416" />
  <path d="M9 16a5 5 0 016.001 0" />
  <circle cx="12" cy="12" r="10" />
</svg>

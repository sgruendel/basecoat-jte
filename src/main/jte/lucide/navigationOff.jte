<%-- see https://lucide.dev/icons/navigation-off --%>

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
  class="${JteHelper.classAppend("lucide lucide-navigation-off-icon lucide-navigation-off", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M8.43 8.43 3 11l8 2 2 8 2.57-5.43" />
  <path d="M17.39 11.73 22 2l-9.73 4.61" />
  <line x1="2" x2="22" y1="2" y2="22" />
</svg>

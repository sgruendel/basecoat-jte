<%-- see https://lucide.dev/icons/square-bottom-dashed-scissors --%>

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
  class="${JteHelper.classAppend("lucide lucide-square-bottom-dashed-scissors-icon lucide-square-bottom-dashed-scissors", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M14 21h1" />
  <path d="m17 17-2.18-2.18" />
  <path d="M5 21a2 2 0 01-2-2V5a2 2 0 012-2h14a2 2 0 012 2v14a2 2 0 01-2 2" />
  <path d="M9 21h1" />
  <path d="M9.56 14.44 17 7" />
  <path d="M9.56 9.56 12 12" />
  <circle cx="8.5" cy="15.5" r="1.5" />
  <circle cx="8.5" cy="8.5" r="1.5" />
</svg>

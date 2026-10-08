<%-- see https://lucide.dev/icons/letters --%>

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
  class="${JteHelper.classAppend("lucide lucide-letters-icon lucide-letters", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M15 8H9" />
  <path d="M21 15.354a4 4 0 100 5.292" />
  <path d="M3 18h4a2 2 0 010 4H3.5a.5.5 0 01-.5-.5v-7a.5.5 0 01.5-.5H6a2 2 0 010 4" />
  <path d="m8 10 3.453-7.648a.6.6 0 011.094 0L16 10" />
</svg>

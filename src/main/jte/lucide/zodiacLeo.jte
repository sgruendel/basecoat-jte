<%-- see https://lucide.dev/icons/zodiac-leo --%>

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
  class="${JteHelper.classAppend("lucide lucide-zodiac-leo-icon lucide-zodiac-leo", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M10 16c0-4-3-4.5-3-8a5 5 0 0 1 10 0c0 3.466-3 6.196-3 10a3 3 0 0 0 6 0" />
  <circle cx="7" cy="16" r="3" />
</svg>

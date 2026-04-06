<%-- see https://lucide.dev/icons/zodiac-cancer --%>

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
  class="${JteHelper.classAppend("lucide lucide-zodiac-cancer-icon lucide-zodiac-cancer", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M21 14.5A9 6.5 0 0 1 5.5 19" />
  <path d="M3 9.5A9 6.5 0 0 1 18.5 5" />
  <circle cx="17.5" cy="14.5" r="3.5" />
  <circle cx="6.5" cy="9.5" r="3.5" />
</svg>

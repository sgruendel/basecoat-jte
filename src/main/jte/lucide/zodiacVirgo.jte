<%-- see https://lucide.dev/icons/zodiac-virgo --%>

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
  class="${JteHelper.classAppend("lucide lucide-zodiac-virgo-icon lucide-zodiac-virgo", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M11 5.5a1 1 0 0 1 5 0V16a5 5 0 0 0 5 5" />
  <path d="M16 11.5a1 1 0 0 1 5 0V16a5 5 0 0 1-5 5" />
  <path d="M6 19V6a3 3 0 0 0-3-3h0" />
  <path d="M6 5.5a1 1 0 0 1 5 0V19" />
</svg>

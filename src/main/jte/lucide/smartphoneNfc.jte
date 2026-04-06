<%-- see https://lucide.dev/icons/smartphone-nfc --%>

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
  class="${JteHelper.classAppend("lucide lucide-smartphone-nfc-icon lucide-smartphone-nfc", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <rect width="7" height="12" x="2" y="6" rx="1" />
  <path d="M13 8.32a7.43 7.43 0 0 1 0 7.36" />
  <path d="M16.46 6.21a11.76 11.76 0 0 1 0 11.58" />
  <path d="M19.91 4.1a15.91 15.91 0 0 1 .01 15.8" />
</svg>

<%-- see https://lucide.dev/icons/scan-box --%>

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
  class="${JteHelper.classAppend("lucide lucide-scan-box-icon lucide-scan-box", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 12v5.5" />
  <path d="M17 3h2a2 2 0 012 2v2" />
  <path d="M21 17v2a2 2 0 01-2 2h-2" />
  <path d="M3 7V5a2 2 0 012-2h2" />
  <path d="M7 21H5a2 2 0 01-2-2v-2" />
  <path d="M7.264 9.252 12 12l4.737-2.748" />
  <path
    d="M7.995 8.514A2 2 0 007 10.244v3.516a2 2 0 00.996 1.73l3 1.74a2 2 0 002.008 0l3-1.74A2 2 0 0017 13.76v-3.517a2 2 0 00-.995-1.73l-3-1.742a2 2 0 00-1.892-.064z"
  />
</svg>

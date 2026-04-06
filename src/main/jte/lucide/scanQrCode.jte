<%-- see https://lucide.dev/icons/scan-qr-code --%>

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
  class="${JteHelper.classAppend("lucide lucide-scan-qr-code-icon lucide-scan-qr-code", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M17 12v4a1 1 0 0 1-1 1h-4" />
  <path d="M17 3h2a2 2 0 0 1 2 2v2" />
  <path d="M17 8V7" />
  <path d="M21 17v2a2 2 0 0 1-2 2h-2" />
  <path d="M3 7V5a2 2 0 0 1 2-2h2" />
  <path d="M7 17h.01" />
  <path d="M7 21H5a2 2 0 0 1-2-2v-2" />
  <rect x="7" y="7" width="5" height="5" rx="1" />
</svg>

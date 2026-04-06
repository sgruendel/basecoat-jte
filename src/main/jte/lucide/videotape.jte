<%-- see https://lucide.dev/icons/videotape --%>

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
  class="${JteHelper.classAppend("lucide lucide-videotape-icon lucide-videotape", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <rect width="20" height="16" x="2" y="4" rx="2" />
  <path d="M2 8h20" />
  <circle cx="8" cy="14" r="2" />
  <path d="M8 12h8" />
  <circle cx="16" cy="14" r="2" />
</svg>

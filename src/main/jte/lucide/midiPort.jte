<%-- see https://lucide.dev/icons/midi-port --%>

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
  class="${JteHelper.classAppend("lucide lucide-midi-port-icon lucide-midi-port", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 18h.01" />
  <path d="M15 2.458V5a1 1 0 01-1 1h-4a1 1 0 01-1-1V2.458" />
  <path d="M16 16h.01" />
  <path d="M18 12h.01" />
  <path d="M6 12h.01" />
  <path d="M8 16h.01" />
  <circle cx="12" cy="12" r="10" />
</svg>

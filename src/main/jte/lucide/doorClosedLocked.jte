<%-- see https://lucide.dev/icons/door-closed-locked --%>

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
  class="${JteHelper.classAppend("lucide lucide-door-closed-locked-icon lucide-door-closed-locked", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M19 8V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16" />
  <path d="M2 21h8" />
  <path d="M20 16v-2a2 2 0 00-4 0v2" />
  <path d="M9 12h.01" />
  <rect x="14" y="16" width="8" height="5" rx="1" />
</svg>

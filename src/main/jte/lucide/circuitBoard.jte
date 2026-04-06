<%-- see https://lucide.dev/icons/circuit-board --%>

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
  class="${JteHelper.classAppend("lucide lucide-circuit-board-icon lucide-circuit-board", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <rect width="18" height="18" x="3" y="3" rx="2" />
  <path d="M11 9h4a2 2 0 0 0 2-2V3" />
  <circle cx="9" cy="9" r="2" />
  <path d="M7 21v-4a2 2 0 0 1 2-2h4" />
  <circle cx="15" cy="15" r="2" />
</svg>

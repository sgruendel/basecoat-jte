<%-- see https://lucide.dev/icons/bell-electric --%>

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
  class="${JteHelper.classAppend("lucide lucide-bell-electric-icon lucide-bell-electric", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M18.518 17.347A7 7 0 0 1 14 19" />
  <path d="M18.8 4A11 11 0 0 1 20 9" />
  <path d="M9 9h.01" />
  <circle cx="20" cy="16" r="2" />
  <circle cx="9" cy="9" r="7" />
  <rect x="4" y="16" width="10" height="6" rx="2" />
</svg>

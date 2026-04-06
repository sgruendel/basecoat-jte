<%-- see https://lucide.dev/icons/waypoints --%>

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
  class="${JteHelper.classAppend("lucide lucide-waypoints-icon lucide-waypoints", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="m10.586 5.414-5.172 5.172" />
  <path d="m18.586 13.414-5.172 5.172" />
  <path d="M6 12h12" />
  <circle cx="12" cy="20" r="2" />
  <circle cx="12" cy="4" r="2" />
  <circle cx="20" cy="12" r="2" />
  <circle cx="4" cy="12" r="2" />
</svg>

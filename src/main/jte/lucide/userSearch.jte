<%-- see https://lucide.dev/icons/user-search --%>

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
  class="${JteHelper.classAppend("lucide lucide-user-search-icon lucide-user-search", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <circle cx="10" cy="7" r="4" />
  <path d="M10.3 15H7a4 4 0 0 0-4 4v2" />
  <circle cx="17" cy="17" r="3" />
  <path d="m21 21-1.9-1.9" />
</svg>

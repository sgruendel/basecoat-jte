<%-- see https://lucide.dev/icons/database-search --%>

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
  class="${JteHelper.classAppend("lucide lucide-database-search-icon lucide-database-search", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M21 11.693V5" />
  <path d="m22 22-1.875-1.875" />
  <path d="M3 12a9 3 0 0 0 8.697 2.998" />
  <path d="M3 5v14a9 3 0 0 0 9.28 2.999" />
  <circle cx="18" cy="18" r="3" />
  <ellipse cx="12" cy="5" rx="9" ry="3" />
</svg>

<%-- see https://lucide.dev/icons/database-plus --%>

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
  class="${JteHelper.classAppend("lucide lucide-database-plus-icon lucide-database-plus", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M19 16v6" />
  <path d="M21 12.536V5" />
  <path d="M22 19h-6" />
  <path d="M3 12A9 3 0 0 0 15.1824 14.8061" />
  <path d="M3 5V19A9 3 0 0 0 13.318 21.968" />
  <ellipse cx="12" cy="5" rx="9" ry="3" />
</svg>

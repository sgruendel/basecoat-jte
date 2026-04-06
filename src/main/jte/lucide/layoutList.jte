<%-- see https://lucide.dev/icons/layout-list --%>

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
  class="${JteHelper.classAppend("lucide lucide-layout-list-icon lucide-layout-list", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <rect width="7" height="7" x="3" y="3" rx="1" />
  <rect width="7" height="7" x="3" y="14" rx="1" />
  <path d="M14 4h7" />
  <path d="M14 9h7" />
  <path d="M14 15h7" />
  <path d="M14 20h7" />
</svg>

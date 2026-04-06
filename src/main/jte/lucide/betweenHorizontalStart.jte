<%-- see https://lucide.dev/icons/between-horizontal-start --%>

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
  class="${JteHelper.classAppend("lucide lucide-between-horizontal-start-icon lucide-between-horizontal-start", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <rect width="13" height="7" x="8" y="3" rx="1" />
  <path d="m2 9 3 3-3 3" />
  <rect width="13" height="7" x="8" y="14" rx="1" />
</svg>

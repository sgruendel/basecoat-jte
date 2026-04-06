<%-- see https://lucide.dev/icons/align-vertical-space-between --%>

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
  class="${JteHelper.classAppend("lucide lucide-align-vertical-space-between-icon lucide-align-vertical-space-between", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <rect width="14" height="6" x="5" y="15" rx="2" />
  <rect width="10" height="6" x="7" y="3" rx="2" />
  <path d="M2 21h20" />
  <path d="M2 3h20" />
</svg>

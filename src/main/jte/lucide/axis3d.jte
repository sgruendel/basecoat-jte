<%-- see https://lucide.dev/icons/axis-3d --%>

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
  class="${JteHelper.classAppend("lucide lucide-axis-3d-icon lucide-axis-3d", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M13.5 10.5 15 9" />
  <path d="M4 4v15a1 1 0 0 0 1 1h15" />
  <path d="M4.293 19.707 6 18" />
  <path d="m9 15 1.5-1.5" />
</svg>

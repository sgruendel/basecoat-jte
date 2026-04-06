<%-- see https://lucide.dev/icons/picture-in-picture --%>

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
  class="${JteHelper.classAppend("lucide lucide-picture-in-picture-icon lucide-picture-in-picture", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M2 10h6V4" />
  <path d="m2 4 6 6" />
  <path d="M21 10V7a2 2 0 0 0-2-2h-7" />
  <path d="M3 14v2a2 2 0 0 0 2 2h3" />
  <rect x="12" y="14" width="10" height="7" rx="1" />
</svg>

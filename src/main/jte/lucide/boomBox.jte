<%-- see https://lucide.dev/icons/boom-box --%>

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
  class="${JteHelper.classAppend("lucide lucide-boom-box-icon lucide-boom-box", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M4 9V5a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v4" />
  <path d="M8 8v1" />
  <path d="M12 8v1" />
  <path d="M16 8v1" />
  <rect width="20" height="12" x="2" y="9" rx="2" />
  <circle cx="8" cy="15" r="2" />
  <circle cx="16" cy="15" r="2" />
</svg>

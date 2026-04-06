<%-- see https://lucide.dev/icons/disc-3 --%>

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
  class="${JteHelper.classAppend("lucide lucide-disc-3-icon lucide-disc-3", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <circle cx="12" cy="12" r="10" />
  <path d="M6 12c0-1.7.7-3.2 1.8-4.2" />
  <circle cx="12" cy="12" r="2" />
  <path d="M18 12c0 1.7-.7 3.2-1.8 4.2" />
</svg>

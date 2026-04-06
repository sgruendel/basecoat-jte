<%-- see https://lucide.dev/icons/pill-bottle --%>

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
  class="${JteHelper.classAppend("lucide lucide-pill-bottle-icon lucide-pill-bottle", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M18 11h-4a1 1 0 0 0-1 1v5a1 1 0 0 0 1 1h4" />
  <path d="M6 7v13a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V7" />
  <rect width="16" height="5" x="4" y="2" rx="1" />
</svg>

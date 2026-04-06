<%-- see https://lucide.dev/icons/cigarette --%>

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
  class="${JteHelper.classAppend("lucide lucide-cigarette-icon lucide-cigarette", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M17 12H3a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h14" />
  <path d="M18 8c0-2.5-2-2.5-2-5" />
  <path d="M21 16a1 1 0 0 0 1-1v-2a1 1 0 0 0-1-1" />
  <path d="M22 8c0-2.5-2-2.5-2-5" />
  <path d="M7 12v4" />
</svg>

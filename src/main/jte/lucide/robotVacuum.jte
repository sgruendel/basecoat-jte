<%-- see https://lucide.dev/icons/robot-vacuum --%>

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
  class="${JteHelper.classAppend("lucide lucide-robot-vacuum-icon lucide-robot-vacuum", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M11 17h2" />
  <path d="M12 12h.01" />
  <path d="M17 12a5 5 0 00-10 0" />
  <path d="M19 2v2.8" />
  <path d="M2 5h2.8" />
  <path d="M22 5h-2.8" />
  <path d="M5 2v2.8" />
  <circle cx="12" cy="12" r="10" />
</svg>

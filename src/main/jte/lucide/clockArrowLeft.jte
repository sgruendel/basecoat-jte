<%-- see https://lucide.dev/icons/clock-arrow-left --%>

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
  class="${JteHelper.classAppend("lucide lucide-clock-arrow-left-icon lucide-clock-arrow-left", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 6v6l1.5.8" />
  <path d="M12.338 21.994a10 10 0 1 1 9.587-8.767" />
  <path d="M14 18h8" />
  <path d="m18 22-4-4 4-4" />
</svg>

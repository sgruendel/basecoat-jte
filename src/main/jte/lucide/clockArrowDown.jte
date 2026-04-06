<%-- see https://lucide.dev/icons/clock-arrow-down --%>

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
  class="${JteHelper.classAppend("lucide lucide-clock-arrow-down-icon lucide-clock-arrow-down", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 6v6l2 1" />
  <path d="M12.337 21.994a10 10 0 1 1 9.588-8.767" />
  <path d="m14 18 4 4 4-4" />
  <path d="M18 14v8" />
</svg>

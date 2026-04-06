<%-- see https://lucide.dev/icons/clock-arrow-up --%>

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
  class="${JteHelper.classAppend("lucide lucide-clock-arrow-up-icon lucide-clock-arrow-up", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 6v6l1.56.78" />
  <path d="M13.227 21.925a10 10 0 1 1 8.767-9.588" />
  <path d="m14 18 4-4 4 4" />
  <path d="M18 22v-8" />
</svg>

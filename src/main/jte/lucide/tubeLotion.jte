<%-- see https://lucide.dev/icons/tube-lotion --%>

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
  class="${JteHelper.classAppend("lucide lucide-tube-lotion-icon lucide-tube-lotion", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M15 18v3a1 1 0 0 1-1 1h-4a1 1 0 0 1-1-1v-3" />
  <path
    d="M17 2a2 2 0 0 1 1.6 3.2A8 8 0 0 0 17 10v6a2 2 0 0 1-2 2H9a2 2 0 0 1-2-2v-6a8 8 0 0 0-1.6-4.8A2 2 0 0 1 7 2z"
  />
  <path d="M7 10a6.47 6.47 0 0 1 5 0 6.47 6.47 0 0 0 5 0" />
</svg>

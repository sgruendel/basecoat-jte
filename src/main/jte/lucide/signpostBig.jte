<%-- see https://lucide.dev/icons/signpost-big --%>

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
  class="${JteHelper.classAppend("lucide lucide-signpost-big-icon lucide-signpost-big", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M10 9H4L2 7l2-2h6" />
  <path d="M14 5h6l2 2-2 2h-6" />
  <path d="M10 22V4a2 2 0 1 1 4 0v18" />
  <path d="M8 22h8" />
</svg>

<%-- see https://lucide.dev/icons/toothbrush-sparkles --%>

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
  class="${JteHelper.classAppend("lucide lucide-toothbrush-sparkles-icon lucide-toothbrush-sparkles", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M10 3H8" />
  <path d="M14.586 11.414 22 4" />
  <path d="M15 11a8 8 0 01-.429.4" />
  <path
    d="m2 22 7-7c1.857-1.857 3.714-1.99 5.571-3.6l-1.985-1.986A2 2 0 0114 6a2 2 0 012-2 2 2 0 013.262-1.552l2.152 2.138"
  />
  <path d="M20 15v4" />
  <path d="M22 17h-4" />
  <path d="M4 5v4" />
  <path d="M6 7H2" />
  <path d="M9 2v2" />
</svg>

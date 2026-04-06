<%-- see https://lucide.dev/icons/balloon --%>

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
  class="${JteHelper.classAppend("lucide lucide-balloon-icon lucide-balloon", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 16v1a2 2 0 0 0 2 2h1a2 2 0 0 1 2 2v1" />
  <path d="M12 6a2 2 0 0 1 2 2" />
  <path d="M18 8c0 4-3.5 8-6 8s-6-4-6-8a6 6 0 0 1 12 0" />
</svg>

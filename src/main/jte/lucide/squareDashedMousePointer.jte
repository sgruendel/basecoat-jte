<%-- see https://lucide.dev/icons/square-dashed-mouse-pointer --%>

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
  class="${JteHelper.classAppend("lucide lucide-square-dashed-mouse-pointer-icon lucide-square-dashed-mouse-pointer", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path
    d="M12.034 12.681a.498.498 0 0 1 .647-.647l9 3.5a.5.5 0 0 1-.033.943l-3.444 1.068a1 1 0 0 0-.66.66l-1.067 3.443a.5.5 0 0 1-.943.033z"
  />
  <path d="M5 3a2 2 0 0 0-2 2" />
  <path d="M19 3a2 2 0 0 1 2 2" />
  <path d="M5 21a2 2 0 0 1-2-2" />
  <path d="M9 3h1" />
  <path d="M9 21h2" />
  <path d="M14 3h1" />
  <path d="M3 9v1" />
  <path d="M21 9v2" />
  <path d="M3 14v1" />
</svg>

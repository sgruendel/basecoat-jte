<%-- see https://lucide.dev/icons/message-square-dashed --%>

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
  class="${JteHelper.classAppend("lucide lucide-message-square-dashed-icon lucide-message-square-dashed", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M14 3h2" />
  <path d="M16 19h-2" />
  <path d="M2 12v-2" />
  <path d="M2 16v5.286a.71.71 0 0 0 1.212.502l1.149-1.149" />
  <path d="M20 19a2 2 0 0 0 2-2v-1" />
  <path d="M22 10v2" />
  <path d="M22 6V5a2 2 0 0 0-2-2" />
  <path d="M4 3a2 2 0 0 0-2 2v1" />
  <path d="M8 19h2" />
  <path d="M8 3h2" />
</svg>

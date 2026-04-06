<%-- see https://lucide.dev/icons/book-lock --%>

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
  class="${JteHelper.classAppend("lucide lucide-book-lock-icon lucide-book-lock", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M18 6V4a2 2 0 1 0-4 0v2" />
  <path d="M20 15v6a1 1 0 0 1-1 1H6.5a1 1 0 0 1 0-5H20" />
  <path d="M4 19.5v-15A2.5 2.5 0 0 1 6.5 2H10" />
  <rect x="12" y="6" width="8" height="5" rx="1" />
</svg>

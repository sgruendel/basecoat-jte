<%-- see https://lucide.dev/icons/square-asterisk --%>

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
  class="${JteHelper.classAppend("lucide lucide-square-asterisk-icon lucide-square-asterisk", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <rect width="18" height="18" x="3" y="3" rx="2" />
  <path d="M12 8v8" />
  <path d="m8.5 14 7-4" />
  <path d="m8.5 10 7 4" />
</svg>

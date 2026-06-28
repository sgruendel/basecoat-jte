<%-- see https://lucide.dev/icons/eye-dashed --%>

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
  class="${JteHelper.classAppend("lucide lucide-eye-dashed-icon lucide-eye-dashed", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M13.054 18.946a11 11 0 0 1-2.11 0" />
  <path d="M13.054 5.054a11 11 0 0 0-2.11-.001" />
  <path d="M17.072 6.274a11 11 0 0 1 1.753 1.173" />
  <path d="M18.825 16.552a11 11 0 0 1-1.753 1.174" />
  <path d="M2.514 13.303a11 11 0 0 1-.452-.954 1 1 0 0 1 0-.697 11 11 0 0 1 .45-.955" />
  <path d="M21.485 10.697a11 11 0 0 1 .453.955 1 1 0 0 1 0 .697 11 11 0 0 1-.453.954" />
  <path d="M5.173 7.448a11 11 0 0 1 1.753-1.174" />
  <path d="M6.926 17.726a11 11 0 0 1-1.753-1.174" />
  <circle cx="12" cy="12" r="3" />
</svg>

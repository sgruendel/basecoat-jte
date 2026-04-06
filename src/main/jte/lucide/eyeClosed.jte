<%-- see https://lucide.dev/icons/eye-closed --%>

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
  class="${JteHelper.classAppend("lucide lucide-eye-closed-icon lucide-eye-closed", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="m15 18-.722-3.25" />
  <path d="M2 8a10.645 10.645 0 0 0 20 0" />
  <path d="m20 15-1.726-2.05" />
  <path d="m4 15 1.726-2.05" />
  <path d="m9 18 .722-3.25" />
</svg>

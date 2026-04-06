<%-- see https://lucide.dev/icons/radius --%>

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
  class="${JteHelper.classAppend("lucide lucide-radius-icon lucide-radius", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M20.34 17.52a10 10 0 1 0-2.82 2.82" />
  <circle cx="19" cy="19" r="2" />
  <path d="m13.41 13.41 4.18 4.18" />
  <circle cx="12" cy="12" r="2" />
</svg>

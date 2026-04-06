<%-- see https://lucide.dev/icons/aperture --%>

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
  class="${JteHelper.classAppend("lucide lucide-aperture-icon lucide-aperture", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <circle cx="12" cy="12" r="10" />
  <path d="m14.31 8 5.74 9.94" />
  <path d="M9.69 8h11.48" />
  <path d="m7.38 12 5.74-9.94" />
  <path d="M9.69 16 3.95 6.06" />
  <path d="M14.31 16H2.83" />
  <path d="m16.62 12-5.74 9.94" />
</svg>

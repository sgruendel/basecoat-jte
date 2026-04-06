<%-- see https://lucide.dev/icons/loader-pinwheel --%>

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
  class="${JteHelper.classAppend("lucide lucide-loader-pinwheel-icon lucide-loader-pinwheel", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M22 12a1 1 0 0 1-10 0 1 1 0 0 0-10 0" />
  <path d="M7 20.7a1 1 0 1 1 5-8.7 1 1 0 1 0 5-8.6" />
  <path d="M7 3.3a1 1 0 1 1 5 8.6 1 1 0 1 0 5 8.6" />
  <circle cx="12" cy="12" r="10" />
</svg>

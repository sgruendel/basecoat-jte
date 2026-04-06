<%-- see https://lucide.dev/icons/thermometer-sun --%>

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
  class="${JteHelper.classAppend("lucide lucide-thermometer-sun-icon lucide-thermometer-sun", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 2v2" />
  <path d="M12 8a4 4 0 0 0-1.645 7.647" />
  <path d="M2 12h2" />
  <path d="M20 14.54a4 4 0 1 1-4 0V4a2 2 0 0 1 4 0z" />
  <path d="m4.93 4.93 1.41 1.41" />
  <path d="m6.34 17.66-1.41 1.41" />
</svg>

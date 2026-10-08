<%-- see https://lucide.dev/icons/carton-off --%>

@import java.util.Map
@import com.basecoatui.jte.util.JteHelper

@param int size = 24
@param String fill = "none"
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
  fill="${fill}"
  stroke="${color}"
  stroke-width="${calculatedStrokeWidth}"
  stroke-linecap="round"
  stroke-linejoin="round"
  class="${JteHelper.classAppend("lucide lucide-carton-off-icon lucide-carton-off", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M10 10H5v10a2 2 0 002 2h10a2 2 0 002-2v-1" />
  <path d="M13 22v-9" />
  <path d="M13.902 8.245 16 6h-4.343" />
  <path d="M19 13.343V10a2 2 0 00-.539-1.367L16 6V3a1 1 0 00-1-1H9a1 1 0 00-.857.486" />
  <path d="m2 2 20 20" />
  <path d="M7.034 7.034 5.539 8.633A2 2 0 005 10" />
</svg>

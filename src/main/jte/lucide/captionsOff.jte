<%-- see https://lucide.dev/icons/captions-off --%>

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
  class="${JteHelper.classAppend("lucide lucide-captions-off-icon lucide-captions-off", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M10.5 5H19a2 2 0 0 1 2 2v8.5" />
  <path d="M17 11h-.5" />
  <path d="M19 19H5a2 2 0 0 1-2-2V7a2 2 0 0 1 2-2" />
  <path d="m2 2 20 20" />
  <path d="M7 11h4" />
  <path d="M7 15h2.5" />
</svg>

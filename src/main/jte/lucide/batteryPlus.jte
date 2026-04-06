<%-- see https://lucide.dev/icons/battery-plus --%>

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
  class="${JteHelper.classAppend("lucide lucide-battery-plus-icon lucide-battery-plus", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M10 9v6" />
  <path d="M12.543 6H16a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2h-3.605" />
  <path d="M22 14v-4" />
  <path d="M7 12h6" />
  <path d="M7.606 18H4a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h3.606" />
</svg>

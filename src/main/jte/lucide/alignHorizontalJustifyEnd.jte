<%-- see https://lucide.dev/icons/align-horizontal-justify-end --%>

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
  class="${JteHelper.classAppend("lucide lucide-align-horizontal-justify-end-icon lucide-align-horizontal-justify-end", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <rect width="6" height="14" x="2" y="5" rx="2" />
  <rect width="6" height="10" x="12" y="7" rx="2" />
  <path d="M22 2v20" />
</svg>

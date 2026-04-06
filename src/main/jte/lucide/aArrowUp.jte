<%-- see https://lucide.dev/icons/a-arrow-up --%>

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
  class="${JteHelper.classAppend("lucide lucide-a-arrow-up-icon lucide-a-arrow-up", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="m14 11 4-4 4 4" />
  <path d="M18 16V7" />
  <path d="m2 16 4.039-9.69a.5.5 0 0 1 .923 0L11 16" />
  <path d="M3.304 13h6.392" />
</svg>

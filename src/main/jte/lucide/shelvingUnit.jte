<%-- see https://lucide.dev/icons/shelving-unit --%>

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
  class="${JteHelper.classAppend("lucide lucide-shelving-unit-icon lucide-shelving-unit", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 12V9a1 1 0 0 0-1-1H9a1 1 0 0 0-1 1v3" />
  <path d="M16 20v-3a1 1 0 0 0-1-1h-2a1 1 0 0 0-1 1v3" />
  <path d="M20 22V2" />
  <path d="M4 12h16" />
  <path d="M4 20h16" />
  <path d="M4 2v20" />
  <path d="M4 4h16" />
</svg>

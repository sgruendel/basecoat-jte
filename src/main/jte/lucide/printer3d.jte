<%-- see https://lucide.dev/icons/printer-3d --%>

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
  class="${JteHelper.classAppend("lucide lucide-printer-3d-icon lucide-printer-3d", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M10 11v1" />
  <path d="M12 8h8" />
  <path d="M15 20v-3a1 1 0 00-1-1H9a1 1 0 00-1 1v3" />
  <path d="M4 20h16" />
  <path d="M4 22V4a2 2 0 012-2h12a2 2 0 012 2v18" />
  <path d="M4 8h4" />
  <path
    d="M8.635 10.093A2 2 0 018 8.631V7a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 01-.293.707l-1 1a1 1 0 01-1.414 0z"
  />
</svg>

<%-- see https://lucide.dev/icons/building-complex-plus --%>

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
  class="${JteHelper.classAppend("lucide lucide-building-complex-plus-icon lucide-building-complex-plus", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M10 12h4" />
  <path d="M10 21v-3a2 2 0 013.05-1.702" />
  <path d="M10 8h4" />
  <path d="M16 19h6" />
  <path d="M18 7h2a2 2 0 012 2v4.355" />
  <path d="M19 16v6" />
  <path d="M6 10H4a2 2 0 00-2 2v7a2 2 0 002 2h8.535" />
  <path d="M6 21V5a2 2 0 012-2h8a2 2 0 012 2v7.126" />
</svg>

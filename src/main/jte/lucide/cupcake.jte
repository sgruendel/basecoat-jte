<%-- see https://lucide.dev/icons/cupcake --%>

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
  class="${JteHelper.classAppend("lucide lucide-cupcake-icon lucide-cupcake", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 22v-9" />
  <path d="M14 4h1a3 3 0 013 3l-.004.125A4 4 0 0121 11v2" />
  <path d="m15.5 22 1.5-9" />
  <path
    d="M21 13a1 1 0 01.919 1.394l-2.74 6.394A2 2 0 0117.34 22H6.659a2 2 0 01-1.838-1.212l-2.74-6.394A1 1 0 013 13z"
  />
  <path d="M3 13v-2a4 4 0 013.003-3.875L6 7a3 3 0 013-3h1" />
  <path d="M8.5 22 7 13" />
  <circle cx="12" cy="4" r="2" />
</svg>

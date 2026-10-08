<%-- see https://lucide.dev/icons/trash-off --%>

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
  class="${JteHelper.classAppend("lucide lucide-trash-off-icon lucide-trash-off", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M10 11v6" />
  <path d="M14 17v-3" />
  <path d="M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-1.576.768" />
  <path d="M19 6v7.344" />
  <path d="m2 2 20 20" />
  <path d="M21 6h-9.344" />
  <path d="M3 6h3" />
  <path d="M5 6v14a2 2 0 002 2h10a2 2 0 002-2v-1" />
</svg>

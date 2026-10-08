<%-- see https://lucide.dev/icons/groceries --%>

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
  class="${JteHelper.classAppend("lucide lucide-groceries-icon lucide-groceries", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M10 15h4" />
  <path
    d="M19.424 11.095a2.5 2.5 0 00.471-2.309 2 2 0 00.424-3.286 2 2 0 00-2.143-3.322 2 2 0 00-.676.502 2 2 0 00-3.287.424 2.5 2.5 0 00-3.189 2.06A3 3 0 0012 11l4-4"
  />
  <path d="M4 12.006A1 1 0 014.994 11H19a1 1 0 011 1v7a2 2 0 01-2 2H6a2 2 0 01-2-2z" />
  <path d="M7 11a4 4 0 01-4-4V5a1 1 0 011-1h2a4 4 0 013.584 2.222" />
</svg>

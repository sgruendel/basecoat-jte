<%-- see https://lucide.dev/icons/dome --%>

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
  class="${JteHelper.classAppend("lucide lucide-dome-icon lucide-dome", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M10 21v-3a2 2 0 014 0v3" />
  <path d="M12 2v2" />
  <path d="M18 12v9" />
  <path d="M22 19a2 2 0 01-2 2H4a2 2 0 01-2-2v-6a1 1 0 011-1h18a1 1 0 011 1z" />
  <path d="M4 12a8 8 0 0116 0" />
  <path d="M6 12v9" />
</svg>

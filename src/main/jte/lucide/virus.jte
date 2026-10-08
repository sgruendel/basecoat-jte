<%-- see https://lucide.dev/icons/virus --%>

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
  class="${JteHelper.classAppend("lucide lucide-virus-icon lucide-virus", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 14.991h.01" />
  <path d="M12 22v-3" />
  <path d="M12 2v3" />
  <path d="M13 22h-2" />
  <path d="M13 2h-2" />
  <path d="M13.99 10H14" />
  <path d="m16.5 19.794-1-1.733" />
  <path d="m16.5 4.205-1 1.732" />
  <path d="m19.794 16.5-1.732-1" />
  <path d="m19.794 7.5-1.732 1" />
  <path d="M2 12h3" />
  <path d="M2 13v-2" />
  <path d="M22 12h-3" />
  <path d="M22 13v-2" />
  <path d="m4.206 16.5 1.732-1" />
  <path d="m4.206 7.5 1.732 1" />
  <path d="m7.5 19.794 1-1.733" />
  <path d="m7.5 4.205 1 1.732" />
  <path d="M9 12h.01" />
  <circle cx="12" cy="12" r="7" />
</svg>

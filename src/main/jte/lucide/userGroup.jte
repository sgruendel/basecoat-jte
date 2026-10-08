<%-- see https://lucide.dev/icons/user-group --%>

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
  class="${JteHelper.classAppend("lucide lucide-user-group-icon lucide-user-group", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M17 21v-1a2 2 0 00-2-2H9a2 2 0 00-2 2v1" />
  <path d="M19 10h1a2 2 0 012 2v1" />
  <path d="M5 10H4a2 2 0 00-2 2v1" />
  <circle cx="12" cy="11" r="3" />
  <circle cx="18" cy="4" r="2" />
  <circle cx="6" cy="4" r="2" />
</svg>

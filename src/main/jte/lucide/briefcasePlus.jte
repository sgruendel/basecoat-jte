<%-- see https://lucide.dev/icons/briefcase-plus --%>

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
  class="${JteHelper.classAppend("lucide lucide-briefcase-plus-icon lucide-briefcase-plus", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M13.354 20H4a2 2 0 01-2-2V8a2 2 0 012-2h16a2 2 0 012 2v3.354" />
  <path d="M16 11.354V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v16" />
  <path d="M16 17h6" />
  <path d="M19 14v6" />
</svg>

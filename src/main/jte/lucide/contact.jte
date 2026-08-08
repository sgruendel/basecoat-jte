<%-- see https://lucide.dev/icons/contact --%>

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
  class="${JteHelper.classAppend("lucide lucide-contact-icon lucide-contact", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M16 2v2" />
  <path d="M7 21v-2a2 2 0 012-2h6a2 2 0 012 2v2" />
  <path d="M8 2v2" />
  <circle cx="12" cy="10" r="3" />
  <rect x="3" y="3" width="18" height="18" rx="2" />
</svg>

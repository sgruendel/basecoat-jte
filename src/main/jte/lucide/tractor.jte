<%-- see https://lucide.dev/icons/tractor --%>

@import java.util.Map
@import com.basecoatui.jte.util.JteHelper

@param int size = 24
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
  fill="none"
  stroke="${color}"
  stroke-width="${calculatedStrokeWidth}"
  stroke-linecap="round"
  stroke-linejoin="round"
  class="${JteHelper.classAppend("lucide lucide-tractor-icon lucide-tractor", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="m10 11 11 .9a1 1 0 0 1 .8 1.1l-.665 4.158a1 1 0 0 1-.988.842H20" />
  <path d="M16 18h-5" />
  <path d="M18 5a1 1 0 0 0-1 1v5.573" />
  <path d="M3 4h8.129a1 1 0 0 1 .99.863L13 11.246" />
  <path d="M4 11V4" />
  <path d="M7 15h.01" />
  <path d="M8 10.1V4" />
  <circle cx="18" cy="18" r="2" />
  <circle cx="7" cy="15" r="5" />
</svg>

<%-- see https://lucide.dev/icons/spray-can --%>

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
  class="${JteHelper.classAppend("lucide lucide-spray-can-icon lucide-spray-can", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M3 3h.01" />
  <path d="M7 5h.01" />
  <path d="M11 7h.01" />
  <path d="M3 7h.01" />
  <path d="M7 9h.01" />
  <path d="M3 11h.01" />
  <rect width="4" height="4" x="15" y="5" />
  <path d="m19 9 2 2v10c0 .6-.4 1-1 1h-6c-.6 0-1-.4-1-1V11l2-2" />
  <path d="m13 14 8-2" />
  <path d="m13 19 8-2" />
</svg>

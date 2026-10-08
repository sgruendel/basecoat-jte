<%-- see https://lucide.dev/icons/can --%>

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
  class="${JteHelper.classAppend("lucide lucide-can-icon lucide-can", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M21 10.5a9 2.5 0 01-18 0v8a9 2.5 0 0018 0z" />
  <path d="M21 10.5A9 2.5 25.32 004.59 3.47 9 2.5 25.32 0021 10.5" />
  <path d="M3 10.5a9 2.5 0 016.527-2.405" />
  <path d="M9 16.858a31 31 0 006 0" />
</svg>

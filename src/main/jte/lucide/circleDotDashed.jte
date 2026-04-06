<%-- see https://lucide.dev/icons/circle-dot-dashed --%>

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
  class="${JteHelper.classAppend("lucide lucide-circle-dot-dashed-icon lucide-circle-dot-dashed", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M10.1 2.18a9.93 9.93 0 0 1 3.8 0" />
  <path d="M17.6 3.71a9.95 9.95 0 0 1 2.69 2.7" />
  <path d="M21.82 10.1a9.93 9.93 0 0 1 0 3.8" />
  <path d="M20.29 17.6a9.95 9.95 0 0 1-2.7 2.69" />
  <path d="M13.9 21.82a9.94 9.94 0 0 1-3.8 0" />
  <path d="M6.4 20.29a9.95 9.95 0 0 1-2.69-2.7" />
  <path d="M2.18 13.9a9.93 9.93 0 0 1 0-3.8" />
  <path d="M3.71 6.4a9.95 9.95 0 0 1 2.7-2.69" />
  <circle cx="12" cy="12" r="1" />
</svg>

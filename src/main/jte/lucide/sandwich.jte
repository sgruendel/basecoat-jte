<%-- see https://lucide.dev/icons/sandwich --%>

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
  class="${JteHelper.classAppend("lucide lucide-sandwich-icon lucide-sandwich", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="m2.37 11.223 8.372-6.777a2 2 0 0 1 2.516 0l8.371 6.777" />
  <path d="M21 15a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-5.25" />
  <path d="M3 15a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h9" />
  <path d="m6.67 15 6.13 4.6a2 2 0 0 0 2.8-.4l3.15-4.2" />
  <rect width="20" height="4" x="2" y="11" rx="1" />
</svg>

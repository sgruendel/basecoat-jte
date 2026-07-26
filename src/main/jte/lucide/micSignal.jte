<%-- see https://lucide.dev/icons/mic-signal --%>

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
  class="${JteHelper.classAppend("lucide lucide-mic-signal-icon lucide-mic-signal", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 17v4" />
  <path d="M18 11a6 6 0 00-3-5.197" />
  <path d="M2 11a10 10 0 015-8.662" />
  <path d="M22 11a10 10 0 00-5-8.662" />
  <path d="M6 11a6 6 0 013-5.197" />
  <path d="M9 21h6" />
  <rect x="10" y="9" width="4" height="8" rx="2" />
</svg>

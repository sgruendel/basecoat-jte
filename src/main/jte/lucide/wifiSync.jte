<%-- see https://lucide.dev/icons/wifi-sync --%>

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
  class="${JteHelper.classAppend("lucide lucide-wifi-sync-icon lucide-wifi-sync", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M11.965 10.105v4L13.5 12.5a5 5 0 0 1 8 1.5" />
  <path d="M11.965 14.105h4" />
  <path d="M17.965 18.105h4L20.43 19.71a5 5 0 0 1-8-1.5" />
  <path d="M2 8.82a15 15 0 0 1 20 0" />
  <path d="M21.965 22.105v-4" />
  <path d="M5 12.86a10 10 0 0 1 3-2.032" />
  <path d="M8.5 16.429h.01" />
</svg>

<%-- see https://lucide.dev/icons/calendar-sync --%>

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
  class="${JteHelper.classAppend("lucide lucide-calendar-sync-icon lucide-calendar-sync", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M11 10v4h4" />
  <path d="m11 14 1.535-1.605a5 5 0 018 1.5" />
  <path d="M16 2v3" />
  <path d="m21 18-1.535 1.605a5 5 0 01-8-1.5" />
  <path d="M21 22v-4h-4" />
  <path d="M21 8.517V5a2 2 0 00-2-2H5a2 2 0 00-2 2v14a2 2 0 002 2h3.517" />
  <path d="M3 9h4" />
  <path d="M8 2v3" />
</svg>

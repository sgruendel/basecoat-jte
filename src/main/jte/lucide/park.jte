<%-- see https://lucide.dev/icons/park --%>

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
  class="${JteHelper.classAppend("lucide lucide-park-icon lucide-park", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 18h10" />
  <path
    d="M13.248 9.998A4.5 4.5 0 0 0 11.75 8.6V8a1 1 0 0 0-7.5 0 4.9 4.9 0 0 0 2.25 9H8"
  />
  <path d="m15 14-2 6" />
  <path d="m19 14 2 6" />
  <path d="M21 14h-8" />
  <path d="M8 20v-5.922a2 2 0 0 0-.586-1.414L6.5 11.75" />
  <path d="M9.205 12.795 8 14" />
  <circle cx="19" cy="6" r="2" />
</svg>

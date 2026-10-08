<%-- see https://lucide.dev/icons/id-card-lanyard --%>

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
  class="${JteHelper.classAppend("lucide lucide-id-card-lanyard-icon lucide-id-card-lanyard", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M13.5 8h-3" />
  <path d="m15 2-1 2h3a2 2 0 012 2v14a2 2 0 01-2 2H7a2 2 0 01-2-2V6a2 2 0 012-2h3" />
  <path d="M16 22a4 4 0 00-8 0" />
  <path d="m9 2 3 6" />
  <circle cx="12" cy="15" r="3" />
</svg>

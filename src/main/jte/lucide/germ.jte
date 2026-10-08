<%-- see https://lucide.dev/icons/germ --%>

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
  class="${JteHelper.classAppend("lucide lucide-germ-icon lucide-germ", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="m11 2 .925 1.848" />
  <path d="M13 15h.01" />
  <path d="m16 21-1-2.472" />
  <path d="m19 2-1 1.804" />
  <path d="m2 19 2.746-1.373" />
  <path d="m22 16-2.474-2.13" />
  <path d="m22 5-1.804 1" />
  <path d="m3 10 2 2" />
  <path d="M9 16h.01" />
  <path d="M9 20v2" />
  <path
    d="M9.33 7.035c-.51 1.478-1.786 2.93-3.09 3.794A5 5 0 009 20a12.1 12.1 0 0011.902-9.916A6 6 0 009.33 7.035"
  />
  <circle cx="15" cy="9" r="2" />
</svg>

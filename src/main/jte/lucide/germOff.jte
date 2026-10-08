<%-- see https://lucide.dev/icons/germ-off --%>

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
  class="${JteHelper.classAppend("lucide lucide-germ-off-icon lucide-germ-off", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="m11 2 .925 1.848" />
  <path d="M13 15h.01" />
  <path d="M13.424 7.768a2 2 0 112.808 2.808" />
  <path d="m16 21-1-2.472" />
  <path d="M16.988 16.988A12 12 0 019 20a5 5 0 01-2.759-9.171 8.8 8.8 0 002.307-2.28" />
  <path d="m19 2-1 1.804" />
  <path d="m2 19 2.746-1.373" />
  <path d="m2 2 20 20" />
  <path d="m22 16-2.474-2.13a12 12 0 001.376-3.786 6 6 0 00-10.313-5.151" />
  <path d="m22 5-1.804 1" />
  <path d="m3 10 2 2" />
  <path d="M9 16h.01" />
  <path d="M9 20v2" />
</svg>

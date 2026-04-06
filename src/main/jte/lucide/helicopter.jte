<%-- see https://lucide.dev/icons/helicopter --%>

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
  class="${JteHelper.classAppend("lucide lucide-helicopter-icon lucide-helicopter", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M11 17v4" />
  <path d="M14 3v8a2 2 0 0 0 2 2h5.865" />
  <path d="M17 17v4" />
  <path d="M18 17a4 4 0 0 0 4-4 8 6 0 0 0-8-6 6 5 0 0 0-6 5v3a2 2 0 0 0 2 2z" />
  <path d="M2 10v5" />
  <path d="M6 3h16" />
  <path d="M7 21h14" />
  <path d="M8 13H2" />
</svg>

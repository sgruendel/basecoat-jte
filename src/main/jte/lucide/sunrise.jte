<%-- see https://lucide.dev/icons/sunrise --%>

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
  class="${JteHelper.classAppend("lucide lucide-sunrise-icon lucide-sunrise", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 2v8" />
  <path d="m4.93 10.93 1.41 1.41" />
  <path d="M2 18h2" />
  <path d="M20 18h2" />
  <path d="m19.07 10.93-1.41 1.41" />
  <path d="M22 22H2" />
  <path d="m8 6 4-4 4 4" />
  <path d="M16 18a4 4 0 0 0-8 0" />
</svg>

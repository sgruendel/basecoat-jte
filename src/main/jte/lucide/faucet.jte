<%-- see https://lucide.dev/icons/faucet --%>

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
  class="${JteHelper.classAppend("lucide lucide-faucet-icon lucide-faucet", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M10.083 5.428 5.57 4.083a2 2 0 10.001 3.834l4.512-1.345" />
  <path d="M12 8v3" />
  <path d="m13.917 5.428 4.511-1.345a2 2 0 110 3.834l-4.51-1.345" />
  <path d="M18 17v-4.006" />
  <path d="M22 11v8" />
  <path
    d="M22 12h-3a1 1 0 00-1 .994h-2.539a4 4 0 00-6.915-.012L7 13a5 5 0 00-5 5v1a1 1 0 001 1h2a1 1 0 001-1v-1a1 1 0 01.995-1l1.552.018a4 4 0 006.907 0L18 17a1 1 0 001 1h3"
  />
  <circle cx="12" cy="6" r="2" />
</svg>

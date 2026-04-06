<%-- see https://lucide.dev/icons/shredder --%>

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
  class="${JteHelper.classAppend("lucide lucide-shredder-icon lucide-shredder", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path
    d="M4 13V4a2 2 0 0 1 2-2h8a2.4 2.4 0 0 1 1.706.706l3.588 3.588A2.4 2.4 0 0 1 20 8v5"
  />
  <path d="M14 2v5a1 1 0 0 0 1 1h5" />
  <path d="M10 22v-5" />
  <path d="M14 19v-2" />
  <path d="M18 20v-3" />
  <path d="M2 13h20" />
  <path d="M6 20v-3" />
</svg>

<%-- see https://lucide.dev/icons/forklift --%>

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
  class="${JteHelper.classAppend("lucide lucide-forklift-icon lucide-forklift", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 12H5a2 2 0 0 0-2 2v5" />
  <path d="M15 19h7" />
  <path d="M16 19V2" />
  <path
    d="M6 12V7a2 2 0 0 1 2-2h2.172a2 2 0 0 1 1.414.586l3.828 3.828A2 2 0 0 1 16 10.828"
  />
  <path d="M7 19h4" />
  <circle cx="13" cy="19" r="2" />
  <circle cx="5" cy="19" r="2" />
</svg>

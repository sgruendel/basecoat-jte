<%-- see https://lucide.dev/icons/lighthouse --%>

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
  class="${JteHelper.classAppend("lucide lucide-lighthouse-icon lucide-lighthouse", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 3V2" />
  <path d="M16.066 16.865 7 22l2-11V6a3 3 0 016 0v5l2 11" />
  <path d="m19.792 4.5.866-.5" />
  <path d="m19.797 13.5.866.5" />
  <path d="M21 9h1" />
  <path d="M3 9H2" />
  <path d="m4.203 13.5-.866.5" />
  <path d="M4.208 4.5 3.342 4" />
  <path d="M5.5 22h13" />
  <path d="m7.932 16.875 7.377-4.178" />
  <path d="M8 11h8" />
  <path d="M8 7h8" />
</svg>

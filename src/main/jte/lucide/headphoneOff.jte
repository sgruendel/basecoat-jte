<%-- see https://lucide.dev/icons/headphone-off --%>

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
  class="${JteHelper.classAppend("lucide lucide-headphone-off-icon lucide-headphone-off", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M21 14h-1.343" />
  <path d="M9.128 3.47A9 9 0 0 1 21 12v3.343" />
  <path d="m2 2 20 20" />
  <path d="M20.414 20.414A2 2 0 0 1 19 21h-1a2 2 0 0 1-2-2v-3" />
  <path
    d="M3 14h3a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-7a9 9 0 0 1 2.636-6.364"
  />
</svg>

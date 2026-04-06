<%-- see https://lucide.dev/icons/wallpaper --%>

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
  class="${JteHelper.classAppend("lucide lucide-wallpaper-icon lucide-wallpaper", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 17v4" />
  <path d="M8 21h8" />
  <path d="m9 17 6.1-6.1a2 2 0 0 1 2.81.01L22 15" />
  <circle cx="8" cy="9" r="2" />
  <rect x="2" y="3" width="20" height="14" rx="2" />
</svg>

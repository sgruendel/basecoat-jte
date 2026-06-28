<%-- see https://lucide.dev/icons/blender --%>

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
  class="${JteHelper.classAppend("lucide lucide-blender-icon lucide-blender", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path
    d="M8 14a2 2 0 0 0-1.963 1.615l-1.018 5.193A1 1 0 0 0 6 22h12a1 1 0 0 0 .981-1.192l-1.018-5.193A2 2 0 0 0 16 14z"
  />
  <path d="m17 2-1 12" />
  <path d="M8.006 14 7 2" />
  <path d="M7.565 8.787A5 5 0 0 0 12 8a5 5 0 0 1 4.56-.75" />
  <path d="M19 2H5a2 2 0 0 0-2 2v5a2 2 0 0 0 .688 1.5" />
  <path d="M12 18h.01" />
</svg>

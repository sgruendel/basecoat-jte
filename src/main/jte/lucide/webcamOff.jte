<%-- see https://lucide.dev/icons/webcam-off --%>

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
  class="${JteHelper.classAppend("lucide lucide-webcam-off-icon lucide-webcam-off", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 22v-4" />
  <path d="M12.754 7.096a3 3 0 0 1 2.15 2.15" />
  <path d="M12.863 12.873a3 3 0 0 1-3.736-3.735" />
  <path d="M16.566 16.57A8 8 0 0 1 5.43 5.433" />
  <path d="m2 2 20 20" />
  <path d="M7 22h10" />
  <path d="M8.478 2.817a8 8 0 0 1 10.705 10.705" />
</svg>

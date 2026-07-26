<%-- see https://lucide.dev/icons/mic-audio-lines --%>

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
  class="${JteHelper.classAppend("lucide lucide-mic-audio-lines-icon lucide-mic-audio-lines", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M10 3v2.341" />
  <path d="M12 17v4" />
  <path d="M14 5v.341" />
  <path d="M18 5v13" />
  <path d="M2 10v3" />
  <path d="M22 10v3" />
  <path d="M6 6v11" />
  <path d="M9 21h6" />
  <rect width="4" height="8" x="10" y="9" rx="2" />
</svg>

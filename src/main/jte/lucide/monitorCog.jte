<%-- see https://lucide.dev/icons/monitor-cog --%>

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
  class="${JteHelper.classAppend("lucide lucide-monitor-cog-icon lucide-monitor-cog", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 17v4" />
  <path d="m14.305 7.53.923-.382" />
  <path d="m15.228 4.852-.923-.383" />
  <path d="m16.852 3.228-.383-.924" />
  <path d="m16.852 8.772-.383.923" />
  <path d="m19.148 3.228.383-.924" />
  <path d="m19.53 9.696-.382-.924" />
  <path d="m20.772 4.852.924-.383" />
  <path d="m20.772 7.148.924.383" />
  <path d="M22 13v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h7" />
  <path d="M8 21h8" />
  <circle cx="18" cy="6" r="3" />
</svg>

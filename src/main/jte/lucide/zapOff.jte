<%-- see https://lucide.dev/icons/zap-off --%>

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
  class="${JteHelper.classAppend("lucide lucide-zap-off-icon lucide-zap-off", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M10.768 5.111 13.44 2.44a1.5 1.5 0 012.474 1.561l-1.633 4.625" />
  <path d="m18.889 13.232.672-.672A1.5 1.5 0 0018.5 10h-2.844" />
  <path d="m2 2 20 20" />
  <path
    d="m7.94 7.94-3.5 3.499A1.5 1.5 0 005.5 14h4.002a.5.5 0 01.471.666L8.086 20a1.5 1.5 0 002.475 1.56l5.5-5.5"
  />
</svg>

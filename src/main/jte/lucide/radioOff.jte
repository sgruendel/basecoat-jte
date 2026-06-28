<%-- see https://lucide.dev/icons/radio-off --%>

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
  class="${JteHelper.classAppend("lucide lucide-radio-off-icon lucide-radio-off", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M13.414 13.414a2 2 0 1 1-2.828-2.828" />
  <path d="M16.247 7.761a6 6 0 0 1 1.744 4.572" />
  <path d="M19.075 4.933a10 10 0 0 1 2.234 10.72" />
  <path d="m2 2 20 20" />
  <path d="M4.925 19.067a10 10 0 0 1 0-14.134" />
  <path d="M7.753 16.239a6 6 0 0 1 0-8.478" />
</svg>

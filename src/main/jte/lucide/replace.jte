<%-- see https://lucide.dev/icons/replace --%>

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
  class="${JteHelper.classAppend("lucide lucide-replace-icon lucide-replace", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M14 4a1 1 0 0 1 1-1" />
  <path d="M15 10a1 1 0 0 1-1-1" />
  <path d="M21 4a1 1 0 0 0-1-1" />
  <path d="M21 9a1 1 0 0 1-1 1" />
  <path d="m3 7 3 3 3-3" />
  <path d="M6 10V5a2 2 0 0 1 2-2h2" />
  <rect x="3" y="14" width="7" height="7" rx="1" />
</svg>

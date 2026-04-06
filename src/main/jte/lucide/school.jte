<%-- see https://lucide.dev/icons/school --%>

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
  class="${JteHelper.classAppend("lucide lucide-school-icon lucide-school", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M14 21v-3a2 2 0 0 0-4 0v3" />
  <path d="M18 4.933V21" />
  <path d="m4 6 7.106-3.79a2 2 0 0 1 1.788 0L20 6" />
  <path
    d="m6 11-3.52 2.147a1 1 0 0 0-.48.854V19a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-5a1 1 0 0 0-.48-.853L18 11"
  />
  <path d="M6 4.933V21" />
  <circle cx="12" cy="9" r="2" />
</svg>

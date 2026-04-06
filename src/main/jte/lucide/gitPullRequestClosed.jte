<%-- see https://lucide.dev/icons/git-pull-request-closed --%>

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
  class="${JteHelper.classAppend("lucide lucide-git-pull-request-closed-icon lucide-git-pull-request-closed", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <circle cx="6" cy="6" r="3" />
  <path d="M6 9v12" />
  <path d="m21 3-6 6" />
  <path d="m21 9-6-6" />
  <path d="M18 11.5V15" />
  <circle cx="18" cy="18" r="3" />
</svg>

<%-- see https://lucide.dev/icons/git-merge-conflict --%>

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
  class="${JteHelper.classAppend("lucide lucide-git-merge-conflict-icon lucide-git-merge-conflict", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M12 6h4a2 2 0 0 1 2 2v7" />
  <path d="M6 12v9" />
  <path d="M9 3 3 9" />
  <path d="M9 9 3 3" />
  <circle cx="18" cy="18" r="3" />
</svg>

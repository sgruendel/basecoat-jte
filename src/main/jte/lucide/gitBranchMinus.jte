<%-- see https://lucide.dev/icons/git-branch-minus --%>

@param String classAppend = null
@param int size = 24
@param String color = "currentColor"
@param int strokeWidth = 2
@param boolean absoluteStrokeWidth = false

<%-- see https://github.com/lucide-icons/lucide/blob/main/packages/vue/src/Icon.ts#L50 --%>
!{ final var calculatedStrokeWidth = absoluteStrokeWidth ? Double.toString(strokeWidth * 24.0 / size) : Integer.toString(strokeWidth); }

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
  class="lucide lucide-git-branch-minus-icon lucide-git-branch-minus ${classAppend}"
>
  <path d="M15 6a9 9 0 0 0-9 9V3" />
  <path d="M21 18h-6" />
  <circle cx="18" cy="6" r="3" />
  <circle cx="6" cy="18" r="3" />
</svg>

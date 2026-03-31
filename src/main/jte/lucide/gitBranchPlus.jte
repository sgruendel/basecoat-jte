<%-- see https://lucide.dev/icons/git-branch-plus --%>

@param String classAppend = null
@param int size = 24
@param String color = "currentColor"
@param int strokeWidth = 2
@param boolean absoluteStrokeWidth = false
@param String role = null
@param String ariaLabel = null
@param Boolean ariaHidden = null
@param Boolean focusable = null

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
  class="lucide lucide-git-branch-plus-icon lucide-git-branch-plus ${classAppend}"
  role="${role}"
  aria-label="${ariaLabel}"
  aria-hidden="${ariaHidden}"
  focusable="${focusable}"
>
    <path d="M6 3v12" />
  <path d="M18 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
  <path d="M6 21a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
  <path d="M15 6a9 9 0 0 0-9 9" />
  <path d="M18 15v6" />
  <path d="M21 18h-6" />
</svg>

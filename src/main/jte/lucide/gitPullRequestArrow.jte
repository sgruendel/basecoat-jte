<%-- see https://lucide.dev/icons/git-pull-request-arrow --%>

@param String classAppend = null
@param int size = 24
@param String color = "currentColor"
@param int strokeWidth = 2
@param boolean absoluteStrokeWidth = false

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
  class="lucide lucide-git-pull-request-arrow-icon lucide-git-pull-request-arrow ${classAppend}"
>
    <circle cx="5" cy="6" r="3" />
  <path d="M5 9v12" />
  <circle cx="19" cy="18" r="3" />
  <path d="m15 9-3-3 3-3" />
  <path d="M12 6h5a2 2 0 0 1 2 2v7" />
</svg>

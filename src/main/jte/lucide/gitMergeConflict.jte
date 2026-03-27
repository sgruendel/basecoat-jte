<%-- see https://lucide.dev/icons/git-merge-conflict --%>

@import static LucideUtils.calculatedStrokeWidth

@param String classAppend = null
@param int size = 24
@param String color = "currentColor"
@param int strokeWidth = 2
@param boolean absoluteStrokeWidth = false

<svg
  xmlns="http://www.w3.org/2000/svg"
  width="${size}"
  height="${size}"
  viewBox="0 0 24 24"
  fill="none"
  stroke="${color}"
  stroke-width="${calculatedStrokeWidth(size, strokeWidth, absoluteStrokeWidth)}"
  stroke-linecap="round"
  stroke-linejoin="round"
  class="lucide lucide-git-merge-conflict-icon lucide-git-merge-conflict ${classAppend}"
>
  <path d="M12 6h4a2 2 0 0 1 2 2v7" />
  <path d="M6 12v9" />
  <path d="M9 3 3 9" />
  <path d="M9 9 3 3" />
  <circle cx="18" cy="18" r="3" />
</svg>

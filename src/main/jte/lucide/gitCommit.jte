<%-- see https://lucide.dev/icons/git-commit-horizontal --%>

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
  class="lucide lucide-git-commit-horizontal-icon lucide-git-commit-horizontal ${classAppend}"
>
  <circle cx="12" cy="12" r="3" />
  <line x1="3" x2="9" y1="12" y2="12" />
  <line x1="15" x2="21" y1="12" y2="12" />
</svg>

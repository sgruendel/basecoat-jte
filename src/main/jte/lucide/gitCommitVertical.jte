<%-- see https://lucide.dev/icons/git-commit-vertical --%>

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
  class="lucide lucide-git-commit-vertical-icon lucide-git-commit-vertical ${classAppend}"
>
  <path d="M12 3v6" />
  <circle cx="12" cy="12" r="3" />
  <path d="M12 15v6" />
</svg>

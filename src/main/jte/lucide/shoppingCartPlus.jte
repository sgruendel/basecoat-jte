<%-- see https://lucide.dev/icons/shopping-cart-plus --%>

@import java.util.Map
@import com.basecoatui.jte.util.JteHelper

@param int size = 24
@param String fill = "none"
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
  fill="${fill}"
  stroke="${color}"
  stroke-width="${calculatedStrokeWidth}"
  stroke-linecap="round"
  stroke-linejoin="round"
  class="${JteHelper.classAppend("lucide lucide-shopping-cart-plus-icon lucide-shopping-cart-plus", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M16 5h6" />
  <path d="M19 2v6" />
  <path d="m2.05 2.05 1.099-.028a1 1 0 011.008.815l2.69 14.347A1 1 0 007.83 18H18" />
  <path d="M4.564 5H12" />
  <path d="M6.25 14h12.712a2 2 0 001.991-1.57l.172-1.041" />
  <circle cx="18" cy="20" r="2" />
  <circle cx="8" cy="20" r="2" />
</svg>

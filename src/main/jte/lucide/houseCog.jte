<%-- see https://lucide.dev/icons/house-cog --%>

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
  class="${JteHelper.classAppend("lucide lucide-house-cog-icon lucide-house-cog", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path
    d="M10.584 21H5a2 2 0 01-2-2v-9a2 2 0 01.709-1.527l7-6a2 2 0 012.582 0l7 6A2 2 0 0121 10.001v.583"
  />
  <path d="M14 12H10a1 1 0 00-1 1v8" />
  <path d="m14.305 19.53.923-.382" />
  <path d="m15.229 16.852-.924-.383" />
  <path d="m16.852 15.228-.383-.923" />
  <path d="m16.852 20.773-.383.924" />
  <path d="m19.148 15.228.383-.923" />
  <path d="m19.53 21.697-.382-.924" />
  <path d="m20.773 16.852.922-.383" />
  <path d="m20.773 19.148.922.383" />
  <circle cx="18" cy="18" r="3" />
</svg>

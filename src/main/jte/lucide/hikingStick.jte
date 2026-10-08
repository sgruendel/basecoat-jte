<%-- see https://lucide.dev/icons/hiking-stick --%>

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
  class="${JteHelper.classAppend("lucide lucide-hiking-stick-icon lucide-hiking-stick", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <path d="M13.5 10.5 2 22" />
  <path
    d="M16.352 11.648a1.205 1.205 0 01-1.704 0l-2.296-2.296a1.205 1.205 0 010-1.704l.72-.72a2 2 0 011.022-.546l.599-.12a2 2 0 001.569-1.57l.12-.598a2 2 0 01.546-1.022l.72-.72a1.205 1.205 0 011.704 0l2.296 2.296a1.205 1.205 0 010 1.704l-6.02 6.02a1 1 0 103 3l.201-.201A7.4 7.4 0 0021 9.93V7"
  />
  <path d="m6 21-3-3" />
</svg>

<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/command.njk --%>
@import com.basecoatui.jte.util.JteHelper

@import java.util.Map

@import static io.github.sgruendel.lucide.jte.LucideIcons.*

@param String id
@param String placeholder
@param Map<?, ?> inputAttrs = null

<header>
  ${lucideSearch()}
  <input
    type="text"
    id="${id}-input"
    placeholder="${placeholder}"
    autocomplete="off"
    spellcheck="false"
    aria-autocomplete="list"
    role="combobox"
    aria-expanded="true"
    aria-controls="${id}-menu"
    $unsafe{JteHelper.attrs(inputAttrs)}
  />
</header>

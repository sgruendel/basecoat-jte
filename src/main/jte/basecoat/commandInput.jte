<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/command.njk --%>

@import java.util.Map
@import com.basecoatui.jte.util.JteHelper

@param String id
@param String placeholder
@param Map<?, ?> inputAttrs = null

<header>
  @template.lucide.search()
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

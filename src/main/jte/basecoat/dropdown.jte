<%-- see https://basecoatui.com/components/dropdown-menu/ --%>

@import gg.jte.Content

@param String id
@param String btnText
@param String btnClassAppend = null
@param Content content

<div id="${id}" class="dropdown-menu">
  <button
    type="button"
    id="${id}-trigger"
    aria-haspopup="menu"
    aria-controls="${id}-menu"
    aria-expanded="false"
    class="btn-outline ${btnClassAppend}"
  >
    ${btnText}
  </button>
  <div id="${id}-popover" data-popover aria-hidden="true" class="min-w-56">
    <div role="menu" id="${id}-menu" aria-labelledby="${id}-trigger">
      ${content}
    </div>
  </div>
</div>

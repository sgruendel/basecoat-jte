<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/dropdown-menu.njk --%>

<%--
  Renders a dropdown menu component.

  @param id {string} [optional] - Unique identifier for the dropdown component.
  @param trigger {string} [optional] - HTML content for the button that triggers the dropdown.
  @param triggerClass {String} [optional] - Additional classes for the trigger button.
--%>

@import gg.jte.Content

@param String id
@param String triggerText = null
@param Content triggerContent = null
@param String triggerClass = null
@param Content content

<div id="${id}" class="dropdown-menu">
  <button
    type="button"
    id="${id}-trigger"
    aria-haspopup="menu"
    aria-controls="${id}-menu"
    aria-expanded="false"
    class="${triggerClass}"
  >
    ${triggerText}
    ${triggerContent}
  </button>
  <div id="${id}-popover" data-popover aria-hidden="true" class="min-w-56">
    <div role="menu" id="${id}-menu" aria-labelledby="${id}-trigger">
      ${content}
    </div>
  </div>
</div>

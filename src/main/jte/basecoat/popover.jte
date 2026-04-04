<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/popover.njk --%>

<%--
  Renders a generic popover component, often used internally by other components like dropdowns or selects.

  @param id {string} [optional] - Unique identifier for the popover component.
  @param trigger {string} [optional] - HTML content for the element that triggers the popover.
  @param main_attrs {object} [optional] - Additional HTML attributes for the main container div.
  @param trigger_attrs {object} [optional] - Additional HTML attributes for the trigger element.
  @param popover_attrs {object} [optional] - Additional HTML attributes for the popover content div.
--%>

@import gg.jte.Content

@param String id
@param String triggerText = null
@param Content triggerContent = null
@param String triggerClass = null
@param String popoverClass = null
@param Content content

<div id="${id}" class="popover ${triggerClass}">
  <button
    type="button"
    class="btn-outline"
    id="${id}-trigger"
    aria-expanded="false"
    aria-controls="${id}-popover"
  >
    ${triggerText}
    ${triggerContent}
  </button>
  <div
    id="${id}-popover"
    data-popover
    aria-hidden="true"
    class="${popoverClass}"
  >
    ${content}
  </div>
</div>

<%-- see https://github.com/hunvreus/basecoat/blob/1.3.0/src/templates/nunjucks/popover.njk --%>
<%--
  Renders a generic popover component, often used internally by other components like dropdowns or selects.

  @param id {string} [optional] - Unique identifier for the popover component.
  @param trigger {string} [optional] - HTML content for the element that triggers the popover.
  @param main_attrs {object} [optional] - Additional HTML attributes for the main container div.
  @param trigger_attrs {object} [optional] - Additional HTML attributes for the trigger element.
  @param popover_attrs {object} [optional] - Additional HTML attributes for the popover content div.
--%>

@import gg.jte.Content
@import io.github.sgruendel.basecoat.jte.JteHelper

@import java.util.Map

@param String id
@param String triggerText = null
@param Content triggerContent = null
@param Map<?, ?> mainAttrs = null
@param Map<?, ?> triggerAttrs = null
@param Map<?, ?> popoverAttrs = null
@param Content content

!{
    if (triggerText != null && triggerContent != null) {
        throw new IllegalArgumentException("triggerText and triggerContent are exclusive");
    }
}

<div id="${id}" class="${JteHelper.classAppend("popover", mainAttrs)}" $unsafe{JteHelper.attrs(mainAttrs, "class")}>
    <button
        type="button"
        id="${id}-trigger"
        aria-expanded="false"
        aria-controls="${id}-popover"
        $unsafe{JteHelper.attrs(triggerAttrs)}
    >
        @if(triggerContent != null)
            ${triggerContent}
        @else
            ${triggerText}
        @endif
    </button>
    <div id="${id}-popover" data-popover aria-hidden="true" $unsafe{JteHelper.attrs(popoverAttrs)}>${content}</div>
</div>

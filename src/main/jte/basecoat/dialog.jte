<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/dialog.njk --%>

<%--
  Renders a dialog component with optional trigger, header, body, and footer.

  @param id {string} - Unique identifier for the dialog component.
  @param trigger {string} [optional] - Text or HTML for the button that triggers the dialog.
  @param title {string} [optional] - Title text displayed in the dialog header.
  @param description {string} [optional] - Description text displayed below the title.
  @param footer {string} [optional] - HTML content for the dialog footer.
  @param main_attrs {object} [optional] - Additional HTML attributes for the main container div.
  @param trigger_attrs {object} [optional] - Additional HTML attributes for the trigger button.
  @param dialog_attrs {object} [optional] - Additional HTML attributes for the dialog content container.
  @param header_attrs {object} [optional] - Additional HTML attributes for the dialog header.
  @param body_attrs {object} [optional] - Additional HTML attributes for the dialog body section.
  @param footer_attrs {object} [optional] - Additional HTML attributes for the dialog footer.
  @param open {boolean} [optional] [default=false] - Whether the dialog should be open initially.
  @param close_button {boolean} [optional] [default=true] - Whether to include a close button.
  @param close_on_overlay_click {boolean} [optional] [default=true] - Whether clicking the overlay closes the dialog.
--%>

@import gg.jte.Content

@param String id
@param String trigger = null
@param String title = null
@param String description = null
@param Content footer = null
@param String mainAttrs = null
@param String triggerClass = null
@param String dialogClass = null
@param String headerAttrs = null
@param String bodyClass = null
@param String bodyAttrs = null
@param String footerAttrs = null
@param boolean open = false
@param boolean closeButton = true
@param boolean closeOnOverlayClick = true
@param Content content = null

@if(trigger != null)
  <button
    class="${triggerClass}"
    type="button"
    onclick="document.getElementById('${id}').showModal()"
  >
    ${trigger}
  </button>
@endif
<dialog
  id="${id}"
  class="dialog ${dialogClass}"
  aria-labelledby="${id}-title"
  aria-describedby="${description != null ? (id + "-description") : null}"
  onclick="${closeOnOverlayClick ? "if (event.target === this) this.close()" : null}"
>
  <div>
    @if(title != null || description != null)
      <header>
        <h2 id="${id}-title">${title}</h2>
        @if(description != null)
          <p id="${id}-description">${description}</p>
        @endif
      </header>
    @endif
    @if(content != null)
      <section class="${bodyClass}">${content}</section>
    @endif
    @if(footer != null)
      <footer>${footer}</footer>
    @endif
    @if(closeButton)
      <button
        type="button"
        aria-label="Close dialog"
        onclick="this.closest('dialog').close()"
      >
        @template.lucide.x()
      </button>
    @endif
  </div>
</dialog>

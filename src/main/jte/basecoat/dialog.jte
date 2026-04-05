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

@import java.util.Map
@import gg.jte.Content
@import com.basecoatui.jte.util.JteHelper

@param String id
@param String trigger = null
@param String title = null
@param String description = null
@param Map<?, ?> dialogAttrs = null
@param Map<?, ?> triggerAttrs = null
@param Map<?, ?> headerAttrs = null
@param Map<?, ?> bodyAttrs = null
@param Map<?, ?> footerAttrs = null
@param boolean open = false
@param boolean closeButton = true
@param boolean closeOnOverlayClick = true
@param Content content = null
@param Content footer = null

@if(trigger != null)
  <button
    type="button"
    onclick= "document.getElementById('${id}').showModal()"
    $unsafe{JteHelper.attrs(triggerAttrs)}
  >
    ${trigger}
  </button>
@endif
<dialog
  id="${id}"
  class="${JteHelper.classAppend("dialog", dialogAttrs)}"
  aria-labelledby="${id}-title"
  aria-describedby="${description != null ? (id + "-description") : null}"
  onclick="${closeOnOverlayClick ? "if (event.target === this) this.close()" : null}"
  $unsafe{JteHelper.attrs(dialogAttrs, "class")}
>
  <div>
    @if(title != null || description != null)
      <header $unsafe{JteHelper.attrs(headerAttrs)}>
        <h2 id="${id}-title">${title}</h2>
        @if(description != null)
          <p id="${id}-description">${description}</p>
        @endif
      </header>
    @endif
    @if(content != null)
      <section $unsafe{JteHelper.attrs(bodyAttrs)}>${content}</section>
    @endif
    @if(footer != null)
      <footer $unsafe{JteHelper.attrs(footerAttrs)}>${footer}</footer>
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

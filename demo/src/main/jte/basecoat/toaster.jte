<%-- see https://github.com/hunvreus/basecoat/blob/1.2.1/src/templates/nunjucks/toast.njk --%>
<%--
  Renders a toaster container and individual toast messages.
  Can render the initial container or be used with htmx OOB swaps to add toasts dynamically.

  @param id {string} [optional] [default="toaster"] - Unique identifier for the toaster list.
  @param toasts {array} [optional] - An array of toast objects to render initially. See the <code>toast()</code> macro for more details.
  @param attrs {object} [optional] - Additional HTML attributes for the main toaster list.

  Supports caller() for custom toast markup.
--%>

@import gg.jte.Content
@import io.github.sgruendel.basecoat.jte.BasecoatToast
@import io.github.sgruendel.basecoat.jte.JteHelper

@import java.util.List
@import java.util.Map

@param String id = "toaster"
@param List<BasecoatToast> toasts = null
@param Map<?, ?> attrs = null
@param Content content = null

!{
    final var customAriaLabel = attrs != null && attrs.get("aria-label") != null ? attrs.get("aria-label").toString() : "";
    final var ariaLabel = customAriaLabel.isEmpty() ? "Notifications" : customAriaLabel;
}

<ol
    id="${id}"
    class="${JteHelper.classAppend("toaster", attrs)}"
    role="list"
    aria-label="${ariaLabel}"
    $unsafe{JteHelper.attrs(attrs, List.of("class", "role", "aria-label"))}
>
    @if(toasts != null)
        @for(var toast : toasts)
            @template.basecoat.toast(
                category = toast.category(),
                title = toast.title(),
                description = toast.description(),
                duration = toast.duration(),
                icon = toast.icon(),
                action = toast.action(),
                cancel = toast.cancel(),
                attrs = toast.attrs(),
                closeButton = toast.closeButton()
            )
        @endfor
    @endif
    ${content}
</ol>

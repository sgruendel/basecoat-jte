<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/toast.njk --%>

<%--
  Renders a toaster container and individual toast messages.
  Can render the initial container or be used with htmx OOB swaps to add toasts dynamically.

  @param id {string} [optional] [default="toaster"] - Unique identifier for the toaster container.
  @param toasts {array} [optional] - An array of toast objects to render initially. See the <code>toast()</code> macro for more details.
  @param attrs {object} [optional] - Additional HTML attributes for the main toaster container div.

  Supports caller() for custom toast markup.
--%>

@import java.util.List
@import java.util.Map
@import gg.jte.Content
@import com.basecoatui.jte.util.BasecoatToast
@import com.basecoatui.jte.util.JteHelper

@param List<BasecoatToast> toasts= null
@param Map<?, ?> attrs = null
@param Content content = null

<div
  id="toaster"
  class="${JteHelper.classAppend("toaster", attrs)}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  @if(toasts != null)
    @for(var toast : toasts)
      @template.basecoat.toast()
    @endfor
  @endif
  ${content}
</div>

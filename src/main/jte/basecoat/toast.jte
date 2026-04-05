<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/toast.njk --%>

<%--
  Renders a single toast message.

  @param category {string} [optional] [default="success"] - Type of toast ('success', 'error', 'info', 'warning'). Determines icon and ARIA role.
  @param title {string} [optional] - The main title text of the toast.
  @param description {string} [optional] - The secondary description text.
  @param action {object} [optional] - Defines an action button.
    - label {string}: Button text.
    - onclick {string}: JavaScript code to execute on click.
    - url {string}: URL for an anchor link button.
  @param cancel {object} [optional] - Defines a cancel/dismiss button (similar structure to action).
    - label {string}: Button text.
    - onclick {string}: JavaScript code to execute on click.
    - url {string}: URL for an anchor link button.
  @param attrs {object} [optional] - Additional HTML attributes for the toast div.
--%>

@import java.util.Map
@import com.basecoatui.jte.util.BasecoatToast.Category
@import com.basecoatui.jte.util.BasecoatToast.Button
@import com.basecoatui.jte.util.JteHelper

@param Category category = com.basecoatui.jte.util.BasecoatToast.Category.SUCCESS
@param String title = null
@param String description = null
@param Button action = null
@param Button cancel = null
@param Map<?, ?> attrs = null

<div
  class="${JteHelper.classAppend("toast", attrs)}"
  role="${category == Category.ERROR ? "alert" : "status"}"
  aria-atomic="true"
  aria-hidden="false"
  data-category="${category.name().toLowerCase()}"
  $unsafe{JteHelper.attrs(attrs, "class")}
>
  <div class="toast-content">
    @if(category == Category.SUCCESS)
      @template.lucide.circleCheck(ariaHidden = true)
    @elseif(category == Category.INFO)
      @template.lucide.info(ariaHidden = true)
    @elseif(category == Category.WARNING)
      @template.lucide.triangleAlert(ariaHidden = true)
    @elseif(category == Category.ERROR)
      @template.lucide.circleX(ariaHidden = true)
    @endif

    <section>
      @if(title != null)
        <h2>${title}</h2>
      @endif
      @if(description != null)
        <p>${description}</p>
      @endif
    </section>

    @if(action != null || cancel != null)
      <footer>
        @if(action != null)
          @if(action.href() != null)
            <a href="${action.href()}" class="btn-sm" data-toast-action
              >${action.label()}</a
            >
          @else
            <button
              type="button"
              class="btn"
              data-toast-action
              onclick="${action.onclick()}"
            >
              ${action.label()}
            </button>
          @endif
        @endif


        @if(cancel != null)
          @if(cancel.href() != null)
            <a href="${cancel.href()}" class="btn-sm" data-toast-cancel
              >${cancel.label()}</a
            >
          @else
            <button
              type="button"
              class="btn-sm-outline"
              data-toast-cancel
              onclick="${cancel.onclick()}"
            >
              ${cancel.label()}
            </button>
          @endif
        @endif
      </footer>
    @endif
  </div>
</div>

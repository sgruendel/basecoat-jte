<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/toast.njk --%>

@import com.basecoatui.jte.util.BasecoatToast.Category
@import com.basecoatui.jte.util.BasecoatToast.Button

@param Category category = com.basecoatui.jte.util.BasecoatToast.Category.SUCCESS
@param String classAppend = null
@param String title = null
@param String description = null
@param Button action = null
@param Button cancel = null

<div
  class="toast ${classAppend}"
  role="${category == Category.ERROR ? "alert" : "status"}"
  aria-atomic="true"
  aria-hidden="false"
  data-category="${category.name().toLowerCase()}"
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

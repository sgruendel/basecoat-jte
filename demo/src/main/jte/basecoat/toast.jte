<%-- see https://github.com/hunvreus/basecoat/blob/1.2.1/src/templates/nunjucks/toast.njk --%>
<%--
  Renders a single toast message.

  @param category {string} [optional] [default="success"] - Type of toast ('success', 'error', 'info', 'warning', 'loading'). Determines icon and ARIA role.
    Pass null for a toast without category and icon.
  @param title {string} [optional] - The main title text of the toast.
  @param description {string} [optional] - The secondary description text.
  @param duration {number} [optional] - Timeout in milliseconds. Use -1 to keep the toast open.
  @param icon {string} [optional] - Custom icon HTML. Defaults to the category icon.
  @param action {object} [optional] - Defines an action button.
    - label {string}: Button text.
    - onclick {string}: JavaScript code to execute on click.
    - href {string}: URL for an anchor link button.
  @param cancel {object} [optional] - Defines a cancel/dismiss button (similar structure to action).
    - label {string}: Button text.
    - onclick {string}: JavaScript code to execute on click.
    - href {string}: URL for an anchor link button.
  @param attrs {object} [optional] - Additional HTML attributes for the toast list item.
  @param closeButton {boolean} [optional] [default=true] - Render the close icon button.
--%>

@import gg.jte.Content
@import io.github.sgruendel.basecoat.jte.BasecoatToast.Button
@import io.github.sgruendel.basecoat.jte.BasecoatToast.Category
@import io.github.sgruendel.basecoat.jte.JteHelper

@import java.time.Duration
@import java.util.Locale
@import java.util.Map

@import static io.github.sgruendel.lucide.jte.LucideIcons.*

@param Category category = io.github.sgruendel.basecoat.jte.BasecoatToast.Category.SUCCESS
@param String title = null
@param String description = null
@param Duration duration = null
@param Content icon = null
@param Button action = null
@param Button cancel = null
@param Map<?, ?> attrs = null
@param boolean closeButton = true

<li
    class="${JteHelper.classAppend("toast", attrs)}"
    data-category="${category != null ? category.name().toLowerCase(Locale.ROOT) : null}"
    data-duration="${duration != null ? duration.toMillis() : null}"
    $unsafe{JteHelper.attrs(attrs, "class")}
>
    <div class="toast-content" role="${category == Category.ERROR ? "alert" : "status"}" aria-atomic="true">
        @if(icon != null)
            ${icon}
        @elseif(category == Category.SUCCESS)
            ${lucideCircleCheck()}
        @elseif(category == Category.ERROR)
            ${lucideOctagonX()}
        @elseif(category == Category.INFO)
            ${lucideInfo()}
        @elseif(category == Category.LOADING)
            ${lucideLoaderCircle()}
        @elseif(category == Category.WARNING)
            ${lucideTriangleExclamationPoint()}
        @endif

        <section>
            @if(title != null && !title.isEmpty())
                <h2>${title}</h2>
            @endif
            @if(description != null && !description.isEmpty())
                <p>${description}</p>
            @endif
        </section>

        @if(action != null || cancel != null || closeButton)
            <footer>
                @if(action != null)
                    @if(action.href() != null)
                        <a href="${action.href()}" class="btn" data-variant="outline" data-size="sm" data-toast-action>
                            ${action.label()}
                        </a>
                    @else
                        <button
                            type="button"
                            class="btn"
                            data-variant="outline"
                            data-size="sm"
                            data-toast-action
                            onclick="${action.onclick()}"
                        >
                            ${action.label()}
                        </button>
                    @endif
                @endif


                @if(cancel != null)
                    @if(cancel.href() != null)
                        <a href="${cancel.href()}" class="btn" data-variant="outline" data-size="sm" data-toast-cancel>
                            ${cancel.label()}
                        </a>
                    @else
                        <button
                            type="button"
                            class="btn"
                            data-variant="outline"
                            data-size="sm"
                            data-toast-cancel
                            onclick="${cancel.onclick()}"
                        >
                            ${cancel.label()}
                        </button>
                    @endif
                @endif


                @if(closeButton)
                    <button type="button" class="btn" data-variant="ghost" data-size="icon-sm" aria-label="Close toast">
                        ${lucideX()}
                    </button>
                @endif
            </footer>
        @endif
    </div>
</li>

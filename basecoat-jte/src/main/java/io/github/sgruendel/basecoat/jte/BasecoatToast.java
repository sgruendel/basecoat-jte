package io.github.sgruendel.basecoat.jte;

import gg.jte.Content;
import java.time.Duration;
import java.util.Map;

/**
 * A toast rendered initially by the toaster template, with the same fields as the toast template parameters and the
 * toast objects of Basecoat's Nunjucks {@code toaster()} macro. Optional fields are set with {@code with*} methods,
 * each returning a new toast.
 *
 * @param category the category, which determines the icon and ARIA role; {@code null} for a toast without category and
 *     icon
 * @param title the title text; no title if {@code null} or empty
 * @param description the description text; no description if {@code null} or empty
 * @param action the action button
 * @param cancel the cancel button
 * @param duration how long the toast is shown; Basecoat's default if {@code null}, see {@link #withDuration(Duration)}
 * @param icon an icon replacing the category icon
 * @param attrs additional HTML attributes for the toast list item
 * @param closeButton whether to render the close icon button
 */
public record BasecoatToast(
        Category category,
        String title,
        String description,
        Button action,
        Button cancel,
        Duration duration,
        Content icon,
        Map<?, ?> attrs,
        boolean closeButton) {

    /** Duration that keeps a toast open until it is dismissed, rendered as {@code data-duration="-1"}. */
    public static final Duration PERSISTENT = Duration.ofMillis(-1);

    /** Creates a toast with the given category and title and a close button. */
    public static BasecoatToast of(final Category category, final String title) {

        return of(category, title, null);
    }

    /** Creates a toast with the given category, title and description and a close button. */
    public static BasecoatToast of(final Category category, final String title, final String description) {

        return new BasecoatToast(category, title, description, null, null, null, null, null, true);
    }

    public BasecoatToast withAction(final Button action) {

        return new BasecoatToast(category, title, description, action, cancel, duration, icon, attrs, closeButton);
    }

    public BasecoatToast withCancel(final Button cancel) {

        return new BasecoatToast(category, title, description, action, cancel, duration, icon, attrs, closeButton);
    }

    /**
     * Sets how long the toast is shown. Basecoat closes toasts after 3 seconds by default, error toasts after 5 seconds,
     * and keeps loading toasts open; use {@link #PERSISTENT} to keep any toast open.
     */
    public BasecoatToast withDuration(final Duration duration) {

        return new BasecoatToast(category, title, description, action, cancel, duration, icon, attrs, closeButton);
    }

    public BasecoatToast withIcon(final Content icon) {

        return new BasecoatToast(category, title, description, action, cancel, duration, icon, attrs, closeButton);
    }

    public BasecoatToast withAttrs(final Map<?, ?> attrs) {

        return new BasecoatToast(category, title, description, action, cancel, duration, icon, attrs, closeButton);
    }

    public BasecoatToast withCloseButton(final boolean closeButton) {

        return new BasecoatToast(category, title, description, action, cancel, duration, icon, attrs, closeButton);
    }

    /** The toast categories, rendered in lower case as {@code data-category}. */
    public enum Category {
        SUCCESS,
        INFO,
        WARNING,
        ERROR,
        LOADING
    }

    /**
     * A toast footer button, rendered as a link if {@code href} is set, otherwise as a button. Any of them closes the
     * toast after its own click handler ran.
     *
     * @param label the button text
     * @param onclick JavaScript code to execute on click; never put user input here
     * @param href the URL for a link button
     */
    public record Button(String label, String onclick, String href) {

        /** Creates a button that just closes the toast. */
        public static Button of(final String label) {

            return new Button(label, null, null);
        }

        /** Creates a button executing the given JavaScript code before closing the toast. */
        public static Button of(final String label, final String onclick) {

            return new Button(label, onclick, null);
        }

        /** Creates a link button to the given URL. */
        public static Button link(final String label, final String href) {

            return new Button(label, null, href);
        }
    }
}

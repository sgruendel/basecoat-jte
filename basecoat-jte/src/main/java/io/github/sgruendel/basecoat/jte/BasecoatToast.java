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

    /**
     * Creates a toast with a title and a close button.
     *
     * @param category the category, or {@code null} for a toast without category and icon
     * @param title the title text; no title if {@code null} or empty
     * @return the toast
     */
    public static BasecoatToast of(final Category category, final String title) {

        return of(category, title, null);
    }

    /**
     * Creates a toast with a title, a description and a close button.
     *
     * @param category the category, or {@code null} for a toast without category and icon
     * @param title the title text; no title if {@code null} or empty
     * @param description the description text; no description if {@code null} or empty
     * @return the toast
     */
    public static BasecoatToast of(final Category category, final String title, final String description) {

        return new BasecoatToast(category, title, description, null, null, null, null, null, true);
    }

    /**
     * Returns a copy of this toast with the given action button.
     *
     * @param action the action button, or {@code null} for none
     * @return the new toast
     */
    public BasecoatToast withAction(final Button action) {

        return new BasecoatToast(category, title, description, action, cancel, duration, icon, attrs, closeButton);
    }

    /**
     * Returns a copy of this toast with the given cancel button.
     *
     * @param cancel the cancel button, or {@code null} for none
     * @return the new toast
     */
    public BasecoatToast withCancel(final Button cancel) {

        return new BasecoatToast(category, title, description, action, cancel, duration, icon, attrs, closeButton);
    }

    /**
     * Returns a copy of this toast with the given display duration. Basecoat closes toasts after 3 seconds by
     * default, error toasts after 5 seconds, and keeps loading toasts open; use {@link #PERSISTENT} to keep any toast
     * open.
     *
     * @param duration how long the toast is shown, rendered in milliseconds as {@code data-duration}; Basecoat's
     *     default if {@code null}
     * @return the new toast
     */
    public BasecoatToast withDuration(final Duration duration) {

        return new BasecoatToast(category, title, description, action, cancel, duration, icon, attrs, closeButton);
    }

    /**
     * Returns a copy of this toast with the given icon, replacing the category icon.
     *
     * @param icon the icon, e.g. an inline SVG, or {@code null} for the category icon
     * @return the new toast
     */
    public BasecoatToast withIcon(final Content icon) {

        return new BasecoatToast(category, title, description, action, cancel, duration, icon, attrs, closeButton);
    }

    /**
     * Returns a copy of this toast with the given additional HTML attributes.
     *
     * @param attrs the attributes for the toast list item, rendered by {@link JteHelper#attrs(Map)}
     * @return the new toast
     */
    public BasecoatToast withAttrs(final Map<?, ?> attrs) {

        return new BasecoatToast(category, title, description, action, cancel, duration, icon, attrs, closeButton);
    }

    /**
     * Returns a copy of this toast with or without the close icon button.
     *
     * @param closeButton whether to render the close icon button
     * @return the new toast
     */
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

        /**
         * Creates a button that just closes the toast.
         *
         * @param label the button text
         * @return the button
         */
        public static Button of(final String label) {

            return new Button(label, null, null);
        }

        /**
         * Creates a button executing the given JavaScript code before closing the toast.
         *
         * @param label the button text
         * @param onclick JavaScript code to execute on click; never put user input here
         * @return the button
         */
        public static Button of(final String label, final String onclick) {

            return new Button(label, onclick, null);
        }

        /**
         * Creates a link button to the given URL, closing the toast on click.
         *
         * @param label the button text
         * @param href the link target
         * @return the button
         */
        public static Button link(final String label, final String href) {

            return new Button(label, null, href);
        }
    }
}

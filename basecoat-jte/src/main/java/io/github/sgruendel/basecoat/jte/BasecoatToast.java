package io.github.sgruendel.basecoat.jte;

import gg.jte.Content;
import java.time.Duration;
import java.util.Map;
import java.util.Objects;

/**
 * A toast rendered by the toaster template. The single toast template takes the same values as separate parameters.
 *
 * <p>Optional fields are set with {@code with*} methods, each returning a new toast.
 *
 * @param category the toast category, which selects the default icon and ARIA role
 * @param title the toast title
 * @param description the toast description
 * @param action the primary button
 * @param cancel the secondary button
 * @param duration how long the toast is shown, or Basecoat's default for the category if {@code null}
 * @param icon an icon replacing the category's default icon
 * @param attrs additional HTML attributes for the toast element
 */
public record BasecoatToast(
        Category category,
        String title,
        String description,
        Button action,
        Button cancel,
        Duration duration,
        Content icon,
        Map<?, ?> attrs) {

    public BasecoatToast {
        Objects.requireNonNull(category, "category");
    }

    public static BasecoatToast of(final Category category, final String title) {

        return new BasecoatToast(category, title, null, null, null, null, null, null);
    }

    public static BasecoatToast of(final Category category, final String title, final String description) {

        return new BasecoatToast(category, title, description, null, null, null, null, null);
    }

    public BasecoatToast withAction(final Button action) {

        return new BasecoatToast(category, title, description, action, cancel, duration, icon, attrs);
    }

    public BasecoatToast withCancel(final Button cancel) {

        return new BasecoatToast(category, title, description, action, cancel, duration, icon, attrs);
    }

    public BasecoatToast withDuration(final Duration duration) {

        return new BasecoatToast(category, title, description, action, cancel, duration, icon, attrs);
    }

    public BasecoatToast withIcon(final Content icon) {

        return new BasecoatToast(category, title, description, action, cancel, duration, icon, attrs);
    }

    public BasecoatToast withAttrs(final Map<?, ?> attrs) {

        return new BasecoatToast(category, title, description, action, cancel, duration, icon, attrs);
    }

    public enum Category {
        SUCCESS,
        INFO,
        WARNING,
        ERROR
    }

    /**
     * A toast button, rendered as a link if {@code href} is set.
     *
     * @param href the link target
     * @param label the button text
     * @param onclick JavaScript run on click
     */
    public record Button(String href, String label, String onclick) {

        public static Button of(final String label) {

            return new Button(null, label, null);
        }

        public static Button of(final String label, final String onclick) {

            return new Button(null, label, onclick);
        }
    }
}

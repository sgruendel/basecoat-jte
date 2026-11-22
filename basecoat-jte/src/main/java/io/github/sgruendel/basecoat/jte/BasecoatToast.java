package io.github.sgruendel.basecoat.jte;

import gg.jte.Content;
import java.time.Duration;
import java.util.Map;

/**
 * A toast rendered initially by the toaster template, with the same fields as the toast template parameters. Optional
 * fields are set with {@code with*} methods, each returning a new toast.
 *
 * @param category the category, which determines the icon and ARIA role; {@link Category#SUCCESS} if {@code null}
 * @param title the title text
 * @param description the description text
 * @param action the action button
 * @param cancel the cancel button
 * @param duration how long the toast is shown; Basecoat's default if {@code null}
 * @param icon an icon replacing the category icon
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
        if (category == null) {
            category = Category.SUCCESS;
        }
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

    public record Button(String href, String label, String onclick) {

        public static Button of(final String label) {

            return new Button(null, label, null);
        }

        public static Button of(final String label, final String onclick) {

            return new Button(null, label, onclick);
        }
    }
}

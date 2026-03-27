import org.springframework.stereotype.Component;


@Component
public class LucideUtils {

    /**
     * Calculate stroke width to use for Lucide icons,
     * see <a href="https://github.com/lucide-icons/lucide/blob/main/packages/vue/src/Icon.ts#L50">source</a>
     *
     * @param size icon size in pixels, e.g. 24 or 48
     * @param strokeWidth stroke width in pixels, e.g. 2
     * @param absoluteStrokeWidth When absoluteStrokeWidth is enabled, a 48px icon will have the same 2px stroke width
     *         as a 24px icon.
     * @return Double or Integer value of stroke width to use
     */
    public static Number calculatedStrokeWidth (final int size, final int strokeWidth, final boolean absoluteStrokeWidth) {

        // see https://github.com/lucide-icons/lucide/blob/main/packages/vue/src/Icon.ts#L50
        // must not use ternary operator, as we want to return Double or Integer, so we don't get a trailing ".0"
        // when using strokeWidth directly
        if (absoluteStrokeWidth) {
            return strokeWidth * 24.0 / size;
        }
        return strokeWidth;
    }

}

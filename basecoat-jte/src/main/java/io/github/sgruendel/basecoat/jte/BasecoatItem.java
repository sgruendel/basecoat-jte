package io.github.sgruendel.basecoat.jte;

import gg.jte.Content;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

/**
 * Items passed to the Basecoat component templates. {@link Group} and {@link Separator} work in every component; each
 * component renders its own leaf types:
 *
 * <ul>
 *   <li>select and combobox: {@link Option}
 *   <li>dropdown menu and command: {@link MenuItem}
 *   <li>sidebar: {@link NavItem} and {@link Submenu}
 * </ul>
 *
 * <p>Templates reject leaf types they don't render, and all templates except the sidebar reject groups without
 * heading. Leaf labels are plain text and HTML-escaped; use the factories
 * taking {@link Content} for rich labels, which are rendered instead of the text label.
 *
 * <p>All items are immutable. Optional fields are set with {@code with*} methods, each returning a new item.
 */
public sealed interface BasecoatItem {

    /** A separator, rendered as {@code <hr role="separator">}. */
    Separator SEPARATOR = new Separator();

    /**
     * A group of items with an optional heading.
     *
     * @param id the heading id, generated from the item position if {@code null}
     * @param label the heading text; optional in the sidebar
     * @param attrs additional HTML attributes for the group element
     * @param items the grouped items
     */
    record Group(String id, String label, Map<?, ?> attrs, List<? extends BasecoatItem> items) implements BasecoatItem {

        /**
         * Creates a group with a heading.
         *
         * @param label the heading text
         * @param items the grouped items
         * @return the group, with the heading id generated from the item position
         */
        public static Group of(final String label, final List<? extends BasecoatItem> items) {

            return new Group(null, label, null, items);
        }

        /**
         * Creates a group without heading, which only the sidebar supports.
         *
         * @param items the grouped items
         * @return the group
         */
        public static Group of(final List<? extends BasecoatItem> items) {

            return new Group(null, null, null, items);
        }

        /**
         * Returns a copy of this group with the given heading id.
         *
         * @param id the heading id, or {@code null} to generate it from the item position
         * @return the new group
         */
        public Group withId(final String id) {

            return new Group(id, label, attrs, items);
        }

        /**
         * Returns a copy of this group with the given additional HTML attributes.
         *
         * @param attrs the attributes for the group element, rendered by {@link JteHelper#attrs(Map)}
         * @return the new group
         */
        public Group withAttrs(final Map<?, ?> attrs) {

            return new Group(id, label, attrs, items);
        }
    }

    /** A separator. Use {@link BasecoatItem#SEPARATOR}. */
    record Separator() implements BasecoatItem {}

    /**
     * An option of a select or combobox.
     *
     * @param label the option text; also rendered as {@code data-label} when {@code content} is set, which the select
     *     trigger then shows instead of the content
     * @param content rich option content, rendered instead of {@code label}
     * @param value the submitted value
     * @param attrs additional HTML attributes for the option element
     */
    record Option(String label, Content content, String value, Map<?, ?> attrs) implements BasecoatItem {

        public Option {
            requireLabel(label, content);
        }

        /**
         * Creates an option with a text label.
         *
         * @param label the option text
         * @param value the submitted value
         * @return the option
         * @throws IllegalArgumentException if {@code label} is {@code null}
         */
        public static Option of(final String label, final String value) {

            return new Option(label, null, value, null);
        }

        /**
         * Creates an option with rich content. Set a text label with {@link #withLabel(String)} for the select trigger
         * to show instead of the content.
         *
         * @param content the option content
         * @param value the submitted value
         * @return the option
         * @throws IllegalArgumentException if {@code content} is {@code null}
         */
        public static Option of(final Content content, final String value) {

            return new Option(null, content, value, null);
        }

        /**
         * Creates options from a map of labels by value, in the iteration order of the map.
         *
         * @param labelsByValue the labels by value, e.g. names by ID
         * @return the options, with the keys converted by {@link JteHelper#value(Object)}
         */
        public static List<Option> listOf(final Map<?, String> labelsByValue) {

            return labelsByValue.entrySet().stream()
                    .map(entry -> of(entry.getValue(), JteHelper.value(entry.getKey())))
                    .toList();
        }

        /**
         * Creates options from enum constants, in the given order.
         *
         * @param <E> the enum type
         * @param values the enum constants, e.g. {@code Status.values()}
         * @param label the function returning the label of a constant, e.g. {@code Status::getDisplayName}
         * @return the options, with the constant names as values
         */
        public static <E extends Enum<E>> List<Option> listOf(
                final E[] values, final Function<? super E, String> label) {

            return Arrays.stream(values)
                    .map(value -> of(label.apply(value), value.name()))
                    .toList();
        }

        /**
         * Creates options from values, in the iteration order of the collection.
         *
         * @param values the values, e.g. page sizes; must not contain {@code null}
         * @return the options, with the string representations as labels and the values converted by
         *     {@link JteHelper#value(Object)}
         */
        public static List<Option> listOf(final Collection<?> values) {

            return values.stream()
                    .map(value -> of(value.toString(), JteHelper.value(value)))
                    .toList();
        }

        /**
         * Returns a copy of this option with the given text label. For an option with rich content, the select trigger
         * shows this label instead of the content.
         *
         * @param label the option text
         * @return the new option
         * @throws IllegalArgumentException if {@code label} is {@code null} and this option has no content
         */
        public Option withLabel(final String label) {

            return new Option(label, content, value, attrs);
        }

        /**
         * Returns a copy of this option with the given additional HTML attributes.
         *
         * @param attrs the attributes for the option element, rendered by {@link JteHelper#attrs(Map)}
         * @return the new option
         */
        public Option withAttrs(final Map<?, ?> attrs) {

            return new Option(label, content, value, attrs);
        }
    }

    /**
     * An entry of a dropdown menu or command menu, rendered as a link if {@code url} is set.
     *
     * @param label the entry text
     * @param content rich entry content, rendered instead of {@code label}
     * @param url the link target
     * @param icon an icon rendered before the label
     * @param keywords additional search terms, used by the command menu only
     * @param disabled whether the entry is rendered with {@code aria-disabled="true"}
     * @param attrs additional HTML attributes for the entry element
     */
    record MenuItem(
            String label, Content content, String url, Content icon, String keywords, boolean disabled, Map<?, ?> attrs)
            implements BasecoatItem {

        public MenuItem {
            requireLabel(label, content);
        }

        /**
         * Creates an entry with a text label.
         *
         * @param label the entry text
         * @return the entry
         * @throws IllegalArgumentException if {@code label} is {@code null}
         */
        public static MenuItem of(final String label) {

            return new MenuItem(label, null, null, null, null, false, null);
        }

        /**
         * Creates an entry with rich content.
         *
         * @param content the entry content
         * @return the entry
         * @throws IllegalArgumentException if {@code content} is {@code null}
         */
        public static MenuItem of(final Content content) {

            return new MenuItem(null, content, null, null, null, false, null);
        }

        /**
         * Returns a copy of this entry with the given link target, rendering the entry as a link.
         *
         * @param url the link target, or {@code null} to render the entry without link
         * @return the new entry
         */
        public MenuItem withUrl(final String url) {

            return new MenuItem(label, content, url, icon, keywords, disabled, attrs);
        }

        /**
         * Returns a copy of this entry with the given icon, rendered before the label.
         *
         * @param icon the icon, e.g. an inline SVG
         * @return the new entry
         */
        public MenuItem withIcon(final Content icon) {

            return new MenuItem(label, content, url, icon, keywords, disabled, attrs);
        }

        /**
         * Returns a copy of this entry with the given search terms, which only the command menu uses.
         *
         * @param keywords additional search terms, separated by spaces
         * @return the new entry
         */
        public MenuItem withKeywords(final String keywords) {

            return new MenuItem(label, content, url, icon, keywords, disabled, attrs);
        }

        /**
         * Returns a copy of this entry with the given disabled state.
         *
         * @param disabled whether the entry is rendered with {@code aria-disabled="true"}
         * @return the new entry
         */
        public MenuItem withDisabled(final boolean disabled) {

            return new MenuItem(label, content, url, icon, keywords, disabled, attrs);
        }

        /**
         * Returns a copy of this entry with the given additional HTML attributes.
         *
         * @param attrs the attributes for the entry element, rendered by {@link JteHelper#attrs(Map)}
         * @return the new entry
         */
        public MenuItem withAttrs(final Map<?, ?> attrs) {

            return new MenuItem(label, content, url, icon, keywords, disabled, attrs);
        }
    }

    /**
     * A sidebar link.
     *
     * @param label the link text
     * @param content rich link content, rendered instead of {@code label}
     * @param url the link target
     * @param current whether the link is rendered with {@code aria-current="page"}
     * @param icon an icon rendered before the label
     * @param attrs additional HTML attributes for the link element
     */
    record NavItem(String label, Content content, String url, boolean current, Content icon, Map<?, ?> attrs)
            implements BasecoatItem {

        public NavItem {
            requireLabel(label, content);
        }

        /**
         * Creates a link with a text label.
         *
         * @param label the link text
         * @param url the link target
         * @return the link
         * @throws IllegalArgumentException if {@code label} is {@code null}
         */
        public static NavItem of(final String label, final String url) {

            return new NavItem(label, null, url, false, null, null);
        }

        /**
         * Creates a link with rich content.
         *
         * @param content the link content
         * @param url the link target
         * @return the link
         * @throws IllegalArgumentException if {@code content} is {@code null}
         */
        public static NavItem of(final Content content, final String url) {

            return new NavItem(null, content, url, false, null, null);
        }

        /**
         * Returns a copy of this link with the given current page state.
         *
         * @param current whether the link is rendered with {@code aria-current="page"}
         * @return the new link
         */
        public NavItem withCurrent(final boolean current) {

            return new NavItem(label, content, url, current, icon, attrs);
        }

        /**
         * Returns a copy of this link with the given icon, rendered before the label.
         *
         * @param icon the icon, e.g. an inline SVG
         * @return the new link
         */
        public NavItem withIcon(final Content icon) {

            return new NavItem(label, content, url, current, icon, attrs);
        }

        /**
         * Returns a copy of this link with the given additional HTML attributes.
         *
         * @param attrs the attributes for the link element, rendered by {@link JteHelper#attrs(Map)}
         * @return the new link
         */
        public NavItem withAttrs(final Map<?, ?> attrs) {

            return new NavItem(label, content, url, current, icon, attrs);
        }
    }

    /**
     * A collapsible sidebar submenu.
     *
     * @param label the summary text
     * @param content rich summary content, rendered instead of {@code label}
     * @param icon an icon rendered before the label
     * @param open whether the submenu is initially expanded
     * @param attrs additional HTML attributes for the {@code details} element
     * @param items the submenu items
     */
    record Submenu(
            String label,
            Content content,
            Content icon,
            boolean open,
            Map<?, ?> attrs,
            List<? extends BasecoatItem> items)
            implements BasecoatItem {

        public Submenu {
            requireLabel(label, content);
        }

        /**
         * Creates a collapsed submenu with a text label.
         *
         * @param label the summary text
         * @param items the submenu items
         * @return the submenu
         * @throws IllegalArgumentException if {@code label} is {@code null}
         */
        public static Submenu of(final String label, final List<? extends BasecoatItem> items) {

            return new Submenu(label, null, null, false, null, items);
        }

        /**
         * Creates a collapsed submenu with rich content.
         *
         * @param content the summary content
         * @param items the submenu items
         * @return the submenu
         * @throws IllegalArgumentException if {@code content} is {@code null}
         */
        public static Submenu of(final Content content, final List<? extends BasecoatItem> items) {

            return new Submenu(null, content, null, false, null, items);
        }

        /**
         * Returns a copy of this submenu with the given icon, rendered before the label.
         *
         * @param icon the icon, e.g. an inline SVG
         * @return the new submenu
         */
        public Submenu withIcon(final Content icon) {

            return new Submenu(label, content, icon, open, attrs, items);
        }

        /**
         * Returns a copy of this submenu with the given expanded state.
         *
         * @param open whether the submenu is initially expanded
         * @return the new submenu
         */
        public Submenu withOpen(final boolean open) {

            return new Submenu(label, content, icon, open, attrs, items);
        }

        /**
         * Returns a copy of this submenu with the given additional HTML attributes.
         *
         * @param attrs the attributes for the {@code details} element, rendered by {@link JteHelper#attrs(Map)}
         * @return the new submenu
         */
        public Submenu withAttrs(final Map<?, ?> attrs) {

            return new Submenu(label, content, icon, open, attrs, items);
        }
    }

    private static void requireLabel(final String label, final Content content) {

        if (label == null && content == null) {
            throw new IllegalArgumentException("label or content is required");
        }
    }
}

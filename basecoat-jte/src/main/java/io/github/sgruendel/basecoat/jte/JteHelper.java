package io.github.sgruendel.basecoat.jte;

import gg.jte.TemplateOutput;
import gg.jte.html.escape.Escape;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.regex.Pattern;

/**
 * Helpers for the Basecoat component templates, mainly for rendering the HTML attribute maps the templates take as
 * {@code *Attrs} parameters.
 *
 * <p>Attribute maps render each entry as an HTML attribute, with the key's string representation as name: a
 * {@code null} or {@code false} value omits the attribute, {@code true} renders it without value, e.g.
 * {@code disabled}, and any other value is rendered as escaped string, e.g. {@code data-x="1"}. Values of event handler
 * attributes ({@code on*}) are escaped for JavaScript.
 */
public final class JteHelper {

    // see https://html.spec.whatwg.org/multipage/syntax.html#attributes-2 for valid attribute names
    private static final Pattern HTML_ATTR_NAME = Pattern.compile("^(?!.*[\\p{Cntrl} \"'/>=])"
            + "(?!.*[\\x{FDD0}-\\x{FDEF}\\x{FFFE}\\x{FFFF}\\x{1FFFE}\\x{1FFFF}\\x{2FFFE}\\x{2FFFF}"
            + "\\x{3FFFE}\\x{3FFFF}\\x{4FFFE}\\x{4FFFF}\\x{5FFFE}\\x{5FFFF}\\x{6FFFE}\\x{6FFFF}"
            + "\\x{7FFFE}\\x{7FFFF}\\x{8FFFE}\\x{8FFFF}\\x{9FFFE}\\x{9FFFF}\\x{AFFFE}\\x{AFFFF}"
            + "\\x{BFFFE}\\x{BFFFF}\\x{CFFFE}\\x{CFFFF}\\x{DFFFE}\\x{DFFFF}\\x{EFFFE}\\x{EFFFF}"
            + "\\x{FFFFE}\\x{FFFFF}\\x{10FFFE}\\x{10FFFF}]).+$");

    private JteHelper() {}

    /**
     * Renders HTML attributes, to be written with {@code $unsafe{...}} into an element's start tag.
     *
     * @param attrs the attributes, may be {@code null}
     * @return the attributes, each preceded by a space, or {@code null} if {@code attrs} is {@code null} or empty
     * @throws IllegalArgumentException if an attribute name is not a valid HTML attribute name
     */
    public static String attrs(final Map<?, ?> attrs) {

        if (attrs == null || attrs.isEmpty()) {
            return null;
        }

        final StringBuilder sb = new StringBuilder();
        attrs.forEach((k, v) -> sb.append(htmlAttr(k.toString(), v)));
        return sb.toString();
    }

    /**
     * Renders HTML attributes except one, which the template renders itself, e.g. {@code class} merged with the
     * component's own class by {@link #classAppend(String, Map)}.
     *
     * @param attrs the attributes, may be {@code null}
     * @param keyToSkip the key of the attribute not to render
     * @return the remaining attributes, each preceded by a space, or {@code null} if {@code attrs} is {@code null} or
     *     empty
     * @throws IllegalArgumentException if an attribute name is not a valid HTML attribute name
     * @see #attrs(Map)
     */
    public static String attrs(final Map<?, ?> attrs, final Object keyToSkip) {

        if (attrs == null || attrs.isEmpty()) {
            return null;
        }

        final StringBuilder sb = new StringBuilder();
        attrs.entrySet().stream()
                .filter(entry -> !Objects.equals(keyToSkip, entry.getKey()))
                .forEach(entry -> sb.append(htmlAttr(entry.getKey().toString(), entry.getValue())));
        return sb.toString();
    }

    /**
     * Renders HTML attributes except the ones the template renders itself.
     *
     * @param attrs the attributes, may be {@code null}
     * @param keysToSkip the keys of the attributes not to render, may be {@code null}
     * @return the remaining attributes, each preceded by a space, or {@code null} if {@code attrs} is {@code null} or
     *     empty
     * @throws IllegalArgumentException if an attribute name is not a valid HTML attribute name
     * @see #attrs(Map)
     */
    public static String attrs(final Map<?, ?> attrs, final List<?> keysToSkip) {

        if (attrs == null || attrs.isEmpty()) {
            return null;
        }
        if (keysToSkip == null || keysToSkip.isEmpty()) {
            return attrs(attrs);
        }

        final StringBuilder sb = new StringBuilder();
        attrs.entrySet().stream()
                .filter(entry -> !keysToSkip.contains(entry.getKey()))
                .forEach(entry -> sb.append(htmlAttr(entry.getKey().toString(), entry.getValue())));
        return sb.toString();
    }

    /**
     * Returns the {@code class} attribute of an attribute map.
     *
     * @param attrs the attributes, may be {@code null}
     * @return the string representation of the {@code class} value, or {@code null} if it is missing or empty
     */
    public static String clazz(final Map<?, ?> attrs) {

        if (attrs != null && !attrs.isEmpty()) {
            final Object clazz = attrs.get("class");
            if (clazz != null) {
                final var classString = String.valueOf(clazz);
                if (!classString.isEmpty()) {
                    return classString;
                }
            }
        }
        return null;
    }

    /**
     * Appends the {@code class} attribute of an attribute map to a component's own class.
     *
     * @param className the component's own class, e.g. {@code tabs}
     * @param attrs the attributes, may be {@code null}
     * @return {@code className}, followed by a space and the {@code class} value if it is set and not empty
     */
    public static String classAppend(final String className, final Map<?, ?> attrs) {

        if (attrs != null && !attrs.isEmpty()) {
            final Object classAppend = attrs.get("class");
            if (classAppend != null) {
                final var classAppendString = String.valueOf(classAppend);
                if (!classAppendString.isEmpty()) {
                    return className + " " + classAppendString;
                }
            }
        }
        return className;
    }

    /**
     * Converts a value to the string submitted by a form control, e.g. the selected value of a select or combobox.
     *
     * @param value the value to convert, e.g. an ID or an enum constant
     * @return the name of an enum constant, the string representation of any other value, or {@code null} for
     *     {@code null}
     */
    public static String value(final Object value) {

        return switch (value) {
            case null -> null;
            case Enum<?> constant -> constant.name();
            default -> value.toString();
        };
    }

    private static String htmlAttr(final String name, final Object value) {

        if (!HTML_ATTR_NAME.matcher(name).matches()) {
            throw new IllegalArgumentException("Illegal HTML attribute name " + name);
        }
        if (value == null || Boolean.FALSE.equals(value)) {
            return "";
        }
        if (Boolean.TRUE.equals(value)) {
            return " " + name;
        }
        return " %s=\"%s\"".formatted(name, escapeHtmlAttributeValue(name, value.toString()));
    }

    private static String escapeHtmlAttributeValue(final String name, final String value) {

        final StringBuilder sb = new StringBuilder();
        final TemplateOutput to = new StringBuilderTemplateOutput(sb);

        // see
        // https://github.com/casid/jte/blob/main/jte-runtime/src/main/java/gg/jte/html/OwaspHtmlTemplateOutput.java#L70
        if (name.startsWith("on")) {
            Escape.javaScriptAttribute(value, to);
        } else {
            Escape.htmlAttribute(value, to);
        }
        return sb.toString();
    }

    private record StringBuilderTemplateOutput(StringBuilder sb) implements TemplateOutput {

        @Override
        public void writeContent(final String value) {

            sb.append(value);
        }

        @Override
        public void writeContent(final String value, final int beginIndex, final int endIndex) {

            sb.append(value, beginIndex, endIndex);
        }
    }
}

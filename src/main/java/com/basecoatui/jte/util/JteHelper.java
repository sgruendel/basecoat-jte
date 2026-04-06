package com.basecoatui.jte.util;

import gg.jte.TemplateOutput;
import gg.jte.html.escape.Escape;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.regex.Pattern;


public class JteHelper {

    // see https://html.spec.whatwg.org/multipage/syntax.html#attributes-2 for valid attribute names
    private static final Pattern HTML_ATTR_NAME = Pattern.compile(
            "^(?!.*[\\p{Cntrl} \"'/>=])"
                    + "(?!.*[\\x{FDD0}-\\x{FDEF}\\x{FFFE}\\x{FFFF}\\x{1FFFE}\\x{1FFFF}\\x{2FFFE}\\x{2FFFF}"
                    + "\\x{3FFFE}\\x{3FFFF}\\x{4FFFE}\\x{4FFFF}\\x{5FFFE}\\x{5FFFF}\\x{6FFFE}\\x{6FFFF}"
                    + "\\x{7FFFE}\\x{7FFFF}\\x{8FFFE}\\x{8FFFF}\\x{9FFFE}\\x{9FFFF}\\x{AFFFE}\\x{AFFFF}"
                    + "\\x{BFFFE}\\x{BFFFF}\\x{CFFFE}\\x{CFFFF}\\x{DFFFE}\\x{DFFFF}\\x{EFFFE}\\x{EFFFF}"
                    + "\\x{FFFFE}\\x{FFFFF}\\x{10FFFE}\\x{10FFFF}]).+$");

    public static String attrs(final Map<?, ?> attrs) {

        if (attrs == null || attrs.isEmpty()) {
            return null;
        }

        final StringBuffer sb = new StringBuffer();
        attrs.forEach((k, v) -> sb.append(htmlAttr(k.toString(), v)));
        return sb.toString();
    }

    public static String attrs(final Map<?, ?> attrs, final Object keyToSkip) {

        if (attrs == null || attrs.isEmpty()) {
            return null;
        }

        final StringBuffer sb = new StringBuffer();
        attrs.entrySet().stream()
                .filter(entry -> !Objects.equals(keyToSkip, entry.getKey()))
                .forEach(entry -> sb.append(htmlAttr(entry.getKey().toString(), entry.getValue())));
        return sb.toString();
    }

    public static String attrs(final Map<?, ?> attrs, final List<?> keysToSkip) {

        if (attrs == null || attrs.isEmpty()) {
            return null;
        }
        if (keysToSkip == null || keysToSkip.isEmpty()) {
            return attrs(attrs);
        }

        final StringBuffer sb = new StringBuffer();
        attrs.entrySet().stream()
                .filter(entry -> !keysToSkip.contains(entry.getKey()))
                .forEach(entry -> sb.append(htmlAttr(entry.getKey().toString(), entry.getValue())));
        return sb.toString();
    }

    public static String classAppend(final String className, final Map<?, ?> attrs) {

        if (attrs != null && !attrs.isEmpty()) {
            final Object classAppend = attrs.get("class");
            if (classAppend != null) {
                final var classAppendString = String.valueOf(classAppend);
                if (!classAppendString.isEmpty()) {
                    return className + " " + classAppend;
                }
            }
        }
        return className;
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

        final StringBuffer sb = new StringBuffer();
        final TemplateOutput to = new StringBufferTemplateOutput(sb);

        // see https://github.com/casid/jte/blob/main/jte-runtime/src/main/java/gg/jte/html/OwaspHtmlTemplateOutput.java#L70
        if (name.startsWith("on")) {
            Escape.javaScriptAttribute(value, to);
        } else {
            Escape.htmlAttribute(value, to);
        }
        return sb.toString();
    }

    private record StringBufferTemplateOutput(StringBuffer sb) implements TemplateOutput {

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
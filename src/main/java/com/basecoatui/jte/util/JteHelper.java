package com.basecoatui.jte.util;

import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Map;


public class JteHelper {

    public static <K, V> String attrs(final Map<K, V> m) {

        if (m == null || m.isEmpty()) {
            return null;
        }

        final StringBuffer sb = new StringBuffer();
        m.forEach((k, v) -> sb.append(htmlAttr(k, v)));
        return sb.toString();
    }

    public static <K, V> String attrs(final Map<K, V> m, final String keyToSkip) {

        if (m == null || m.isEmpty()) {
            return null;
        }

        final StringBuffer sb = new StringBuffer();
        m.entrySet().stream()
                .filter(entry -> !keyToSkip.equals(entry.getKey()))
                .forEach(entry -> sb.append(htmlAttr(entry.getKey(), entry.getValue())));
        return sb.toString();
    }

    public static <K, V> String attrs(final Map<K, V> m, final List<String> keysToSkip) {

        if (m == null || m.isEmpty()) {
            return null;
        }

        final StringBuffer sb = new StringBuffer();
        m.entrySet().stream()
                .filter(entry -> !keysToSkip.contains(entry.getKey()))
                .forEach(entry -> sb.append(htmlAttr(entry.getKey(), entry.getValue())));
        return sb.toString();
    }

    public static <K, V> String classAppend(final String className, final Map<K, V> m) {

        if (m != null && !m.isEmpty()) {
            final V classAppend = m.get("class");
            if (classAppend instanceof String classAppendString) {
                if (StringUtils.hasText(classAppendString)) {
                    return className + " " + classAppend;
                }
            }
        }
        return className;
    }

    private static <K, V> String htmlAttr(final K k, final V v) {

        if (v == null || Boolean.FALSE.equals(v)) {
            return "";
        }
        if (Boolean.TRUE.equals(v)) {
            return k.toString();
        }
        return " %s=\"%s\"".formatted(k, v);
    }

}
package com.basecoatui.jte.examples.admindashboard.models;

import java.util.Locale;

public enum OutlineSort {
    ID,
    HEADER,
    TYPE,
    STATUS,
    TARGET,
    LIMIT,
    REVIEWER;

    public static OutlineSort parse(final String value) {
        if (value == null || value.isBlank()) {
            return ID;
        }
        try {
            return valueOf(value.toUpperCase(Locale.ROOT));
        } catch (IllegalArgumentException ignored) {
            return ID;
        }
    }

    public String queryValue() {
        return name().toLowerCase(Locale.ROOT);
    }
}

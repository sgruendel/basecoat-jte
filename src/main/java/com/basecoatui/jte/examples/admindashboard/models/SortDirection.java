package com.basecoatui.jte.examples.admindashboard.models;

public enum SortDirection {
    ASC,
    DESC;

    public static SortDirection parse(final String value) {
        return "desc".equalsIgnoreCase(value) ? DESC : ASC;
    }

    public String queryValue() {
        return name().toLowerCase();
    }

    public SortDirection reverse() {
        return this == ASC ? DESC : ASC;
    }
}

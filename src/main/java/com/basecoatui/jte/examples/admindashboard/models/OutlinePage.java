package com.basecoatui.jte.examples.admindashboard.models;

import java.util.List;

public record OutlinePage(
    List<OutlineRow> rows,
    int page,
    int size,
    long totalElements,
    int totalPages,
    OutlineSort sort,
    SortDirection direction
) {
    public OutlinePage {
        rows = List.copyOf(rows);
    }

    public boolean hasPrevious() {
        return page > 0;
    }

    public boolean hasNext() {
        return page + 1 < totalPages;
    }
}

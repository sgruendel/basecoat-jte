package com.basecoatui.jte.examples.models;

import java.util.Set;

public record OutlineQuery(int page, int size, OutlineSort sort, SortDirection direction) {

    public static final int DEFAULT_SIZE = 10;
    public static final Set<Integer> ALLOWED_SIZES = Set.of(10, 20, 30, 40, 50);

    public OutlineQuery {
        page = Math.max(0, page);
        size = ALLOWED_SIZES.contains(size) ? size : DEFAULT_SIZE;
        sort = sort == null ? OutlineSort.ID : sort;
        direction = direction == null ? SortDirection.ASC : direction;
    }

    public static OutlineQuery from(
        final Integer page,
        final Integer size,
        final String sort,
        final String direction
    ) {
        return new OutlineQuery(
            page == null ? 0 : page,
            size == null ? DEFAULT_SIZE : size,
            OutlineSort.parse(sort),
            SortDirection.parse(direction)
        );
    }
}

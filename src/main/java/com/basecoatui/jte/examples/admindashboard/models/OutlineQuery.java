package com.basecoatui.jte.examples.admindashboard.models;

import org.springframework.data.domain.Pageable;

import java.util.List;

public record OutlineQuery(int page, int size, OutlineSort sort, SortDirection direction) {

    public static final int DEFAULT_SIZE = 10;
    public static final List<Integer> ALLOWED_SIZES = List.of(10, 20, 30, 40, 50);

    public OutlineQuery {
        page = Math.max(0, page);
        size = ALLOWED_SIZES.contains(size) ? size : DEFAULT_SIZE;
        sort = sort == null ? OutlineSort.ID : sort;
        direction = direction == null ? SortDirection.ASC : direction;
    }

    public static OutlineQuery from(final Pageable pageable) {
        final var order = pageable.getSort().stream().findFirst().orElse(null);
        return new OutlineQuery(
            pageable.getPageNumber(),
            pageable.getPageSize(),
            order == null ? OutlineSort.ID : OutlineSort.parse(order.getProperty()),
            order != null && order.isDescending() ? SortDirection.DESC : SortDirection.ASC
        );
    }
}

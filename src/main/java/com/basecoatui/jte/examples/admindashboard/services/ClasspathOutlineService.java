package com.basecoatui.jte.examples.admindashboard.services;

import com.basecoatui.jte.examples.admindashboard.models.OutlinePage;
import com.basecoatui.jte.examples.admindashboard.models.OutlineQuery;
import com.basecoatui.jte.examples.admindashboard.models.OutlineRow;
import com.basecoatui.jte.examples.admindashboard.models.SortDirection;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import tools.jackson.core.JacksonException;
import tools.jackson.core.type.TypeReference;
import tools.jackson.databind.json.JsonMapper;

import java.io.IOException;
import java.util.Collection;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class ClasspathOutlineService implements OutlineService {

    private static final String DATA_RESOURCE = "data/admin-dashboard-outline.json";

    private final List<OutlineRow> rows;

    public ClasspathOutlineService(final JsonMapper jsonMapper) {
        try (var input = new ClassPathResource(DATA_RESOURCE).getInputStream()) {
            rows = List.copyOf(jsonMapper.readValue(input, new TypeReference<List<OutlineRow>>() { }));
        } catch (IOException | JacksonException exception) {
            throw new IllegalStateException("Could not load " + DATA_RESOURCE, exception);
        }
    }

    @Override
    public OutlinePage findPage(final Pageable pageable) {
        final OutlineQuery query = OutlineQuery.from(pageable);
        final List<OutlineRow> sortedRows = rows.stream()
            .sorted(comparator(query))
            .toList();
        final int totalPages = Math.max(1, (sortedRows.size() + query.size() - 1) / query.size());
        final int page = Math.min(query.page(), totalPages - 1);
        final int fromIndex = Math.min(page * query.size(), sortedRows.size());
        final int toIndex = Math.min(fromIndex + query.size(), sortedRows.size());

        return new OutlinePage(
            sortedRows.subList(fromIndex, toIndex),
            page,
            query.size(),
            sortedRows.size(),
            totalPages,
            query.sort(),
            query.direction()
        );
    }

    @Override
    public Optional<OutlineRow> findById(final long id) {
        return rows.stream().filter(row -> row.id() == id).findFirst();
    }

    @Override
    public Set<Long> findExistingIds(final Collection<Long> ids) {
        if (ids.isEmpty()) {
            return Set.of();
        }
        final Set<Long> requestedIds = Set.copyOf(ids);
        return rows.stream()
            .map(OutlineRow::id)
            .filter(requestedIds::contains)
            .collect(Collectors.toUnmodifiableSet());
    }

    private Comparator<OutlineRow> comparator(final OutlineQuery query) {
        Comparator<OutlineRow> comparator = switch (query.sort()) {
            case ID -> Comparator.comparingLong(OutlineRow::id);
            case HEADER -> textComparator(OutlineRow::header);
            case TYPE -> textComparator(OutlineRow::type);
            case STATUS -> textComparator(OutlineRow::status);
            case TARGET -> Comparator.comparingInt(row -> number(row.target()));
            case LIMIT -> Comparator.comparingInt(row -> number(row.limit()));
            case REVIEWER -> textComparator(OutlineRow::reviewer);
        };
        if (query.direction() == SortDirection.DESC) {
            comparator = comparator.reversed();
        }
        return comparator.thenComparingLong(OutlineRow::id);
    }

    private Comparator<OutlineRow> textComparator(
        final java.util.function.Function<OutlineRow, String> value
    ) {
        return Comparator.comparing(
            row -> Optional.ofNullable(value.apply(row)).orElse("").toLowerCase(Locale.ROOT)
        );
    }

    private int number(final String value) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException ignored) {
            return 0;
        }
    }
}

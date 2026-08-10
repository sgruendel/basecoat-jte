package com.basecoatui.jte.examples.admindashboard.models;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public record OutlineSelection(
    Set<Long> selectedIds,
    List<Long> offPageIds,
    boolean allPageRowsSelected,
    boolean somePageRowsSelected
) {

    public OutlineSelection {
        selectedIds = Set.copyOf(selectedIds);
        offPageIds = List.copyOf(offPageIds);
    }

    public static OutlineSelection from(
        final Set<Long> selectedIds,
        final OutlinePage page,
        final boolean togglePage
    ) {
        final Set<Long> pageIds = page.rows().stream()
            .map(OutlineRow::id)
            .collect(Collectors.toUnmodifiableSet());
        final Set<Long> effectiveIds = new LinkedHashSet<>(selectedIds);

        if (togglePage) {
            if (!pageIds.isEmpty() && effectiveIds.containsAll(pageIds)) {
                effectiveIds.removeAll(pageIds);
            } else {
                effectiveIds.addAll(pageIds);
            }
        }

        final long selectedOnPage = pageIds.stream().filter(effectiveIds::contains).count();
        final boolean allPageRowsSelected = !pageIds.isEmpty() && selectedOnPage == pageIds.size();
        final List<Long> offPageIds = effectiveIds.stream()
            .filter(id -> !pageIds.contains(id))
            .sorted()
            .toList();

        return new OutlineSelection(
            effectiveIds,
            offPageIds,
            allPageRowsSelected,
            selectedOnPage > 0
        );
    }

    public int count() {
        return selectedIds.size();
    }

    public boolean isSelected(final long id) {
        return selectedIds.contains(id);
    }

    public boolean pageSelectionIndeterminate() {
        return somePageRowsSelected && !allPageRowsSelected;
    }
}

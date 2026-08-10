package com.basecoatui.jte.examples.admindashboard.services;

import com.basecoatui.jte.examples.admindashboard.models.OutlinePage;
import com.basecoatui.jte.examples.admindashboard.models.OutlineRow;
import org.springframework.data.domain.Pageable;

import java.util.Collection;
import java.util.Optional;
import java.util.Set;

public interface OutlineService {

    OutlinePage findPage(Pageable pageable);

    Optional<OutlineRow> findById(long id);

    Set<Long> findExistingIds(Collection<Long> ids);
}

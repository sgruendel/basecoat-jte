package io.github.sgruendel.basecoat.jte.demo.examples.admindashboard.services;

import io.github.sgruendel.basecoat.jte.demo.examples.admindashboard.models.OutlinePage;
import io.github.sgruendel.basecoat.jte.demo.examples.admindashboard.models.OutlineRow;
import java.util.Collection;
import java.util.Optional;
import java.util.Set;
import org.springframework.data.domain.Pageable;

public interface OutlineService {

    OutlinePage findPage(Pageable pageable);

    Optional<OutlineRow> findById(long id);

    Set<Long> findExistingIds(Collection<Long> ids);
}

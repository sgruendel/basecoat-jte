package com.basecoatui.jte.examples.admindashboard.services;

import com.basecoatui.jte.examples.admindashboard.models.OutlinePage;
import com.basecoatui.jte.examples.admindashboard.models.OutlineRow;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

public interface OutlineService {

    OutlinePage findPage(Pageable pageable);

    Optional<OutlineRow> findById(long id);
}

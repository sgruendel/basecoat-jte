package com.basecoatui.jte.examples.admindashboard.services;

import com.basecoatui.jte.examples.models.OutlinePage;
import com.basecoatui.jte.examples.models.OutlineQuery;
import com.basecoatui.jte.examples.models.OutlineRow;

import java.util.Optional;

public interface OutlineService {

    OutlinePage findPage(OutlineQuery query);

    Optional<OutlineRow> findById(long id);
}

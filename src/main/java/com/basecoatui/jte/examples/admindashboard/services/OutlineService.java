package com.basecoatui.jte.examples.admindashboard.services;

import com.basecoatui.jte.examples.admindashboard.models.OutlinePage;
import com.basecoatui.jte.examples.admindashboard.models.OutlineQuery;
import com.basecoatui.jte.examples.admindashboard.models.OutlineRow;

import java.util.Optional;

public interface OutlineService {

    OutlinePage findPage(OutlineQuery query);

    Optional<OutlineRow> findById(long id);
}

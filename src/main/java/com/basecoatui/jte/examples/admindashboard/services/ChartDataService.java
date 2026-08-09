package com.basecoatui.jte.examples.admindashboard.services;

import com.basecoatui.jte.examples.admindashboard.models.ChartDataPoint;

import java.util.List;

public interface ChartDataService {

    List<ChartDataPoint> findLastDays(int days);
}

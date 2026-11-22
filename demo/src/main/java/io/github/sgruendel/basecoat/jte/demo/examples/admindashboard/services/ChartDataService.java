package io.github.sgruendel.basecoat.jte.demo.examples.admindashboard.services;

import io.github.sgruendel.basecoat.jte.demo.examples.admindashboard.models.ChartDataPoint;
import java.util.List;

public interface ChartDataService {

    List<ChartDataPoint> findLastDays(int days);

    List<ChartDataPoint> findDetailChartData();
}

package com.basecoatui.jte.examples.admindashboard.services;

import com.basecoatui.jte.examples.admindashboard.models.ChartDataPoint;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import tools.jackson.core.JacksonException;
import tools.jackson.core.type.TypeReference;
import tools.jackson.databind.json.JsonMapper;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@Service
public class ClasspathChartDataService implements ChartDataService {

    private static final String CHART_DATA_RESOURCE = "data/admin-dashboard-chart.json";
    private static final String DETAIL_CHART_DATA_RESOURCE = "data/admin-dashboard-detail-chart.json";

    private final List<ChartDataPoint> rows;
    private final List<ChartDataPoint> detailRows;
    private final LocalDate latestDate;

    public ClasspathChartDataService(final JsonMapper jsonMapper) {
        try (
            var chartInput = new ClassPathResource(CHART_DATA_RESOURCE).getInputStream();
            var detailChartInput = new ClassPathResource(DETAIL_CHART_DATA_RESOURCE).getInputStream()
        ) {
            rows = List.copyOf(jsonMapper.readValue(chartInput, new TypeReference<List<ChartDataPoint>>() { }));
            detailRows = List.copyOf(
                jsonMapper.readValue(detailChartInput, new TypeReference<List<ChartDataPoint>>() { })
            );
            latestDate = rows.stream()
                .map(ChartDataPoint::date)
                .map(LocalDate::parse)
                .max(LocalDate::compareTo)
                .orElseThrow(() -> new IllegalStateException(CHART_DATA_RESOURCE + " is empty"));
        } catch (IOException | JacksonException exception) {
            throw new IllegalStateException("Could not load Admin Dashboard chart data", exception);
        }
    }

    @Override
    public List<ChartDataPoint> findLastDays(final int days) {
        final LocalDate start = latestDate.minusDays(Math.max(0, days));
        return rows.stream()
            .filter(row -> !LocalDate.parse(row.date()).isBefore(start))
            .toList();
    }

    @Override
    public List<ChartDataPoint> findDetailChartData() {
        return detailRows;
    }
}

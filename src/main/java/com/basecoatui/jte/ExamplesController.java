package com.basecoatui.jte;

import com.basecoatui.jte.examples.admindashboard.models.OutlinePage;
import com.basecoatui.jte.examples.admindashboard.models.OutlineQuery;
import com.basecoatui.jte.examples.admindashboard.services.ChartDataService;
import com.basecoatui.jte.examples.admindashboard.services.OutlineService;
import com.basecoatui.jte.examples.models.User;
import com.basecoatui.jte.util.BasecoatSelect.Item;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.List;

import static org.springframework.http.HttpStatus.NOT_FOUND;


@Controller
@RequestMapping("/examples")
public class ExamplesController {

    private static final List<Item> PAGE_SIZE_ITEMS = OutlineQuery.ALLOWED_SIZES.stream()
        .map(String::valueOf)
        .map(value -> Item.of(value, value))
        .toList();

    private final ChartDataService chartDataService;

    private final OutlineService outlineService;

    public ExamplesController(final ChartDataService chartDataService, final OutlineService outlineService) {
        this.chartDataService = chartDataService;
        this.outlineService = outlineService;
    }

    @GetMapping("/admin-dashboard")
    public String examples(final Model model) {

        final var user = new User("shadcn", "m@example.com", "https://github.com/shadcn.png");
        final var outlinePage = outlineService.findPage(Pageable.ofSize(OutlineQuery.DEFAULT_SIZE));
        model.addAttribute("user", user);
        model.addAttribute("outlinePage", outlinePage);
        model.addAttribute("baseUrl", outlineBaseUrl(outlinePage));
        model.addAttribute("pageSizeItems", PAGE_SIZE_ITEMS);
        return "examples/adminDashboard/index";
    }

    @GetMapping("/admin-dashboard/outlines")
    public String outline(
        @PageableDefault(size = OutlineQuery.DEFAULT_SIZE, sort = "id") final Pageable pageable,
        final Model model
    ) {
        final var page = outlineService.findPage(pageable);
        model.addAttribute("page", page);
        model.addAttribute("baseUrl", outlineBaseUrl(page));
        model.addAttribute("pageSizeItems", PAGE_SIZE_ITEMS);
        return "examples/adminDashboard/components/dataTable/outlineResults";
    }

    @GetMapping("/admin-dashboard/outlines/{id}")
    public String outlineDetails(@PathVariable final long id, final Model model) {
        model.addAttribute(
            "row",
            outlineService.findById(id)
                .orElseThrow(() -> new ResponseStatusException(NOT_FOUND, "Outline row not found"))
        );
        model.addAttribute("detailData", chartDataService.findDetailChartData());
        return "examples/adminDashboard/components/dataTable/outlineDetails";
    }

    @GetMapping("/admin-dashboard/chart-area-interactive")
    public String chartAreaInteractive(@RequestParam(defaultValue = "90d") final String range, final Model model) {

        // TODO derive default value from enum
        // TODO add Java enum for this, inject values as model attribute, and use that in the template to generate the buttons
        final int days = switch (range) {
            case "7d" -> 7;
            case "30d" -> 30;
            default -> 90;
        };
        model.addAttribute("data", chartDataService.findLastDays(days));
        model.addAttribute("range", range);
        return "examples/adminDashboard/components/chartAreaInteractive";
    }

    private String outlineBaseUrl(final OutlinePage page) {
        return UriComponentsBuilder.fromPath("/examples/admin-dashboard/outlines")
            .queryParam("size", page.size())
            .queryParam("sort", page.sort().queryValue() + "," + page.direction().queryValue())
            .toUriString();
    }

}

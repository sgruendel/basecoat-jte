package com.basecoatui.jte;

import com.basecoatui.jte.examples.admindashboard.models.OutlineQuery;
import com.basecoatui.jte.examples.admindashboard.services.ChartDataService;
import com.basecoatui.jte.examples.admindashboard.services.OutlineService;
import com.basecoatui.jte.examples.models.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import static org.springframework.http.HttpStatus.NOT_FOUND;


@Controller
@RequestMapping("/examples")
public class ExamplesController {

    private final ChartDataService chartDataService;

    private final OutlineService outlineService;

    public ExamplesController(final ChartDataService chartDataService, final OutlineService outlineService) {
        this.chartDataService = chartDataService;
        this.outlineService = outlineService;
    }

    @GetMapping("/admin-dashboard")
    public String examples(final Model model) {

        final var user = new User("shadcn", "m@example.com", "https://github.com/shadcn.png");
        model.addAttribute("user", user);
        model.addAttribute("outlinePage", outlineService.findPage(OutlineQuery.from(null, null, null, null)));
        return "examples/adminDashboard/index";
    }

    @GetMapping("/admin-dashboard/outlines")
    public String outline(
        @RequestParam(required = false) final Integer page,
        @RequestParam(required = false) final Integer size,
        @RequestParam(required = false) final String sort,
        @RequestParam(required = false) final String direction,
        final Model model
    ) {
        model.addAttribute("page", outlineService.findPage(OutlineQuery.from(page, size, sort, direction)));
        return "examples/adminDashboard/components/dataTable/outlineResults";
    }

    @GetMapping("/admin-dashboard/outlines/{id}")
    public String outlineDetails(@PathVariable final long id, final Model model) {
        model.addAttribute(
            "row",
            outlineService.findById(id)
                .orElseThrow(() -> new ResponseStatusException(NOT_FOUND, "Outline row not found"))
        );
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

}


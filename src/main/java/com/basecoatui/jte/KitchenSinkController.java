package com.basecoatui.jte;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class KitchenSinkController {

    @GetMapping("/")
    public String kitchenSink(final Model model) {

        return "kitchenSink";
    }

}

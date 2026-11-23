package io.github.sgruendel.basecoat.jte.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/fragments/toast")
public class ToastController {

    @GetMapping("/success")
    public String success() {

        return "kitchenSink/toast/success";
    }

    @GetMapping("/info")
    public String info() {

        return "kitchenSink/toast/info";
    }

    @GetMapping("/warning")
    public String warning() {

        return "kitchenSink/toast/warning";
    }

    @GetMapping("/error")
    public String error() {

        return "kitchenSink/toast/error";
    }
}

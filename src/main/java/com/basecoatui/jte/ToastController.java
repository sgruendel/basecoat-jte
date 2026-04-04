package com.basecoatui.jte;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/fragments/toast")
public class ToastController {

    @GetMapping("/success")
    public String success() {

        return "partials/toast/success";
    }

    @GetMapping("/info")
    public String info() {

        return "partials/toast/info";
    }

    @GetMapping("/warning")
    public String warning() {

        return "partials/toast/warning";
    }

    @GetMapping("/error")
    public String error() {

        return "partials/toast/error";
    }

}

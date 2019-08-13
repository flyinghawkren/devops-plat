package com.example.demo.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class HelloController {

    @RequestMapping("/", method = GET)
    public String hello(){
        String str = "Hello World! v1.0.0";
        return str;
    }
}
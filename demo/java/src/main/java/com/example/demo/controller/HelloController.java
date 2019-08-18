package com.example.demo.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RestController
public class HelloController {

    @RequestMapping(value="/", method=RequestMethod.GET)
    public String hello(){
        String str = "Hello World! v1.0.0";
        return str;
    }

    @RequestMapping(value="/add", method=RequestMethod.GET)
    public Integer add(@RequestParam Integer a, @RequestParam Integer b){
        return a + b;
    }
}
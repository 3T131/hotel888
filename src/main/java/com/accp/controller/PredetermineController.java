package com.accp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Predetermine")
public class PredetermineController {
    @RequestMapping("/tolist.do")
    public String list(){

        return "predetermine/list";
    }
@RequestMapping("/toadd.do")
    public String toAdd(){
        return "predetermine/add";
}
}

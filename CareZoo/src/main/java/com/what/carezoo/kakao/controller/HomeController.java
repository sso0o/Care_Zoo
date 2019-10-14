package com.what.carezoo.kakao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/kakao")
public class HomeController {

	 
    @RequestMapping(value="/")
    public String index() {
        
        return "index";
    }
    
    @RequestMapping(value="/login")
    public String login(@RequestParam("email") String email,@RequestParam("name") String name,Model model) {
        System.out.println("email: "+email+" name: "+name);
        model.addAttribute("email", email);
        model.addAttribute("name", name);
        return "joinForm_customer2";
    }
}

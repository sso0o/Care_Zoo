package com.what.carezoo.kakao.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.what.carezoo.member.service.MemberService;

@Controller
@RequestMapping("/kakao")
public class HomeController {

	 @Autowired
	 private MemberService mService;
    
    @RequestMapping(value="/login")
    public String login(@RequestParam("email") String email,@RequestParam("name") String name, @RequestParam("id") String id,Model model) {
        System.out.println("email: "+email+" name: "+name+" id: "+id);
        if(mService.findC_id(id)>0) {
        	model.addAttribute("c_name", name);
        	return "mainLogin";
        }
        model.addAttribute("id", id);
        model.addAttribute("email", email);
        model.addAttribute("name", name);
        return "joinForm_customer2";
    }
}

package com.what.carezoo.hotel.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping("/")
	public String indexHandler(Authentication auth) {
		if(auth != null) {
//			System.out.println(auth.isAuthenticated());
//			System.out.println(auth.getName());
//			System.out.println(auth.getAuthorities());
			//만약에 authority에 
			if(auth.getName().equals("c@re.zoo")) {
				return "redirect:admin/memberList";
			}
		}
		
		return "main";
	}
}

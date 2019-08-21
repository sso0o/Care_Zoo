package com.what.carezoo.sitter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/sitter")
@Controller
public class MainController {
	@RequestMapping("/sMain")
	public String enterSitter() {
		return "sitter/sitterMain";		
	}
	
}

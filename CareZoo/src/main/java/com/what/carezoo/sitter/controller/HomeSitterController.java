package com.what.carezoo.sitter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/sitter/home")
@Controller
public class HomeSitterController {
	@RequestMapping("/sMain")
	public String showMain() {
		return "sitter/sitterMain";
	}
	@RequestMapping("/main")
	public String enterMain() {
		return "sitter/sitterMain";
	}
}

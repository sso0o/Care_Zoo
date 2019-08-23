package com.what.carezoo.sitter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/home")
@Controller
public class HomeSitterController {
	@RequestMapping("/main")
	public String enterMain() {
		return "sitter/sitterMain";
	}
	@RequestMapping("/search")
	public String showMain() {
		return "sitter/home/homeSitterList";
	}
}

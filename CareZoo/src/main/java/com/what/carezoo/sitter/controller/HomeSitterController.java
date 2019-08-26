package com.what.carezoo.sitter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.what.carezoo.model.HomeSitterList;
import com.what.carezoo.sitter.service.HomeSitterSearchingService;
@RequestMapping("home")
@Controller
public class HomeSitterController {
	@Autowired
	private HomeSitterSearchingService hssService;
	@RequestMapping("/main")
	public String enterHomeSitterMain() {
		return "sitter/home/homeSitterList";
	}
	@RequestMapping("/search")
	public String searchHS(Model model, HomeSitterList hss) {
		System.out.println(hss);
		model.addAttribute("hssList", hssService.modifyHSS(hss));
		return "sitter/home/homeSitterList";
	}
}	

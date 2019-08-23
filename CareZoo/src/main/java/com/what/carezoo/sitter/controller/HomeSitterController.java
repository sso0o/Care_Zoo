package com.what.carezoo.sitter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.what.carezoo.model.HomeSitterSearching;
import com.what.carezoo.sitter.service.HomeSitterSearchingService;
@RequestMapping("/sitter/home")
@Controller
public class HomeSitterController {
	@Autowired
	private HomeSitterSearchingService hssService;
	@RequestMapping("/main")
	public String enterHomeSitterMain() {
		return "sitter/home/homeSitterList";
	}
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String showSearchingList() {
		return "home/homeSitterList";
	}
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String searchHS(Model model, HomeSitterSearching hss) {
		System.out.println(hss);
		model.addAttribute("hssList", hssService.modifyHSS(hss));
		return "home/homeSitterList";
	}
}

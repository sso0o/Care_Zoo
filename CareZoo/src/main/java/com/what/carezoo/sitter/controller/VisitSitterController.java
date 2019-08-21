package com.what.carezoo.sitter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/sitter/visit")
@Controller
public class VisitSitterController {
	@RequestMapping("/vMain")
	public String showMain() {
		return "sitter/visit/Reservation1";
	}
	@RequestMapping("/address")
	public String address() {
		return "sitter/visit/Address";
	}
}

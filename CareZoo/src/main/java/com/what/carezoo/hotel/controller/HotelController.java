package com.what.carezoo.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hotel")
public class HotelController {
	
	@RequestMapping("/main")
	public String showHotelMain() {
		return "hotel/hotelMain";
	}
	


}

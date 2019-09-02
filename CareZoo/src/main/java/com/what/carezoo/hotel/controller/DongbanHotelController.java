package com.what.carezoo.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dongbanHotel")
public class DongbanHotelController {//보호자+펫 호텔
	
	@RequestMapping("/hotelList")
	public String showHotelList() {
		return "/hotel/hotelList";
	}
	
	@RequestMapping("/hotelView")
	public String showHotelView() {
		return "/hotel/hotelView";
	}
}

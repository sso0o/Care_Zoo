package com.what.carezoo.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hotel")
public class HotelController {//보호자+펫 호텔
	
	@RequestMapping("/hotelList")
	public String showHotelList() {
		return "/hotel/hotelList";
	}

}

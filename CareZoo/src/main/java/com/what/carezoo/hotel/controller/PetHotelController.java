package com.what.carezoo.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/petHotel")
public class PetHotelController {//보호자 비동반 애견호텔 컨트롤러
	
	@RequestMapping("/pethotelList")
	public String showPetHotelList() {
		return "hotel/"+"petHotelList";
	}

}

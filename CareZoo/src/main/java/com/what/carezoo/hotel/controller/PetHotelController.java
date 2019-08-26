package com.what.carezoo.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/petHotel")
public class PetHotelController {//보호자 비동반 애견호텔 컨트롤러
	
	//펫호텔 목록보기
	@RequestMapping("/petHotelList")
	public String showPetHotelList() {
		return "hotel/petHotelList";
	}
	
	//펫호텔 예약폼
	@RequestMapping("/petHotelResForm")
	public String showPetHotelResForm() {
		return "hotel/petHotelResForm";
	}
	
	//펫호텔 상세보기
	@RequestMapping("/petHotelView")
	public String showPetHotelView() {
		return "hotel/petHotelView";
	}
}

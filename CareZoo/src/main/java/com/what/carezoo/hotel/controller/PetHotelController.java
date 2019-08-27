package com.what.carezoo.hotel.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.what.carezoo.hotel.service.PetHotelService;
import com.what.carezoo.model.PetHotel;

@Controller
@RequestMapping("/petHotel")
public class PetHotelController {// 보호자 비동반 애견호텔 컨트롤러

	@Autowired
	private PetHotelService phService;
	

	// 펫호텔 목록보기
	@RequestMapping("/petHotelList")
	public String showPetHotelList(Model m) {
		List<PetHotel> hList = phService.getAllPetHotel();

		m.addAttribute("hList", hList);
		return "hotel/petHotelList";
	}

	// 펫호텔 예약폼
	@RequestMapping("/petHotelResForm")
	public String showPetHotelResForm() {
		return "hotel/petHotelResForm";
	}

	// 펫호텔 상세보기
	@RequestMapping("/petHotelView")
	public String showPetHotelView() {
		return "hotel/petHotelView";
	}
	
	
	
	

}

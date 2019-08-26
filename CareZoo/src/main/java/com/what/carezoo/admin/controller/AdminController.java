package com.what.carezoo.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.what.carezoo.hotel.service.DongbanHotelService;
import com.what.carezoo.hotel.service.PetHotelService;
import com.what.carezoo.model.PetHotel;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private PetHotelService phService;
	
	@Autowired
	private DongbanHotelService dhService;
	
	@RequestMapping("/main")
	public String showAdminMain() {
		return "admin/adminMain";
	}

	// qna테스트 <---------------------------------------------------------이거 위치 어디다가,,?
	@RequestMapping("/qna")
	public String showQna() {
		return "my&customer/qna";
	}

	// add PetHotel Form
	@RequestMapping("/addPetHotelForm")
	public String showAddPetHotelForm() {
		return "hotel/addPetHotelForm";
	}

	// add pet hotel
	@RequestMapping("/addPetHotel")
	public String addPetHotel(PetHotel ph) {
		phService.addPetHotel(ph);
		return "hotel/addPetHotelForm";
	}
	
	// add PetHotel Form
		@RequestMapping("/addHotelForm")
		public String showAddHotelForm() {
			return "hotel/addPetHotelForm";
		}

		// add pet hotel
		@RequestMapping("/addHotel")
		public String addHotel(PetHotel ph) {
			phService.addPetHotel(ph);
			return "hotel/addPetHotelForm";
		}

}

package com.what.carezoo.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	//////////////////////////////////////////////////////////////////////////호텔
	// add PetHotel Form
	@RequestMapping("/addHotelForm")
	public String showAddHotelForm() {
		return "admin/addHotelForm";
	}

	// add pet hotel
	@RequestMapping("/addHotel")
	public String addHotel(PetHotel ph) {
		phService.addPetHotel(ph);
		return "admin/addHotelForm";
	}
	
	
	/////////////////////////////////////////////////////////////////////////////////펫호텔

	// add PetHotel Form
	@RequestMapping("/addPetHotelForm")
	public String showAddPetHotelForm() {
		return "admin/addPetHotelForm";
	}

	// add pet hotel
	@RequestMapping("/addPetHotel")
	public String addPetHotel(PetHotel ph) {
		phService.addPetHotel(ph);
		return "admin/addPetHotelForm";
	}
	

		@RequestMapping("/test")
		public String test(HttpServletRequest request, Model m, String email, String pass ) {
			String radio = request.getParameter("user");
			m.addAttribute("user", radio);
					
			return "test";
			
		}

}

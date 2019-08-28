package com.what.carezoo.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.what.carezoo.hotel.service.DongbanHotelService;
import com.what.carezoo.hotel.service.PetHotelService;
import com.what.carezoo.member.service.MemberService;
import com.what.carezoo.model.Customer;
import com.what.carezoo.model.PetHotel;
import com.what.carezoo.sitter.service.SitterService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private PetHotelService phService;

	@Autowired
	private DongbanHotelService dhService;
	
	@Autowired
	private MemberService mService;
	

	

	@RequestMapping("/main")
	public String showAdminMain() {
		return "admin/adminMain";
	}

	//  <---------------------------------------------------------이거 위치
	@RequestMapping("/qna")
	public String showQna() {
		return "my&customer/qna";
	}
	
	@RequestMapping("/test")
	public String test(HttpServletRequest request, Model m, String email, String pass) {
		String radio = request.getParameter("user");
		m.addAttribute("user", radio);

		return "test";

	}
	
	// <-----------------------------------------------------------------이거 위치
	
	///////////////////////////////////////////////////////////////////////////////// 멤버
	
	@RequestMapping("/memberList")
	public String showMemberList(Model m) {
		List<Customer> cList = mService.selectAll();
		
		m.addAttribute("cList", cList);
		return "admin/memberList";
	}
	
	

	////////////////////////////////////////////////////////////////////////// 호텔
	// add PetHotel Form
	@RequestMapping("/addHotelForm")
	public String showAddHotelForm() {
		return "admin/addHotelForm";
	}

	// add pet hotel
	@RequestMapping("/addHotel")
	public String addHotel(PetHotel ph) {
		return "admin/addHotelForm";
	}

	///////////////////////////////////////////////////////////////////////////////// 펫호텔

	// add PetHotel Form
	@RequestMapping("/addPetHotelForm")
	public String showAddPetHotelForm() {
		return "admin/addPetHotelForm";
	}

	// 펫호텔 추가
	@RequestMapping(value = "/addPetHotel", method = RequestMethod.POST)
	public String name(PetHotel ph, Model m, MultipartFile file) {
		System.out.println(ph);
		
		boolean rst = phService.addPetHotel(ph,file);
		if (rst) {
			return "redirect:/admin/main";
		} else {
			return "redirect:/admin/addPetHotelForm";
		}

	}
	// 펫호텔 수정하기 위해 리스트 보기
	@RequestMapping("/petHotelList")
	public String showPetHotelList(Model m) {
		List<PetHotel> phL = phService.getAllPetHotel();
		m.addAttribute("phL", phL);
		System.out.println(phL);
		return "admin/petHotelList";
	}

	// 펫호텔 상세보기
	@RequestMapping("/viewPetHotel")
	public String viewPetHotel(int ph_num, Model m) {
		PetHotel ph = phService.getPetHotelbyNum(ph_num);
		m.addAttribute("ph", ph);
		return "admin/viewPetHotel";
	}

	// 펫호텔 수정
	@RequestMapping(value="/modifyPetHotel", method = RequestMethod.POST)
	public String modifyPetHotel(PetHotel ph, Model m) {
		int num = ph.getPh_num();
		boolean rst = phService.modifyPetHotel(ph);
		if(rst) {
			return "redirect:/admin/petHotelList";
		} else {
			return "admin/viewPetHotel?ph_num="+num;
		}
	}
	
	@RequestMapping("/delPetHotel")
	public String delPetHotel(int ph_num) {
		boolean rst = phService.removePetHotel(ph_num);
		if(rst) {
			return "redirect:/admin/petHotelList";
		} else {
			return "redirect:/admin/viewPetHotel?ph_num="+ph_num;
		}
	}

}

package com.what.carezoo.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.what.carezoo.hotel.service.DongbanHotelService;
import com.what.carezoo.hotel.service.PetHotelService;
import com.what.carezoo.member.service.MemberService;
import com.what.carezoo.model.Customer;
import com.what.carezoo.model.Pet;
import com.what.carezoo.model.PetHotel;
import com.what.carezoo.pet.service.PetService;
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
	
	@Autowired
	private PetService pService;
	

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
	
	@RequestMapping("/memberView")
	public String showMemberView(String c_email, Model m) {
		Customer c = mService.getMemberByEmail(c_email);
		int c_num = c.getC_num();
		List<Pet> pL = pService.selectByC_Num(c_num);
		
		m.addAttribute("c", c);
		m.addAttribute("pL", pL);
		
		return "admin/memberView";
	}
	
	@RequestMapping("/addMemberForm")
	public String addMemberForm() {
		return "admin/addMemberForm";
	}
	
	@RequestMapping(value = "/addMember", method = RequestMethod.POST)
	public String addMember(Customer c) {
		boolean rst = mService.joinMember(c);
		if(rst) {
			System.out.println("true");
		} else {
			System.out.println("false");
		}
		return "redirect:/admin/memberList";
	}
	
	
	///////////////////////////////////////////////////////////////////////////////// 펫
	
	@RequestMapping("/addPetForm")
	public String addPetForm(int c_num, Model m) {
		m.addAttribute("c_num", c_num);
		return "admin/addPetForm";
	}
	
	@RequestMapping(value = "/addPet", method = RequestMethod.POST)
	public String addPet(Pet p) {
		Customer c = mService.getMemberByC_num(p.getC_num());
		String email = c.getC_email();
		boolean rst = pService.insertPet(p);
		if(rst) {
			System.out.println("true");
		} else {
			System.out.println("false");
		}
		return "redirect:/admin/memberView?c_email="+email;
	}
	
	//////////////////////////////////////////////////////////////////////////예약
	
	@RequestMapping("/resList")
	public String resList(Model m) {
		
		
		return "admin/resList";
	}
	
	@RequestMapping("/resForm")
	public String resForm() {
		return "admin/resForm";
	}
	
	@RequestMapping(value = "/resPetHotel", method = RequestMethod.POST)
	public String resPetHotel() {
		return "admin/resList";
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
	public String name(PetHotel ph, Model m, MultipartHttpServletRequest mtfRequest){
        List<MultipartFile> files = mtfRequest.getFiles("file");
//        String src = mtfRequest.getParameter("src");
//        System.out.println("src value : " + src);
//        System.out.println(fileList.get(0));
//        for (MultipartFile mf : fileList) {
//            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
//            long fileSize = mf.getSize(); // 파일 사이즈
//
//            System.out.println("originFileName : " + originFileName);
//            System.out.println("fileSize : " + fileSize);
//        }
		boolean rst = phService.addPetHotel(ph,files);
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
	public String viewPetHotel(int ph_num, Model model) {
//		PetHotel ph = phService.getPetHotelbyNum(ph_num);
//		model.addAttribute("ph", ph);
		System.out.println(phService.getPetHotelbyNum(ph_num));
		List<String> filesName = phService.getFileList(ph_num);
		for (int i=0; i<filesName.size(); i++) {
			String str = filesName.get(i);
			System.out.println(str);
		}
		model.addAttribute("pethotel", phService.getPetHotelbyNum(ph_num));
		model.addAttribute("filesName",filesName);
		return "admin/viewPetHotel";
	}

	
	@RequestMapping("/petHotelView")
	public String showPetHotelView(Model model, @RequestParam("ph_num") int ph_num) {
		System.out.println(phService.getPetHotelbyNum(ph_num));
		model.addAttribute("pethotel", phService.getPetHotelbyNum(ph_num));
		return "hotel/petHotelView";
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

package com.what.carezoo.admin.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonParser;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.what.carezoo.hotel.service.DongbanHotelService;
import com.what.carezoo.hotel.service.PetHotelReservationService;
import com.what.carezoo.hotel.service.PetHotelService;
import com.what.carezoo.member.service.MemberService;
import com.what.carezoo.model.Customer;
import com.what.carezoo.model.Pet;
import com.what.carezoo.model.PetHotel;
import com.what.carezoo.model.PetHotelReservation;
import com.what.carezoo.pet.service.PetService;
import com.what.carezoo.sitter.service.SitterService;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasAuthority('ADMIN')")
public class AdminController {

	@Autowired
	private PetHotelService phService;

	@Autowired
	private DongbanHotelService dhService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private PetService pService;
	
	@Autowired
	private PetHotelReservationService phrService;
	
	

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
	
//	@RequestMapping(value = "/addMember", method = RequestMethod.POST)
//	public String addMember(Customer c) {
//		boolean rst = mService.joinMember(c);
//		if(rst) {
//			System.out.println("true");
//		} else {
//			System.out.println("false");
//		}
//		return "redirect:/admin/memberList";
//	}
//	
	
	///////////////////////////////////////////////////////////////////////////////// 펫
	
	@RequestMapping("/addPetForm")
	public String addPetForm(int c_num, Model m) {
		m.addAttribute("c_num", c_num);
		return "admin/addPetForm";
	}
	
//	@RequestMapping(value = "/addPet", method = RequestMethod.POST)
//	public String addPet(Pet p) {
//		Customer c = mService.getMemberByC_num(p.getC_num());
//		String email = c.getC_email();
//		boolean rst = pService.insertPet(p);
//		if(rst) {
//			System.out.println("true");
//		} else {
//			System.out.println("false");
//		}
//		return "redirect:/admin/memberView?c_email="+email;
//	}
//	
	@ResponseBody
	@RequestMapping("/petchk")
	public Map<String, Object> petchk(int c_num) {
		Map<String, Object> rst = new HashMap<String, Object>();
		List<Pet> pL = pService.selectByC_Num(c_num);
		rst.put("pL", pL);
		return rst;
	}
	
	//////////////////////////////////////////////////////////////////////////예약
	
	@ResponseBody
	@RequestMapping("/phchk")
	public Map<String, Object> getPh_Name(int ph_num) {
		Map<String, Object> rst = new HashMap<String, Object>();
		PetHotel ph = phService.getPetHotelbyNum(ph_num);
		rst.put("ph_name", ph.getPh_name());
		return rst;
	}
	
	
	@RequestMapping("/resPetHotelList")
	public String resList(Model m) {
		List<PetHotelReservation> phR = phService.getAllPetHotelRes();
		
		m.addAttribute("phR", phR);
		
		return "admin/resPetHotelList";
	}
	
	@RequestMapping("/resPetHotelForm")
	public String resPetHotelForm(Model m) {
		List<Customer> cL = mService.selectAll();
		List<PetHotel> phL = phService.getAllPetHotel();
		
		m.addAttribute("cL", cL);
		m.addAttribute("phL", phL);
		return "admin/resPetHotelForm";
	}
	
	@RequestMapping(value = "/resPetHotel", method = RequestMethod.POST)
	@ResponseBody
	public boolean resPetHotel(String str, HttpServletRequest req) {
		List<PetHotelReservation> phR = new ArrayList<PetHotelReservation>();
		System.out.println("str -----------"+str);
		JSONArray jArray = new JSONArray(str);
		System.out.println(jArray);
		for (int i = 0; i < jArray.length(); i++) {
			PetHotelReservation r = new PetHotelReservation();
			JSONObject jo = jArray.getJSONObject(i);
			r.setC_num(jo.getInt("c_num"));
			r.setP_num(jo.getInt("p_num"));
			r.setPh_num(jo.getInt("ph_num"));
			r.setPhr_chkin(jo.getString("phr_chkin"));
			r.setPhr_chkout(jo.getString("phr_chkout"));
			System.out.println(r);
			phR.add(r);
		}
		
//		for (PetHotelReservation r : phR) {
//			boolean result = rst.add(phrService.addPetHotelRes(r));
//			if(result) {
//				
//			}
//		}
//		
//		
//		if (!rst.contains(false)) {
//			return true;
//		}
		
		if(phR.size()>0) {
			return true;
		}
		return false;
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

package com.what.carezoo.member.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.what.carezoo.hotel.service.PetHotelReservationService;
import com.what.carezoo.hotel.service.PetHotelService;
import com.what.carezoo.member.service.MemberService;
import com.what.carezoo.model.Customer;
import com.what.carezoo.model.HomeSitter;
import com.what.carezoo.model.HomeSitterReservation;
import com.what.carezoo.model.Pet;
import com.what.carezoo.model.PetHotel;
import com.what.carezoo.model.PetHotelReservation;
import com.what.carezoo.model.VisitSitter;
import com.what.carezoo.model.VisitSitterReservation;
import com.what.carezoo.pet.service.PetService;
import com.what.carezoo.sitter.service.HomeSitterReservationService;
import com.what.carezoo.sitter.service.HomeSitterService;
import com.what.carezoo.sitter.service.SitterService;
import com.what.carezoo.sitter.service.VisitSitterReservationService;
import com.what.carezoo.sitter.service.VisitSitterService;
@RequestMapping("/member")
@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SitterService sService;
	
	@Autowired
	private HomeSitterReservationService hsrService;
	
	@Autowired
	private VisitSitterReservationService vsrService;
	
	@Autowired
	private PetHotelReservationService phrService;
	
	@Autowired
	private HomeSitterService hsService;
	
	@Autowired
	private VisitSitterService vsService;
	
	@Autowired
	private PetHotelService phService;
	
	@Autowired
	private PetService pService;
	
//	private 
	//로그인
	@RequestMapping(value="/loginForm")
	public String loginForm() {
		return "loginForm";
	}
	

	//회원가입 폼
	@RequestMapping(value="/joinForm", method=RequestMethod.GET)
	public String joinForm() {
		return "joinForm";
	}
	
	//회원가입
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(Customer customer, Model m) {
		boolean rst = memberService.joinMember(customer);
		if(rst) {
			m.addAttribute("msg", "회원가입이 완료되었습니다! 로그인을 해 주세요:)");
			return "main";
		} else {
			return "joinForm";
		}

}
	//아이디 유효성 검사
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> idCheck(String c_email) {
		System.out.println(c_email);
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		count = memberService.userIdCheck(c_email);
		System.out.println(count);
		map.put("cnt", count);
		return map;
	}

	//메인
	@RequestMapping(value="/mainForm", method=RequestMethod.GET)
	public String mainForm() {
		return "main";
	}
	//메인_로그인
	@RequestMapping(value="/mainLoginForm", method=RequestMethod.GET)
	public String mainLoginForm() {
		return "mainLogin";
	}
	
	//마이페이지
	@RequestMapping(value="/myPage",method=RequestMethod.GET)
	@PreAuthorize("hasAnyAuthority({'CUSTOMER','ADMIN','VISIT', 'HOME'} )")
	public String myPageForm() {
		return "my&customer/userInfo";
	}
	
	//예약현황페이지
	@RequestMapping(value="/myReservation",method=RequestMethod.GET)
	@PreAuthorize("hasAnyAuthority({'CUSTOMER','ADMIN','VISIT', 'HOME'} )")
	public String myReservation() {
		return "my&customer/myReservation";
	}
	
	//펫정보 페이지
	@RequestMapping("/myPet")
	public String myPet() {
		return "my&customer/petInfo";
	}
	
	@RequestMapping("/noAuth")
	public String noAuth() {
		return "noAuth";
	}
	
	//예약 가져오기
	@ResponseBody
	@RequestMapping(value="/myReservationCustomer",method=RequestMethod.GET)
	public Map<String, Object> myReservation(int c_num ) {
		Map<String, Object> rst = new HashMap<String, Object>();
		List<HomeSitterReservation> hsrList = hsrService.getHomeSitterResByCnum(c_num);
		List<VisitSitterReservation> vsrList = vsrService.getVisitSitterResByCnum(c_num);
		List<PetHotelReservation> phrList = phrService.getPetHotelResByCnum(c_num);

		
		if(hsrList.size()>0) {
			List<HomeSitter> hs = new ArrayList<HomeSitter>();
			for (HomeSitterReservation hsr : hsrList) {
				HomeSitter h = hsService.getHomeSitterByNum(hsr.getHs_num());
				hs.add(h);
			}
			rst.put("hsrList",hsrList);			
			rst.put("hsInfo",hs);			
		}
		
		if(vsrList.size()>0) {
			List<VisitSitter> vs = new ArrayList<VisitSitter>();
			for (VisitSitterReservation vsr : vsrList) {
				VisitSitter v = vsService.getVisitSitterByNum(vsr.getVs_num());
				vs.add(v);
			}
			rst.put("vsrList",vsrList);		
			rst.put("vsInfo",vs);	
		}
		
		if(phrList.size()>0) {
			List<PetHotel> ph = new ArrayList<PetHotel>();
			List<Pet> pet = new ArrayList<Pet>();
			for (PetHotelReservation phr : phrList) {
				PetHotel p = phService.getPetHotelbyNum(phr.getPh_num());
				Pet pp = pService.selectPet(phr.getP_num());
				ph.add(p);
				pet.add(pp);
			}
			rst.put("phrList",phrList);
			rst.put("phInfo",ph);
			rst.put("pet", pet);
		}

//		System.out.println(rst);
	
		return rst;
	}
	
	@RequestMapping("/qna")
	public String qnaForm() {
		return "my&customer/qnaForm";	
	}
	
	
	@RequestMapping("/modifyUserInfo")
	public String modifyUserInfo() {
		return "my&customer/checkUser";	
	}

}

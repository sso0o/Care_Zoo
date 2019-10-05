package com.what.carezoo.member.controller;



import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.what.carezoo.hotel.service.PetHotelReservationService;
import com.what.carezoo.hotel.service.PetHotelService;
import com.what.carezoo.member.service.MemberMailSendService;
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
	
	private static final String FILE_PATH = "c:/temp/";
	
	@Autowired
	private MemberMailSendService mailsender;
	
	@Autowired
	private MemberService memberService;
	
	
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
		return "joinFormMain";
	}
	
	//고객 회원가입
	@RequestMapping("/joinCustomer")
	public String joinFormCus() {
		return "joinForm_customer";
	}
	
	
	
	//가정시터 회원가입
	@RequestMapping("/joinHome")
	public String joinFormHome() {
		return "joinForm_homeSitter";
	}
	
	//홈시터 회원가입
	@RequestMapping("/joinVisit")
	public String joinFormVisit() {
		return "joinForm_visitSitter";
	}
	
	//회원가입
//	@RequestMapping(value="/join", method=RequestMethod.POST)
//	public String join(Customer customer, Model m) {
//			//회원가입 메서드
//		boolean rst = memberService.joinMember(customer);
//		if(rst) {
//			m.addAttribute("msg", "회원가입이 완료되었습니다! 로그인을 해 주세요:)");
//			return "main";
//		} else {
//			return "joinForm";
//		}
//	}
	//이메일 인증 보내기 메서드
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(Customer customer, Model m,HttpServletRequest request) {
		//회원가입 메서드
		boolean result = memberService.joinMember(customer);
		if(result) {					
			//인증메일 보내기 메서드 		
			mailsender.mailSendWithMemberKey(customer.getC_email(),customer.getC_name(), request);
			m.addAttribute("msg", "인증 메일이 전송 되었습니다. 확인후 로그인 해주세요 :)");	
			return "main";
		} 
		return "joinForm";
	}
	// e-mail 인증 컨트롤러
	@RequestMapping(value = "/key_alter", method = RequestMethod.GET)
	public String key_alterConfirm(Customer customer, Model m
			, String c_email, String c_email_key
			) {
		System.out.println("이거 메일 인증 커느롤러"+mailsender.alter_userKey_service(customer.getC_email(), customer.getC_email_key())); // mailsender의 경우 @Autowired
		
		if(mailsender.alter_userKey_service(customer.getC_email(), customer.getC_email_key())>0) {
			m.addAttribute("msg", "회원가입이 완료되었습니다! 로그인을 해 주세요:)");
			m.addAttribute("url", "loginForm");
//		return "성공페이지로 보내기";
			return "result";
		} 
		return "main";
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
	
	//마이페이지()
	@RequestMapping(value="/myPage",method=RequestMethod.GET)
	@PreAuthorize("hasAnyAuthority({'CUSTOMER','ADMIN','VISIT', 'HOME'} )")
	public String myPageForm(HttpSession session) {
		String type = (String) session.getAttribute("user_numtype");
		if(type.equals("vs_num")) {
			return "sitter/visitInfo";
		} else if(type.equals("hs_num")) {
			return "sitter/homeInfo";
		} else if(type.equals("c_num")){
			return "my&customer/userInfo";			
		}
		return "main";
	}



	//예약현황페이지
	@RequestMapping(value="/myReservation",method=RequestMethod.GET)
	@PreAuthorize("hasAnyAuthority({'CUSTOMER','ADMIN','VISIT', 'HOME'} )")
	public String myReservation() {
		return "my&customer/myReservation_cus";
	}
	
	//펫정보 페이지
	@RequestMapping("/myPet")
	public String myPet(int user_num, Model m) {
		Customer c = memberService.getMemberByC_num(user_num);
		List<Pet> pL = pService.selectByC_Num(c.getC_num());
		m.addAttribute("c", c);
		m.addAttribute("pL", pL);

		return "my&customer/petInfo";
	}
	
	//펫정보 가져오기
	@ResponseBody
	@RequestMapping("/getPetInfo")
	public Map<String, Object> getPetInfo(int p_num) {
		Map<String, Object> rst = new HashMap<String, Object>();
		rst.put("petInfo",pService.selectPet(p_num));
		return rst;
	}
	
	@RequestMapping("/addPet")
	public String addPetForm() {
		return "my&customer/addPetForm";
	}
	
	@RequestMapping("/noAuth")
	public String noAuth() {
		return "noAuth";
	}
	
	//회원정보 가져오기(ajax)
	@ResponseBody
	@RequestMapping("/getCustomerInfo")
	public Map<String, Object> getCustomerInfo(int user_num) {
		System.out.println("여기오니이이이ㅣ이ㅣㅣㅣㅇ");
		Map<String, Object> rst = new HashMap<String, Object>();
		rst.put("customerInfo", memberService.getMemberByC_num(user_num));
		return rst;
	}
	
	//예약 가져오기
	@ResponseBody
	@RequestMapping(value="/myReservationCustomer",method=RequestMethod.GET)
	public Map<String, Object> myReservation(int c_num ) {
		Map<String, Object> rst = new HashMap<String, Object>();
		List<HomeSitterReservation> hsrList = hsrService.getHomeSitterResByCnum(c_num);
		List<VisitSitterReservation> vsrList = vsrService.getVisitSitterResByCnum(c_num);
		List<PetHotelReservation> phrList = phrService.getPetHotelResByCnum(c_num);
		System.out.println(phrList);
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
				System.out.println(pp);
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
	
	// 수정 전회원 확인(비밀번호 확인)
	@RequestMapping(value = "/userCheck", method=RequestMethod.POST)
	public String userCheck(int num, String pw, Model m, @RequestParam(defaultValue = "0") int p_num) {
		Customer c = memberService.getMemberByC_num(num);
		String url = "";
		if(c.getC_pass().equals(pw)) {
			m.addAttribute("customer", c);
			if(p_num == 0) {
				url= "my&customer/modifyUserinfo";				
			} else {
				m.addAttribute("pet", pService.selectPet(p_num));
				url = "my&customer/modifyPetinfo";
			}
		} else { 
			m.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			url =  "my&customer/checkUser";
		}
		
		return url;
	}
	
	//회원정보 수정
	@RequestMapping(value = "/modify", method=RequestMethod.POST)
	public String modifyUser(Customer c, Model m, MultipartHttpServletRequest mtfRequest) {
		MultipartFile file = mtfRequest.getFile("file");
		System.out.println("file : " + file);
		System.out.println("c : "+c);
		boolean rst = memberService.modifyUser(c,file);
		if(rst) {
			m.addAttribute("msg", "회원정보를 수정하였습니다");
			return "my&customer/userInfo";
		} else {
			m.addAttribute("customer", c);
			m.addAttribute("msg", "회원정보 수정 실패!");
			return "my&customer/modifyUserinfo";
		}
			
	}
	
	@ResponseBody
	@RequestMapping(value = "/getImg", method=RequestMethod.GET)
	public Map<String, Object> getImg(int user_num) {
		System.out.println("넘어오나");
		System.out.println(user_num);
		Map<String, Object> rst = new HashMap<String, Object>();
		String filename = memberService.getImage(user_num);
		rst.put("filename", filename);
		System.out.println("rst : "+rst);
		return rst;
	}
	
	@ResponseBody
	@RequestMapping(value = "/image")
	public byte[] getImg(String fileName) {
		File file = new File(FILE_PATH + fileName);
		
		InputStream in = null;
		try {
			in = new FileInputStream(file);
			// 스트림을 byte[] 형태로 만들기 위해서 라이브러리 추가(CommonIO)
			return IOUtils.toByteArray(in);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(in != null) in.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	

}

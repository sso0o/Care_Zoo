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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.print.DocFlavor.STRING;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
import com.what.carezoo.model.Pet_Detail;
import com.what.carezoo.model.VisitSitter;
import com.what.carezoo.model.VisitSitterReservation;
import com.what.carezoo.pet.service.PetService;
import com.what.carezoo.pet.service.Pet_DetailService;
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
	private Pet_DetailService pdService;
	
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
	
	//방문시터 회원가입
	@RequestMapping("/joinVisit")
	public String joinFormVisit() {
		return "joinForm_visitSitter";
	}
	
	

	
	
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
	@RequestMapping(value="/idCheck2", method=RequestMethod.POST)
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
	@PreAuthorize("hasAnyAuthority({'ROLE_CUSTOMER','ROLE_ADMIN','ROLE_VISIT', 'ROLE_HOME'} )")
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
	@PreAuthorize("hasAnyAuthority({'ROLE_CUSTOMER','ROLE_ADMIN','ROLE_VISIT', 'ROLE_HOME'} )")
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
		List<Map<String, Object>> hsrList = hsrService.getHSRInfo(c_num);
		List<Map<String, Object>> vsrList = vsrService.getVSRInfo(c_num);
		List<Map<String, Object>> phrList = phrService.getPHRInfo(c_num);
		
		rst.put("hsrList", hsrList);
		rst.put("vsrList", vsrList);
		rst.put("phrList", phrList);
	
		return rst;
	}
	
	@RequestMapping("/getModalHS")
	@ResponseBody
	public Map<String, Object> getModalHS(int num) {
		return memberService.getModalHS(num);
	}
	
	@RequestMapping("/getModalVS")
	@ResponseBody
	public Map<String, Object> getModalVS(int num) {
		return memberService.getModalVS(num);
	}
	
	@RequestMapping("/getModalPH")
	@ResponseBody
	public Map<String, Object> getModalPH(int num) {
		return memberService.getModalPH(num);
	}
	
	
	//홈시터예약 취소
	@RequestMapping("/cancelHSR")
	public String cancelHSR(int num, Model m,HttpServletRequest request) {
		HomeSitterReservation hsr = hsrService.getHomeSitterResByHsrnum(num);
		HomeSitter hs = hsService.getHomeSitterByNum(hsr.getHs_num());
		Customer c = memberService.getMemberByC_num(hsr.getC_num());
		if(memberService.cancelHSR(num) && mailsender.mailSendCancelHSR(hsr, hs, c, request)) {
			m.addAttribute("msg", "예약이 취소되었습니다.");
		} else {
			m.addAttribute("msg", "취소 실패");
		}
		return "my&customer/myReservation_cus";
		
	}

	// 방문시터예약 취소
	@RequestMapping("/cancelVSR")
	public String cancelVSR(int num, Model m, HttpServletRequest request) {
		VisitSitterReservation vsr = vsrService.getVisitSitterResByVsrnum(num);
		Customer c = memberService.getMemberByC_num(vsr.getC_num());
		VisitSitter vs = null;
		if(vsr.getVs_num() >0) {
			vs = vsService.getVisitSitterByNum(vsr.getVs_num());
			
		}
		
		if(Integer.parseInt(vsr.getVsr_day()) == 7) {
			if (memberService.cancelVSR7(num) && mailsender.mailSendCancelVSR(vsr, vs, c, request)) {
				m.addAttribute("msg", "예약이 취소되었습니다.");
				
			} else {
				m.addAttribute("msg", "취소 실패");
			}
		} else {
			if (memberService.cancelVSR(vsr.getC_num(), vsr.getVsr_count()) && mailsender.mailSendCancelVSR(vsr, vs, c, request)) {
				m.addAttribute("msg", "예약이 취소되었습니다.");
				
			} else {
				m.addAttribute("msg", "취소 실패");
			}
		}
		
		return "my&customer/myReservation_cus";
	}

	// 펫호텔예약 취소
	@RequestMapping("/cancelPHR")
	public String cancelPHR(int num, Model m,HttpServletRequest request) {
		PetHotelReservation phr = phrService.getPetHotelResByNum(num);
		if (memberService.cancelPHR(num)) {
			m.addAttribute("msg", "예약이 취소되었습니다. 환불은 7일내에 처리됩니다.");
			PetHotel ph = phService.getPetHotelbyNum(phr.getPh_num());
			System.out.println(ph);
			Customer cus = memberService.getMemberByC_num(phr.getC_num());
			mailsender.mailSendCancelPHR(ph,phr,cus,request);
			System.out.println("=============이메일 성공");
		} else {
			m.addAttribute("msg", "취소 실패");
		}
		
		return "my&customer/myReservation_cus";
	}
	
	//결제
	@RequestMapping("/getPayInfo")
	@ResponseBody
	public Map<String, Object> payInfo(int num, String type) {
		Map<String, Object> rst = new HashMap<String, Object>();
		if(type.equals("hsr_num")) {
			rst.put("rst", memberService.getPayInfoHSR(num));
			rst.put("name", "홈시터 예약");
		} else {
			rst.put("rst", memberService.getPayInfoVSR(num));
			rst.put("name", "방문시터 예약");
		}
		return rst;
	}
	
	@RequestMapping("/updateStatus")
	@ResponseBody
	public boolean updateStatus(int num, String type) {
		if(type.equals("hsr_num")) {
			return memberService.updateStatusHSR(num);
		} else if(type.equals("vsr_num")) {
			return memberService.updateStatusVSR(num);
		}else {
			return false;
		}
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
	

	//비밀번호찾기
	@RequestMapping(value="searchPw",method=RequestMethod.GET)
	public String searchPwForm() {
		return "searchPw";
	}

	
	//메인에 시터리뷰, 호텔리뷰 가져오기
	@RequestMapping("/getMainReview")
	@ResponseBody
	public Map<String, Object> getMainSitterReview() {
		Map<String, Object> rst = new HashMap<String, Object>();
		rst.put("sitterR", memberService.getMainSitterReview());
		rst.put("pethotelR", memberService.getMainPethotelReview());
		return rst;
	}


	
	//이메일 유효성 검사
	@RequestMapping(value="emailCheck", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> emailCheck(String email,String user) {
		System.out.println("email: "+email);
		System.out.println("user: "+user);
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		if (user.equals("customer")) {
			count = memberService.userIdCheck(email);
			System.out.println(count);
		} else if (user.equals("visit")) {
			count = vsService.userIdCheck(email);
			System.out.println(count);
		} else if (user.equals("home")) {
			count = hsService.userIdCheck(email);
			System.out.println(count);
		}
		map.put("cnt", count);
		return map;
	}
	
	@RequestMapping(value="/find_pass", method = RequestMethod.POST)
    public String find_pass(String email,String user,Model model,HttpServletRequest request) {
		System.out.println("email: "+email);
		System.out.println("user: "+user);
		
		if(user.equals("customer")) {
			if(memberService.userIdCheck(email)>0) {
				//email로 비번 보내기
				mailsender.pass(email,memberService.getMemberByEmail(email).getC_name(), user);

				return "passOk";
			}
		}else if(user.equals("visit")) {
			if(vsService.userIdCheck(email)>0) {
				return "passOk";
			}
		}else if(user.equals("home")) {
			if(hsService.userIdCheck(email)>0) {
				return "passOk";
			}
		}
		model.addAttribute("msg", "다시 시도해주세요.");
			return "searchPw";
        
    }
	
	//비밀번호 찾기 완료
	@RequestMapping(value="passOk",method=RequestMethod.GET)
	public String passOkForm() {
		return "passOk";
		
	}
	
	//email찾기
	@RequestMapping(value="searchEmail",method=RequestMethod.GET)
	public String searchEmailForm() {
		return "searchEmail";
	}
	
	@RequestMapping(value="find_email", method=RequestMethod.POST)
	public String find_email(String user,String name,String phone,String phone1,String phone2,Model model) {
		String number = phone+phone1+phone2;
		System.out.println(number);
		System.out.println(user);
		System.out.println(name);
		if(user.equals("customer")) {
			if(memberService.findC_emailCount(name, number)>0) {
				model.addAttribute("email", memberService.findC_email(name, number));
				return "emailOk";
			}
			
		}else if(user.equals("visit")) {
			if(vsService.findVs_emailCount(name, number)>0) {
				model.addAttribute("email", vsService.findVs_email(name, number));
				return "emailOk";
			}
			
		}else if(user.equals("home")) {
			if(hsService.findHs_emailCount(name, number)>0) {
				model.addAttribute("email", hsService.findHs_email(name, number));
				return "emailOk";
			}
			
		}
			model.addAttribute("msg", "가입하지 않은 고객입니다.");
			return "searchEmail";
	}
	
	//탈퇴 전 회원  확인 폼
	@RequestMapping(value = "/goodByeCheckUser", method = RequestMethod.GET)
	public String goodbByeCheckUserForm() {
		return "goodByeCheckUser";
	}
	
	@RequestMapping(value="goodBye", method=RequestMethod.GET)
	public String goodByeForm() {
		return "goodBye";
	}
	
	// 탈퇴 전회원 확인(비밀번호 확인)
	@RequestMapping(value = "/goodByeCheckUser", method = RequestMethod.POST)
	public String goodByeCheckUser(HttpSession session, int num, String pw, Model m, @RequestParam(defaultValue = "0") int p_num) {
		String type = (String)session.getAttribute("user_numtype");
		String url = "";
		
		if(type.equals("c_num")) {
			Customer customer = memberService.getMemberByC_num(num);
			if(customer.getC_pass().equals(pw)) {
				m.addAttribute("customer", customer);
				m.addAttribute("msg", "정말로 탈퇴하시겠습니까?");
				//멤버삭제
				memberService.deleteCustomer(num);
				//강아지삭제
				if(pService.countPetByC_num(num)>0) {
					pService.deletePetByC_num(num);
				}
				
				//펫디테일 삭제
				if(pdService.countPetByC_num(num)>0) {
					pdService.deleteByC_num(num);
				}
				
				//방문예약 삭제
				if(vsrService.countC_num(num)>0) {
					vsrService.deleteByC_num(num);
				}
				
				//가정예약 삭제
				if(hsrService.countC_num(num)>0) {
					hsrService.deleteByC_num(num);
				}
				
				//펫호텔 예약 삭제
				if(phrService.countC_num(num)>0) {
					phrService.deleteByC_num(num);
				}
				
				url = "goodBye";
				
			}else {
				m.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
				url = "goodByeCheckUser";
				
			}
		}
		System.out.println(url);
		m.addAttribute("url", url);
		return "result";
	}
	
	//회원가입(kakao)
	@RequestMapping(value="/join2", method=RequestMethod.POST)
	public String join2(Customer customer, Model m) {
		//회원가입 메서드
		boolean result = memberService.joinMember2(customer);
		if(result) {					
			m.addAttribute("c_name", customer.getC_name());

			return "mainLogin";
		} 
		return "joinForm";
	}
}

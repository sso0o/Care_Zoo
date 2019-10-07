package com.what.carezoo.sitter.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.what.carezoo.model.HomeSitterComment;
import com.what.carezoo.model.HomeSitterList;
import com.what.carezoo.model.HomeSitterReservation;
import com.what.carezoo.sitter.service.HomeSitterListService;
import com.what.carezoo.sitter.service.HomeSitterMailSendService;
import com.what.carezoo.sitter.service.HomeSitterReservationService;
import com.what.carezoo.sitter.service.HomeSitterService;

@RequestMapping("home")
@Controller
public class HomeSitterController {
	private static final String FILE_PATH = "c://temp/";
	@Autowired
	private HomeSitterService hsService;
	@Autowired
	private HomeSitterListService hslService;
	@Autowired
	private HomeSitterReservationService hsResService;
	@Autowired
	private HomeSitterMailSendService mailsender;

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////가정시터 회원가입	
//	//이메일 인증 보내기 메서드
//	@RequestMapping(value = "/join", method = RequestMethod.POST)
//	public String joinHomeSitter(
//			@RequestParam Map<String, Object> params,
//			Model model, HttpServletRequest request, String hsl_service_type, String hsl_size, String hsl_pet_age
//			) {
//		List<Object> hsd_disabledate_list = Arrays.asList(params.get("hsd_disabledate"));
////		List<String> hsl_service_type_list = Arrays.asList(hsl_service_type.split(","));
////		List<String> hsl_size_list = Arrays.asList(hsl_size.split(","));
////		List<String> hsl_pet_age_list = Arrays.asList(hsl_pet_age.split(","));
////		params.put("hsd_disabledate", hsd_disabledate_list);
//		params.put("hsl_service_type", hsl_service_type);
//		params.put("hsl_size", hsl_size);
//		params.put("hsl_pet_age", hsl_pet_age);
//		 System.out.println("파람"+params);
////		 System.out.println(hsd_disabledate_list);
////		 System.out.println(hsl_service_type_list);
////		 System.out.println(hsl_size_list);
////		 System.out.println(hsl_pet_age_list);
//		 //우선 회원가입만 먼저 하고 나중에 넣어야지
//		 //회원가입 메서드 
//		boolean hsRst = hsService.joinHomeSitter(params);
//		boolean hslRst = hslService.writeHomeSitterList(params);
//		boolean hslDisdate = hslService.writeDisableDates(hsd_disabledate_list);
////		System.out.println("hsRst : "+ hsRst+"hslRst"+hslRst);
//		if(hsRst && hslRst && hslDisdate ) {
//			System.out.println("글등록 성공!!");
////			mailsender.mailSendWithMemberKey((String)params.get("hs_email"),(String)params.get("hs_email_key"), request);
////			model.addAttribute("msg", "인증 메일이 전송 되었습니다. 확인 후 로그인 해주세요 :)");			
//			return "redirect:main";
//		} else {
////			model.addAttribute("msg", "무슨문제일까요 다시 시도해 주세요.)");	
//			return "redirect:joinForm";
//		}
//	}
	@RequestMapping("/noAuth")
	public String noAuth() {
		return "noAuth";
	}
	
	//이메일 인증 보내기 메서드
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinHomeSitter(@RequestParam Map<String, Object> params,Model model, HttpServletRequest request) {

		 System.out.println("파람"+params);

		 //회원가입 메서드 
		boolean hsRst = hsService.joinHomeSitter(params);
		if(hsRst) {
			System.out.println("글등록 성공!!");
			mailsender.mailSendWithMemberKey((String)params.get("hs_email"),(String)params.get("hs_email_key"), request);
			model.addAttribute("msg", "인증 메일이 전송 되었습니다. 확인 후 로그인 해주세요:)");	
			model.addAttribute("url", "${contextPath}/home/main");
		} else {
			model.addAttribute("msg", "무슨문제일까요 다시 시도해 주세요.)");
			model.addAttribute("url", "${contextPath}/member/joinHome");
		}
		return "redirect:result";
	}
	// e-mail 인증 컨트롤러
	@RequestMapping(value = "/key_alter", method = RequestMethod.GET)
	public String key_alterConfirm(Model model, String hs_email, String hs_email_key) {
		if(mailsender.alter_userKey_service(hs_email, hs_email_key)>0) {
			model.addAttribute("msg", "홈시터 회원가입이 완료되었습니다. 게시글 등록을 위해 회원정보를 업데이트 해주세요");
			model.addAttribute("url", "${contextPath}/home/loginForm");
		}else {
			model.addAttribute("msg", "회원가입이 진행중입니다. 확인 후 이용바랍니다.");
			model.addAttribute("url", "${contextPath}/member/main");
		}
		return "redirect:result";
	}

	//아이디 유효성 검사
	@ResponseBody
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public Map<Object, Object> idCheck(String hs_email) {
		System.out.println(hs_email);
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		count = hsService.userIdCheck(hs_email);
		System.out.println(count);
		map.put("cnt", count);
		return map;
	}

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////가정시터 메인 보여주기
	// 가정시터목록보여주는 메인 띄우기
	@RequestMapping("/main")
	public String enterHomeSitterMain(Model model) {
//		model.addAttribute("hslList", hslService.getallHsl());
		List<Map<String, Object>> hslList = hslService.getHsl();
//		for(int i=0;i<hslList.size();i++) {
//			System.out.println("GET"+i+"="+hslList.get(i));
//		}
		model.addAttribute("hslList",hslList);
		return "sitter/home/homeSitterList";
	}
	
	//홈시터 정보 가져오기
	@RequestMapping("/homeSitter")
	@ResponseBody
	public Map<String, Object> getHomeSitter(int hs_num){
		Map<String, Object> rst = new HashMap<String, Object>();
		rst.put("hs", hsService.getHomeSitterByNum(hs_num));
		return rst;
	}

	
	
	//가정시터메인 - 검색
	@RequestMapping("/search")
	public String searchHS(Model model,@RequestParam(value="hsl_address" ,required = false) ArrayList<String> hsl_address, HomeSitterList hsl) {
		if(hsl==null) {			
			hsl = new HomeSitterList();
		}
		if(hsl_address==null) {
			hsl_address = new ArrayList<String>(); 			
		}		
		System.out.println("모델00:"+hsl_address);
		System.out.println("hsl00:"+hsl);
		System.out.println("값00"+hslService.getbySearchingHsl(hsl_address,hsl));
		model.addAttribute("hslList", hslService.getbySearchingHsl(hsl_address,hsl));
		return "sitter/home/homeSitterList";
	}
	//가정시터 목록 json 보내기
	@RequestMapping("/maain")
	public String home(Model model) {
		return "sitter/home/example";
	}
	@ResponseBody
	@RequestMapping("/searchLodagin")
	public List<HomeSitterList> homeSitterSearch(@RequestParam(value = "searchSwitch",  required = false) int switchNumber,@RequestParam(value="hsl_address" ,required = false) ArrayList<String> hsl_address,@RequestParam Map<String, Object> params, HomeSitterList hsl) {
		System.out.println("여기까지?");
		System.out.println("swichNumber=====>" + switchNumber);
		if(switchNumber ==1) {
			if(hsl==null) {			
				hsl = new HomeSitterList();
			}
			if(hsl_address==null) {
				hsl_address = new ArrayList<String>(); 			
			}		
			System.out.println("모델11:"+hsl_address);
			System.out.println("hsl11:"+hsl);
			List<HomeSitterList>  hslList = hslService.getbySearchingHsl(hsl_address,hsl);
			System.out.println("값11"+hslList);
			return hslList;
			
		}else {
			List<HomeSitterList> hslList = hslService.getHsls();
		
			return hslList;
		}
	}

	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////시터 예약 
	//홈시터 예약페이지
////	@Secured("CUSTOMER")
////	@PreAuthorsize("isAuthenticated()")
//	@RequestMapping(value = "/reserve", method = RequestMethod.POST)
//	public String reserveHomeSitter(Model model, HomeSitterReservation hsr, int hsl_num) {
//		System.out.println(hsr);
//		System.out.println(hslService.getallHsl(hsl_num));
////		model.addAttribute("hsr", hsr);
////		model.addAttribute("hsList", hslService.getallHsl(hsl_num));
//		return "sitter/home/homeSitterConfirm";
//	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/reserve", method = RequestMethod.POST)
	public String reserveHomeSitter(HttpSession session,HttpServletRequest request, Model model, int hsl_num, @RequestParam Map<String,Object> params) {
		System.out.println("예약 : " + hsl_num);
		System.out.println(params);
		session.setAttribute("params", params);
//		model.addAttribute("params", params);
//		System.out.println(hslService.getallHsl(hsl_num));
//		model.addAttribute("hsr", hsr);
//		model.addAttribute("hsList", hslService.getallHsl(hsl_num));
//		return "sitter/home/homeSitterReservation";
		return "sitter/home/homeSitterRes";
	}
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/confirm" , method = RequestMethod.POST)
	public String confirmHomeSitter(Model model, HomeSitterReservation hsr) {
		System.out.println("확인 hsr : " + hsr);
		String url;
		String msg;
		if(!hsResService.writeHomeSitterRes(hsr)) {
			System.out.println("예약 실패");
			msg="예약 실패! 다시 시도해 주세요ㅜ^ㅠ";
			url = "sitter/home/main";
		}else {
			msg="예약 성공! 마이페이지에서 확인 가능합니다 :)";
			url="my&customer/myReservation_cus";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return url;
	}
	
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////게시글 등록
	// 가정시터 게시글 등록 뷰 보여주기
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeHsl(Model model) {
		return "sitter/home/joinForm_homeSitterDetail";
	}
//	// 가정시터 게시글 등록 로직수행
//	@RequestMapping(value = "/write", method = RequestMethod.POST)
//	public String writeHsl(HomeSitterList hsl,Model model,MultipartHttpServletRequest mtfRequest) {
//		System.out.println("hsl : "+hsl);
//		List<MultipartFile> files = mtfRequest.getFiles("file");
//		System.out.println("files = "+files);
//		boolean rst = hslService.addHsl(hsl, files);
//		if(rst) {
//			model.addAttribute("hsl_num", hsl.getHsl_num());
//			return "sitter/home/joinForm_homeSitterDisableDates";
//		}else {
//			return "redirect:/home/write";
//		}
//	}
	// 가정시터 게시글 등록 로직수행
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writeHsl(HomeSitterList hsl, Model model) {
		System.out.println("hsl : "+hsl);
		boolean rst = hslService.writeHomeSitterList(hsl);
		if(rst) {
			return "sitter/home/joinForm_homeSitterDisableDates";
		}else {
			return "redirect:/home/write";
		}
	}
//	@RequestMapping(value = "/getDisDate", method = RequestMethod.POST)
//	public String joHomeSitter(String hsd_disabledate,int hs_num,int hsl_num ,Model model ) {
//		Map<String,Object> params = new HashMap<String, Object>();
//		List<String> hsd_disabledate_list = Arrays.asList(hsd_disabledate.split(","));
//		params.put("hsd_disabledate", hsd_disabledate_list);
//		params.put("hs_num", hs_num);
//		params.put("hsl_num", hsl_num);
//		System.out.println(hsd_disabledate_list);
//		if(!hslService.writeDisableDates(params)) {
//			System.out.println("disable됨!!");
//		};
//		return "redirect:result";
//	}
//	@RequestMapping(value = "/get")
//	public String joHomeSitter() {
//		return "sitter/home/joinForm_homeSitterDisableDates";
//	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/image")
	public byte[] getImage(String fileName) {
		// 지정된 경로에서 이미지 읽어서 byte[]형태로 반환
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
	////////////////////////////////////////////////////////////////////////////////////홈시터 게시글 상세보기 페이지
	//홈시터 게시글 상세보기
//	@Secured("CUSTOMER")
	@RequestMapping("/view")
	public String enterHomeSitterView(Model model, int hsl_num) {
		model.addAttribute("hsList", hslService.getHomeSitterByHsl_Num(hsl_num));
		return "sitter/home/homeSitterView";
	}
	@RequestMapping("/getComment")
	@ResponseBody
	public List<HomeSitterComment> getAllCommentByNum(int hsl_num){
		return null;
	}
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////게시글 삭제
	
	
	
	
	
	
	
}

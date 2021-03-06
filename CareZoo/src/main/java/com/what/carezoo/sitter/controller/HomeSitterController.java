package com.what.carezoo.sitter.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.ibatis.annotations.Select;
import org.apache.tomcat.util.net.ApplicationBufferHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.what.carezoo.member.service.MemberService;
import com.what.carezoo.model.HomeSitter;
import com.what.carezoo.model.HomeSitterComment;
import com.what.carezoo.model.HomeSitterList;
import com.what.carezoo.model.HomeSitterReservation;
import com.what.carezoo.model.PetHotelReservation;
import com.what.carezoo.sitter.service.HomeSitterCommentService;
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
	private HomeSitterCommentService hscService;
	@Autowired
	private HomeSitterMailSendService mailsender;

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////가정시터 회원가입	

	@RequestMapping("/noAuth")
	public String noAuth() {
		return "noAuth";
	}
	
	//이메일 인증 보내기 메서드
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinHomeSitter(HomeSitter hs,Model model, HttpServletRequest request, MultipartHttpServletRequest mtfReq) {
		String phone = request.getParameter("phone");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String contact = phone+phone1+phone2;
		hs.setHs_contact(contact);
		 //회원가입 메서드 
		MultipartFile file = mtfReq.getFile("file");
		System.out.println("일반,petjoin,file: " + file);
		boolean rst = hsService.insertHomeSitterFile(hs, file);
//		boolean hsRst = hsService.joinHomeSitter(hs);
		if(rst) {
			System.out.println("회원가입 성공!!");
			mailsender.mailSendWithMemberKey(hs.getHs_email(),hs.getHs_name(), request);
			model.addAttribute("msg", "인증 메일이 전송 되었습니다. 확인 후 로그인 해주세요:)");	
			
		 return "main";
		} 
	return "joinForm";
	}
	// e-mail 인증 컨트롤러
	@RequestMapping(value = "/key_alter", method = RequestMethod.GET)
	public String key_alterConfirm(Model model, String hs_email, String hs_email_key) {
		System.out.println("이거 됌?"+hs_email+":"+hs_email_key);
		if(mailsender.alter_userKey_service(hs_email, hs_email_key)>0) {
			model.addAttribute("msg", "홈시터 회원가입이 완료되었습니다. 로그인 후 게시글 등록을 위해 회원정보를 업데이트 해주세요");
			model.addAttribute("url", "loginForm");			
			return "result";
		}else {
			model.addAttribute("msg", "회원가입이 진행중입니다. 확인 후 이용바랍니다.");
			model.addAttribute("url", "main");
			return "result";
		}
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
		return "sitter/home/homeSitterList";
	}
	@RequestMapping("/loginForm")
	public String loginForm(Model model) {
		return "loginForm";
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
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("hslList", hslService.getbySearchingHsl(hsl_address,hsl));
		System.out.println("param" + param.values());
		System.out.println("모델00:"+hsl_address);
		System.out.println("hsl00:"+hsl);
		System.out.println("값00"+hslService.getbySearchingHsl(hsl_address,hsl));
		model.addAttribute("hslList", hslService.getbySearchingHsl(hsl_address,hsl));
		return "sitter/home/homeSitterList";
	}
	//이미지 가져오기
	@ResponseBody
	@RequestMapping(value = "/getImg", method=RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<String> getHsImg(int hsl_num) {
//		System.out.println("hsl_num"+hsl_num);
//		System.out.println("writeIMG 가져오는거");
//		System.out.println(hsl_num);
		Map<String, Object> rst = new HashMap<String, Object>();
		List<String> filename = hslService.getFileList(hsl_num);
		rst.put("filename", filename);
//		System.out.println("filename : "+filename);
//		System.out.println("rst"+rst);
		if(filename.size() == 0) {
			filename.add("empty cup");
		}
		return filename;
	}
	@ResponseBody
	@RequestMapping("/searchLoading")
	public List<Map<String,Object>> homeSitterSearch(@RequestParam(value = "searchSwitch",  required = false) int switchNumber,
			@RequestParam(value="hs_address" ,required = false) ArrayList<String> hs_address,@RequestParam Map<String, Object> params, HomeSitterList hsl) {
		System.out.println("여기까지?");
		System.out.println("swichNumber=====>" + switchNumber);
		System.out.println(params);
		if(switchNumber ==1) {
			if(hsl==null) {			
				hsl = new HomeSitterList();
			}
			if(hs_address==null) {
				hs_address = new ArrayList<String>(); 			
			}	
			
			System.out.println("모델11:"+hs_address);
			System.out.println("hsl11:"+hsl);
			List<Map<String,Object>>  hsList = hslService.getbySearchingHsl(hs_address,hsl);
			System.out.println("값11"+hsList);
			return hsList;			
		}
		else {
			List<Map<String,Object>> hsList = hslService.getHsls();
			System.out.println("값22222"+hsList);
			System.out.println("hsList"+hsList);				
			return hsList;
		}
	}

	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////시터 예약 
	//홈시터 예약페이지
	@PreAuthorize("isAuthenticated() && hasRole('ROLE_CUSTOMER')")
	@RequestMapping(value = "/reserve", method = RequestMethod.POST)
	public String reserveHomeSitter(HttpSession session,HttpServletRequest request, Model model, int hsl_num, @RequestParam Map<String,Object> params) {
//		System.out.println("예약 : " + hsl_num);
//		System.out.println(params);
		session.setAttribute("params", params);
		return "sitter/home/homeSitterRes";
	}
	@PreAuthorize("isAuthenticated() && hasRole('ROLE_CUSTOMER')")
	@RequestMapping(value = "/confirm" , method = RequestMethod.POST)
	public String confirmHomeSitter(Model model, HomeSitterReservation hsr) {
//		System.out.println("확인 hsr : " + hsr);
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
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////게시글 등록
	// 가정시터 게시글 등록 뷰 보여주기
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeHsl(Model model, HttpSession session) {
		int hs_num = (int) session.getAttribute("user_num");
		model.addAttribute("hs", hsService.getHomeSitterByNum(hs_num));
		return "sitter/home/joinForm_homeSitterDetail";
	}
	// 가정시터 게시글 등록 로직수행
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writeHsl(HomeSitterList hsl,String hsd_disabledate,Model model,MultipartHttpServletRequest mtfRequest) {
//		System.out.println("hsd_disabledate"+hsd_disabledate);
//		System.out.println("hsl : "+hsl);
		String msg = "";
		String url = "";
		//이미지 파일 받기
		List<MultipartFile> files = mtfRequest.getFiles("file");
		System.out.println("files = "+files);
		boolean rst = hslService.addHsl(hsl, files);
		//불가능 날짜 받기
		List<String> hsd_disabledate_list = Arrays.asList(hsd_disabledate.split(","));
		boolean result = hslService.addDisDates(hsl.getHsl_num(), hsd_disabledate_list);
		if(rst&&result) {
			HomeSitter hs = new HomeSitter();
			hs.setHs_address(hsl.getHsl_address());
			hs.setHs_d_address(hsl.getHsl_d_address());
			hs.setHs_num(hsl.getHs_num());
			hsService.updateHsAddress(hs);
			model.addAttribute("hsl_num", hsl.getHsl_num());
			msg = "정상적으로 등록되었습니다.";
			url = "main";
		}else {
			msg = "문제가 발생했습니다. 다시 작성해 주세요.";
			url = "write";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "result";
	}

	////////////////////////////////////////////////////////////////////////////////////홈시터 게시글 상세보기 페이지
	//홈시터 게시글 상세보기

	@RequestMapping("/view")
	public String enterHomeSitterView(Model model, int hsl_num) {
		Map<String, Object> hsList = hslService.getHomeSitterByHsl_Num(hsl_num);
		List<String> dateStrings  = hslService.getDisableDates(hsl_num);
		List<String> files = hslService.getFileList(hsl_num);
		int hs_num = Integer.parseInt(String.valueOf(hsList.get("HS_NUM")+""));
		List<HomeSitterComment> comment = hscService.getHomesitterComment(hs_num);
		List<Map<String, Object>> hsrList = hsResService.getHomeSitterResByHSNum(hs_num);
		System.out.println(hsList);
		System.out.println("dateStrings"+dateStrings);
		System.out.println("hsimg"+files);
		System.out.println(hsrList);
		model.addAttribute("hsrList", hsrList);
		model.addAttribute("hsimg", files);
		model.addAttribute("disDates", dateStrings);
		model.addAttribute("hsList", hsList);
		model.addAttribute("comment", comment);
		return "sitter/home/homeSitterView";
	}

	@ResponseBody
	@RequestMapping(value = "/homesitterReservation")
	public List<Map<String, Object>> makePetHotelRes(@RequestParam("hs_num") int hs_num) {
		int compare = 0;
		Date phrCheckOut;
		Date today = new Date();
		List<Map<String, Object>> hsrList = hsResService.getHomeSitterResByHSNum(hs_num);
		int hsrSize = hsrList.size();
//		System.out.println(hsrList);
		return hsrList;
	}
	
	@ResponseBody
	@RequestMapping("/disabledates")
	public List<String> getDisdates (int hsl_num){
		List<String> disDates  = hslService.getDisableDates(hsl_num);
		System.out.println("disDates"+disDates); 
		return disDates;
	}
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////게시글 삭제

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
}

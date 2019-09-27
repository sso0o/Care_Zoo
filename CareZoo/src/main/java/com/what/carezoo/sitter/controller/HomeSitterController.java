package com.what.carezoo.sitter.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.what.carezoo.model.HomeSitterList;
import com.what.carezoo.sitter.service.HomeSitterListService;
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
	@RequestMapping("/join")
	public String joinHomeSitter() {
		return "sitter/home/homeSitterJoinForm";
	}
	
	//홈시터 정보 가져오기
	@RequestMapping("/homeSitter")
	@ResponseBody
	public Map<String, Object> getHomeSitter(int hs_num){
		Map<String, Object> rst = new HashMap<String, Object>();
		rst.put("hs", hsService.getHomeSitterByNum(hs_num));
		return rst;
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
	// 가정시터 검색목록 가져오기
	@RequestMapping("/search")
	public String searchHS(Model model,@RequestParam(value="hsl_address" ,required = false) ArrayList<String> hsl_address, HomeSitterList hsl) {
		if(hsl==null) {			
			hsl = new HomeSitterList();
		}
		if(hsl_address==null) {
			hsl_address = new ArrayList<String>(); 			
		}		
		System.out.println("모델:"+hsl_address);
		System.out.println("hsl:"+hsl);
		System.out.println("값"+hslService.getbySearchingHsl(hsl_address,hsl));
		model.addAttribute("hslList", hslService.getbySearchingHsl(hsl_address,hsl));
		return "sitter/home/homeSitterList";
	}
	//가정시터 목록 json 보내기
	@ResponseBody
	@RequestMapping("/homeSitterSearch")
	public List<HomeSitterList> homeSitterSearch(@RequestParam(value="hsl_address" ,required = false) ArrayList<String> hsl_address,@RequestParam Map<String, Object> params, HomeSitterList hsl) {
		if(hsl==null) {			
			hsl = new HomeSitterList();
		}
		if(hsl_address==null) {
			hsl_address = new ArrayList<String>(); 			
		}		
		System.out.println("모델:"+hsl_address);
		System.out.println("hsl:"+hsl);
		System.out.println("값"+hslService.getbySearchingHsl(hsl_address,hsl));
		List<HomeSitterList>  hslList = hslService.getbySearchingHsl(hsl_address,hsl);
		return hslList;
	}
	// 가정시터 게시글 등록 뷰 보여주기
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeHsl(Model model) {
		return "sitter/home/homeSitterPosting";
	}
	// 가정시터 게시글 등록 로직수행
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writeHsl(HomeSitterList hsl, MultipartHttpServletRequest mtfRequest) {
		System.out.println("hsl : "+hsl);
		List<MultipartFile> files = mtfRequest.getFiles("file");
		System.out.println("files = "+files);
		boolean rst = hslService.addHsl(hsl, files);
		if(rst) {
			return "redirect:/home/main";
		}else {
			return "redirect:/home/write";
		}
	}
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
	//홈시터 게시글 상세보기
//	@Secured("CUSTOMER")
	@RequestMapping("/view")
	public String enterHomeSitterView(Model model, int hsl_num) {
		model.addAttribute("hsList", hslService.getHomeSitterByHsl_Num(hsl_num));
		return "sitter/home/homeSitterView";
	}
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
	public String reserveHomeSitter(Model model, int hsl_num, @RequestParam Map<String,Object> params) {
		System.out.println("예약 : " + hsl_num);
		System.out.println(params);
		model.addAttribute("params", params);
//		System.out.println(hslService.getallHsl(hsl_num));
//		model.addAttribute("hsr", hsr);
//		model.addAttribute("hsList", hslService.getallHsl(hsl_num));
		return "sitter/home/homeSitterReservation";
	}
	@RequestMapping(value = "/confirm" , method = RequestMethod.POST)
	public String confirmHomeSitter(Model model, int hsr_numof_pet, @RequestParam Map<String,Object> params) {
		System.out.println("확인 : " + hsr_numof_pet);
		System.out.println(params);
		model.addAttribute("params", params);
//		System.out.println(hslService.getallHsl(hsl_num));
//		model.addAttribute("hsr", hsr);
//		model.addAttribute("hsList", hslService.getallHsl(hsl_num));
		return "sitter/home/homeSitterConfirm";
	}
}

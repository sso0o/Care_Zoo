package com.what.carezoo.sitter.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.what.carezoo.sitter.service.HomeSitterService;

@RequestMapping("home")
@Controller
public class HomeSitterController {
	@Autowired
	private HomeSitterService hsService;
	// 가정시터목록보여주는 메인 띄우기
	@RequestMapping("/main")
	public String enterHomeSitterMain(Model model) {
		model.addAttribute("hslList", hsService.getallHsl());
		System.out.println(hsService.getallHsl());
		return "sitter/home/homeSitterList";
	}
	@RequestMapping("/join")
	public String joinHomeSitter() {
		return "sitter/home/homeSitterJoinForm";
	}
	// 가정시터 검색목록 가져오기
	@ResponseBody
	@RequestMapping("/search")
	public List<HomeSitterList> searchHS(@RequestParam(value="hsl_address" ,required = false) ArrayList<String> hsl_address, HomeSitterList hsl) {
		if(hsl==null) {			
			hsl = new HomeSitterList();
		}
		if(hsl_address==null) {
			hsl_address = new ArrayList<String>(); 			
		}		
		System.out.println("모델:"+hsl_address);
		System.out.println("hsl:"+hsl);
		System.out.println("값"+hsService.getbySearchingHsl(hsl_address,hsl));
		return hsService.getbySearchingHsl(hsl_address,hsl);
	}
	// 가정시터 게시글 등록 뷰 보여주기
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeHsl(Model model) {
		return "sitter/home/homeSitterPosting";
	}
	// 가정시터 게시글 등록 로직수행
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writeHsl(HomeSitterList hsl, MultipartHttpServletRequest mtfRequest) {
		List<MultipartFile> files = mtfRequest.getFiles("file");
		boolean rst = hsService.addHsl(hsl, files);
		if(rst) {
			return "redirect:/home/main";
		}else {
			return "edirect:/home/write";
		}
	}
	@RequestMapping("/view")
	public String enterHomeSitterView(Model model, int hsl_num) {
//		System.out.println("num:"+hsl_num+"list : "+hsService.getHomeSitterByHsl_Num(hsl_num));
		model.addAttribute("hsList", hsService.getHomeSitterByHsl_Num(hsl_num));
		return "sitter/home/homeSitterView";
	}
	@RequestMapping("/reserve")
	@PreAuthorize("isAuthenticated()")
	public String reserveHomeSitter(Model model) {
		return "sitter/home/homeSitterList";
	}
	//////////HomeSitter////////////////////////////////////////////////////////////////////
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
}

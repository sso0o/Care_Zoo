package com.what.carezoo.sitter.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.what.carezoo.model.HomeSitterList;
import com.what.carezoo.sitter.service.HomeSitterSearchingService;

@RequestMapping("home")
@Controller
public class HomeSitterController {
	@Autowired
	private HomeSitterSearchingService hssService;
	// 가정시터목록보여주는 메인 띄우기
	@RequestMapping("/main")
	public String enterHomeSitterMain() {
		return "sitter/home/homeSitterList";
	}
	// 가정시터 검색목록 가져오기
	@ResponseBody
	@RequestMapping("/search")
	public List<HomeSitterList> searchHS(@RequestParam("hsl_address") ArrayList<String> hsl_address, HomeSitterList hsl) {
		System.out.println("모델:"+hsl_address);
		System.out.println("hsl:"+hsl);
		if(hsl==null) {			
			hsl = new HomeSitterList();
		}
		if(hsl_address==null) {
			hsl_address = new ArrayList<String>(); 			
		}		
		System.out.println("값"+hssService.getbySearchingHsl(hsl_address,hsl));
		return hssService.getbySearchingHsl(hsl_address,hsl);
	}
	// 가정시터 게시글 등록 뷰 보여주기
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeHsl(Model model) {
		return "sitter/home/homeSitterPosting";
	}
	// 가정시터 게시글 등록 로직수행
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writeHsl() {
		return "sitter/home/homeSitterPosting";
	}
	@RequestMapping("/view")
	public String enterHomeSitterView(HomeSitterList hsl) {
		System.out.println(hsl);
		return "sitter/home/homeSitterList";
	}
}

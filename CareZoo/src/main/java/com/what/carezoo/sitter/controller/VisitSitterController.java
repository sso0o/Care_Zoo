package com.what.carezoo.sitter.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.what.carezoo.member.service.MemberService;
import com.what.carezoo.model.Customer;
@RequestMapping("/visit")
@Controller
public class VisitSitterController {
	@Autowired
	private MemberService memberService;
	//예약 메인(로그인, 회원가입)
	@RequestMapping("/main")
	public String showMain() {
		return "sitter/visit/Reservation1";
	}
	//주소
	@RequestMapping("/address")
	public String address() {
		return "sitter/visit/Address";
	}
	//회원가입
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinForm() {
		return "sitter/visit/joinForm";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(Customer customer,Model model) {
		boolean result =memberService.joinMember(customer);
		//loginForm -> /member/loginForm 으로 가버리기 때문에 contextPath가 필요하다.
		if(result) {
			model.addAttribute("c_num", memberService.getMemberByEmail(customer.getC_email()).getC_num());
			return "sitter/visit/reservation2";
		}
		return "redirect:join";
	}
	//로그인
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {
		return "sitter/visit/loginForm";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(HttpServletRequest request,Model model,String c_email, String c_pass) {
		System.out.println(c_email);
		System.out.println(c_pass);
		if(memberService.login(c_email,c_pass)) {
			model.addAttribute("c_num", memberService.getMemberByEmail(c_email).getC_num());
			model.addAttribute("c_name",memberService.getMemberByEmail(c_email).getC_name());
			return "sitter/visit/reservation2";
		}
		return "redirect:login";
	}
	//돌봄신청 폼(펫조인)
	@RequestMapping(value="apply",method=RequestMethod.GET)
	public String reservation3Form(Model model,int c_num) {
		model.addAttribute("c_num", c_num);
		return "sitter/visit/reservation3";
	}
	
	//펫등록
	@RequestMapping(value="petjoin", method=RequestMethod.POST)
	public String petjoin(HttpServletRequest request) {
		
		
		return "pet/petList";
	}
}

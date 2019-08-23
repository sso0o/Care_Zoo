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
	public String join(Customer customer,Model model,HttpServletRequest request) {
		boolean result =memberService.joinMember(customer);
		String url=request.getContextPath()+"sitter/visit/join";
		String msg="회원가입 실패";
		//loginForm -> /member/loginForm 으로 가버리기 때문에 contextPath가 필요하다.
		if(result) {
			msg="회원가입 성공";
			url=request.getContextPath()+"/sitter/visit/reservation2";
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		return "result";
	}
}

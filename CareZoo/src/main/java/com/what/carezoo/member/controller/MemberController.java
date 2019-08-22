package com.what.carezoo.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.what.carezoo.member.service.MemberService;
import com.what.carezoo.model.Customer;
@RequestMapping("/member")
@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(String c_email, String c_pass) {
		if(memberService.login(c_email,c_pass)) {
			return "mainForm";
		}
		return "login";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinForm() {
		return "joinForm";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(Customer customer,Model model,HttpServletRequest request) {
		boolean result =memberService.joinMember(customer);
		String url=request.getContextPath()+"/member/mainForm";
		String msg="회원가입 실패";
		//loginForm -> /member/loginForm 으로 가버리기 때문에 contextPath가 필요하다.
		if(result) {
			msg="회원가입 성공";
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		return "result";
	}
	@RequestMapping(value="/mainForm", method=RequestMethod.GET)
	public String mainForm() {
		return "mainForm";
	}
}

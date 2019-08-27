package com.what.carezoo.member.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.what.carezoo.member.service.MemberService;
import com.what.carezoo.model.Customer;
@RequestMapping("/member")
@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	//로그인
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(HttpServletRequest request,Model model,String c_email, String c_pass) {
		System.out.println(c_email);
		System.out.println(c_pass);
		if(memberService.login(c_email,c_pass)) {
			model.addAttribute("c_name",memberService.getMemberByEmail(c_email).getC_name());
			return "mainLogin";
		}
		return "login";
	}
	//회원가입
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinForm() {
		return "joinForm";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(Customer customer,Model model,HttpServletRequest request) {
		if(customer.getC_address() != null & customer.getC_birth() !=null
				& customer.getC_contact() != null & customer.getC_d_address() != null 
				& customer.getC_e_address() !=null & customer.getC_email() !=null 
				& customer.getC_name()!=null & customer.getC_pass() !=null 
				& customer.getC_pass_chk() !=null	& customer.getC_sex() != null) {
		boolean result =memberService.joinMember(customer);
		//loginForm -> /member/loginForm 으로 가버리기 때문에 contextPath가 필요하다.
		if(result) {
			return "redirect:member/login";
		}
		String msg ="비밀번호 일치 또는 빈칸이 있는지 확인해 주세요";
		String url = "join";
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "result";
	}
	String msg ="빈칸이 있는지 확인해 주세요";
	String url = "join";
	model.addAttribute("msg", msg);
	model.addAttribute("url", url);
	return "result";
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
	//마이페이지
	@RequestMapping(value="/myPage",method=RequestMethod.GET)
	public String myPageForm() {
		return "my&customer/mypageForm";
	}

}

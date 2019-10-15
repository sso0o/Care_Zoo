package com.what.carezoo.kakao.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.what.carezoo.member.service.MemberService;
import com.what.carezoo.model.Customer;

@Controller
@RequestMapping("/kakao")
public class HomeController {

	 @Autowired
	 private MemberService mService;
    
    @RequestMapping(value="/login")
    public Authentication login(@RequestParam("userid") String userid,@RequestParam("user") String user, @RequestParam("kakaoId") String kakaoId,Model model) {
        System.out.println("email: "+userid+" user: "+user+" id: "+kakaoId);
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String type = request.getParameter("user");
		Authentication authToken=null;
		List<SimpleGrantedAuthority> auths = new ArrayList<SimpleGrantedAuthority>();
		
        if(mService.findC_id(kakaoId)>0) {
    		
    		if(type.equals("kakao")) {
    			System.out.println("kakao==================================");
    			Customer c = mService.getMemberByEmail(userid);
    			System.out.println("email key : " +c.getC_email_key());
    			System.out.println(c);
    			if(kakaoId != null) {
    				System.out.println("로그인 성공");
    				auths.add(new SimpleGrantedAuthority("ROLE_CUSTOMER"));
    				HttpSession session = request.getSession();
    				session.setAttribute("user_numtype", "c_num");
    				session.setAttribute("user_num", mService.getMemberByEmail(userid).getC_num());
    				session.setAttribute("user_name", mService.getMemberByEmail(userid).getC_name());
    				authToken = new UsernamePasswordAuthenticationToken(userid, mService.getMemberByEmail(userid).getC_pass(), auths);
    			}
    		    return authToken;
    		}
        	//return "mainLogin";
        }
        model.addAttribute("id", kakaoId);
        model.addAttribute("email", userid);
		return authToken;

      //  return "joinForm_customer2";
    }
}

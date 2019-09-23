package com.what.carezoo.security;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.what.carezoo.admin.service.AdminService;
import com.what.carezoo.member.service.MemberService;
import com.what.carezoo.model.Admin;
import com.what.carezoo.model.Customer;
import com.what.carezoo.model.HomeSitter;
import com.what.carezoo.model.VisitSitter;
import com.what.carezoo.sitter.service.HomeSitterService;
import com.what.carezoo.sitter.service.VisitSitterService;

@Component("authProvider")
public class CustomAuthenticationProvider implements AuthenticationProvider {


	// 권한을 부여하는 기능을 가지는 클래스

//	@Autowired
//	private MemberService mService;
//	@Autowired(required = false)
//	private  HttpServletRequest request;
	
//	@Autowired(required = false)
//	private RequestContextListener requestContextListener;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private HomeSitterService hsService;
	
	@Autowired
	private VisitSitterService vsService;
	
	@Autowired
	private AdminService aService;
	

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// 권한을 만들어 내는 기능을 해야하는 메서드
		// 로그인폼에서 넘긴 id/pw 를 이용해서 권한을 얻어오기
		System.out.println("****AuthenticationProvider 실행****");
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String type = request.getParameter("user");
		System.out.println(type);
		
		String userid = authentication.getName();
		String pw = (String)authentication.getCredentials();
		
		System.out.println("id ================== "+userid);
		System.out.println("pw ================== "+pw);
		
		
		Authentication authToken=null;
		List<SimpleGrantedAuthority> auths = new ArrayList<SimpleGrantedAuthority>();
		
		if(type.equals("customer")) {
			System.out.println("customer==================================");
			Customer c = mService.getMemberByEmail(userid);
			System.out.println(c);
			if(c != null && c.getC_pass().equals(pw)) {
				System.out.println("로그인 성공");
				auths.add(new SimpleGrantedAuthority("CUSTOMER"));
				HttpSession session = request.getSession();
				session.setAttribute("user_numtype", "c_num="+mService.getMemberByEmail(userid).getC_num());
				session.setAttribute("user_num", mService.getMemberByEmail(userid).getC_num());
				session.setAttribute("user_name", mService.getMemberByEmail(userid).getC_name());
				authToken = new UsernamePasswordAuthenticationToken(userid, pw, auths);
			}
		    return authToken;
			
		} else if(type.equals("home")) {
			System.out.println("home==================================");
			HomeSitter hs = hsService.getHomeSitterByEmail(userid);
			if(hs != null && hs.getHs_pass().equals(pw)) {
				System.out.println("로그인 성공");
				auths.add(new SimpleGrantedAuthority("HOME"));
				HttpSession session = request.getSession();
				session.setAttribute("user_numtype", "hs_num="+hsService.getHomeSitterByEmail(userid).getHs_num());
				session.setAttribute("user_num", hsService.getHomeSitterByEmail(userid).getHs_num());
				session.setAttribute("user_name", hsService.getHomeSitterByEmail(userid).getHs_name());
				authToken = new UsernamePasswordAuthenticationToken(userid, pw, auths);
				authToken = new UsernamePasswordAuthenticationToken(userid, pw, auths);
			}
		    return authToken;
		} else if(type.equals("visit")) {
			System.out.println("visit==================================");
			VisitSitter vs = vsService.getVisitSitterByEmail(userid);
			if(vs != null && vs.getVs_pass().equals(pw)) {
				System.out.println("로그인 성공");
				auths.add(new SimpleGrantedAuthority("VISIT"));
				HttpSession session = request.getSession();
				session.setAttribute("user_numtype", "vs_num="+vsService.getVisitSitterByEmail(userid).getVs_num());
				session.setAttribute("user_num", vsService.getVisitSitterByEmail(userid).getVs_num());
				session.setAttribute("user_name", vsService.getVisitSitterByEmail(userid).getVs_name());
				authToken = new UsernamePasswordAuthenticationToken(userid, pw, auths);
			}
		    return authToken;
		} else if(type.equals("admin")){
			System.out.println("admin==================================");
			Admin a = aService.getOneAdminByEmail(userid);
			if(a != null && a.getAdm_pass().equals(pw)) {
				System.out.println("로그인 성공");
				auths.add(new SimpleGrantedAuthority("ADMIN"));
				HttpSession session = request.getSession();
//				session.setAttribute("user_name", mService.getMemberByEmail(userid).getC_name());
				authToken = new UsernamePasswordAuthenticationToken(userid, pw, auths);
			}
		    return authToken;
		} else {
			return authToken;
		}

	}

	@Override
	public boolean supports(Class<?> authentication) {
		// AuthenticationProvider가 제공하는 권한을 사용하려면 true
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}

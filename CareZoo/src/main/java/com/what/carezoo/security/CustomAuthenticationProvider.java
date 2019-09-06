package com.what.carezoo.security;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.management.relation.Role;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.what.carezoo.admin.service.AdminService;
import com.what.carezoo.member.service.MemberService;
import com.what.carezoo.model.Customer;
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
	private VisitSitterService csService;
	
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
		
		if(type.equals("customer")) {
			System.out.println("customer==================================");
			System.out.println("외않되ㅜ");
			Customer c = mService.getMemberByEmail(userid);
			System.out.println(c);
			if(c != null && c.getC_pass().equals(pw)) {
				System.out.println("로그인 성공");
				
			}
			
		} else if(type.equals("home")) {
			System.out.println("home==================================");
		} else if(type.equals("visit")) {
			System.out.println("visit==================================");
		} else {
			System.out.println("admin==================================");
		}
		
		
		

		return null;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// AuthenticationProvider가 제공하는 권한을 사용하려면 true
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}

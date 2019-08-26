//package com.what.carezoo.secutiry;
//
//import java.math.BigDecimal;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.authentication.AuthenticationProvider;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.AuthenticationException;
//import org.springframework.stereotype.Component;
//
//import commons.Constants;
//import commons.Role;
//import service.MemberService;
//
//@Component("authProvider")
//public class CustomAuthenticationProvider implements AuthenticationProvider{
//	//권한을 부여하는 기능을 가지는 클래스
//
//	@Autowired
//	private  service;
//	
//	@Override
//	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
//		// 권한을 만들어 내는 기능을 해야하는 메서드
//		//로그인폼에서 넘긴 id/pw 를 이용해서 권한을 얻어오기
////		System.out.println("costomaaa 실행");
//		String id = authentication.getName();
//		String pw = (String)authentication.getCredentials();
//		
//		Authentication authToken=null;
//		List<Role> authList = new ArrayList<Role>();
//		Map<String, Object> member = service.getMemberById(id);
//		if(member != null && member.get(Constants.Member.PASSWORD).equals(pw)) {
//            //로그인 성공, 권한 얻어오기 
////			System.out.println("로그인 성공");
//			//db에서 로그인한 회원의 권한 가져오기
//			BigDecimal big = (BigDecimal)member.get(Constants.Member.NUM);
//			int num = big.intValue();
//			List<String> auths = service.getMemberAuthorities(num);
//			
//			for (String auth : auths) {
//				Role role = new Role(auth);
//				authList.add(role);
//			}
//
//			//임의로 ROLE_USER 권한 부여
////			Role tmpRole = new Role("ROLE_USER"); 
////            authList.add(tmpRole);
//            authToken = new UsernamePasswordAuthenticationToken(id, pw,authList);
//             
//        }
//		return authToken;
//	}
//
//	@Override
//	public boolean supports(Class<?> authentication) {
//		//AuthenticationProvider가 제공하는 권한을 사용하려면 true
//		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
//	}
//
//}

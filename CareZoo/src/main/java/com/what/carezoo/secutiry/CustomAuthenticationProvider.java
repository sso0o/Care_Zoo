package com.what.carezoo.secutiry;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.management.relation.Role;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

import com.what.carezoo.member.service.MemberService;

@Component("authProvider")
public class CustomAuthenticationProvider implements AuthenticationProvider {
	// 권한을 부여하는 기능을 가지는 클래스

	@Autowired
	private MemberService mService;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// 권한을 만들어 내는 기능을 해야하는 메서드
		// 로그인폼에서 넘긴 id/pw 를 이용해서 권한을 얻어오기
		System.out.println("costomaaa 실행");
		String id = authentication.getName();
		String pw = (String) authentication.getCredentials();

		return null;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// AuthenticationProvider가 제공하는 권한을 사용하려면 true
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}

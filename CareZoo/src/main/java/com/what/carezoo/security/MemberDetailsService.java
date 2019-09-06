package com.what.carezoo.security;

import java.util.Map;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.what.carezoo.member.service.MemberService;

@Service
public class MemberDetailsService implements UserDetailsService{
	
	private MemberService mService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		Map<String, Object> member = mService.getMemberByEmail(username)
		return null;
	}
	
	

}

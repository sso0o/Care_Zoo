package com.what.carezoo.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.member.dao.MemberDao;
import com.what.carezoo.model.Customer;

@Service
public class MemberService {
	//회원관련 기능 작성
	@Autowired
	private MemberDao memberDao;
	
	//로그인
	public boolean login(String email,String pass) {
		Customer member = memberDao.selectOneByEmail(email);
		if(member!=null) {
			String originPass
			=(String)member.getC_pass();
			if(pass.equals(originPass)) {
				//아이디존재, 비밀번호 일치
				return true;
			}
		}
		return false;
	}
	public Customer getMemberByEmail(String email) {
		return memberDao.selectOneByEmail(email);
	}
	
	public boolean joinMember(Customer customer) {
		System.out.println(customer);
		if(memberDao.insertCustomer(customer)>0) {
			System.out.println(customer);
			return true;
		}
		return false;
	}
}

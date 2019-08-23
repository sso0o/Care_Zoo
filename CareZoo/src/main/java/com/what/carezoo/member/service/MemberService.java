package com.what.carezoo.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.MemberDao;
import com.what.carezoo.model.Customer;

@Service
public class MemberService {
	//회원관련 기능 작성
	@Autowired
	private MemberDao memberDao;
	
	//로그인
	public boolean login(String c_email,String c_pass) {
		Customer member = memberDao.selectOneByEmail(c_email);
		if(member!=null) {
			String originPass
			=(String)member.getC_pass();
			if(c_pass.equals(originPass)) {
				//아이디존재, 비밀번호 일치
				return true;
			}
		}
		return false;
	}
	//비밀번호 중복 확인
	public boolean pass(String c_pass,String c_pass_chk) {
		if(c_pass.equals(c_pass_chk)) {
			return true;
		}
		return false;
	}
	
	public Customer getMemberByEmail(String email) {
		return memberDao.selectOneByEmail(email);
	}
	//c_email컬럼 합치는 메서드
	public String email(String c_email,String c_e_address) {
		c_email = c_email+"@"+c_e_address;
		return c_email;
	}
	//가입
	public boolean joinMember(Customer customer) {
		customer.setC_email(email(customer.getC_email(), customer.getC_e_address()));
		if(memberDao.insertCustomer(customer)>0) {
			System.out.println(customer);
			if(pass(customer.getC_pass(), customer.getC_pass_chk())){
				return true;
			}
		}
		return false;
	}
}

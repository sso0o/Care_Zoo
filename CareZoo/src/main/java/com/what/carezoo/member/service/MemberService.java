package com.what.carezoo.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.MemberDao;
import com.what.carezoo.model.Customer;

@Service
public class MemberService {
	//회원관련 기능 작성
	@Autowired
	private MemberDao memberDao;
	
	
//	private SqlSessionTemplate userSqlsession;
	
	//로그인
	public boolean login(String c_email,String c_pass) {
		Customer member = memberDao.selectOneByEmail(c_email);
		if(member!=null) {
			String originPass = member.getC_pass();
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
	
	public Customer getMemberByC_num(int c_num) {
		return memberDao.selectOneByNum(c_num);
	}
	//c_email컬럼 합치는 메서드
	public String email(String c_email,String c_e_address) {
		c_email = c_email+"@"+c_e_address;
		return c_email;
	}
	//가입
	public boolean joinMember(Customer customer) {
		int rst = memberDao.insertCustomer(customer);
		if(rst>0) {
			return true;
		}
		return false;
	}
	
	public List<Customer> selectAll(){
		return memberDao.selectAll();
	}
	//아이디 체크
	public int userIdCheck(String c_email) {
		return memberDao.userIdCheck(c_email);
	}
}

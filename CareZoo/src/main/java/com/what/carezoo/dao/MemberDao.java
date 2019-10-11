package com.what.carezoo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.what.carezoo.model.Customer;

public interface MemberDao {

	public int insertCustomer(Customer customer);
	public int updateCustomer(Customer customer);
	public int deleteCustomer(int num);
	public Customer selectOneByNum(int num);
	public Customer	selectOneByEmail(String email);
	public List<Customer> selectAll();
	public int userIdCheck(String c_email);
	
	public int insertFile(Map<String,Object> param);
	public String selectFile(int c_num);
	public int updateFile(Map<String,Object> param);
	
	//email찾기
	public String findC_email(@Param("name")String c_name,@Param("number")String c_contact);
	public int findC_emailCount(@Param("name")String c_name,@Param("number")String c_contact);
	
	
	//자바메일인증
	public int GetKey(@Param("c_email")String c_email, @Param("c_email_key")String c_email_key);  //멤버 인증키 생성 메서드
	int alter_cKey(@Param("c_email")String c_email, @Param("c_email_key")String c_email_key); //멤버 인증키(난수로 생성/)된 것을 Y로 바꿔주는 메서드
	

	//메인에 리뷰가져오기
	public List<Map<String, Object>> getMainSitterReview();
 }


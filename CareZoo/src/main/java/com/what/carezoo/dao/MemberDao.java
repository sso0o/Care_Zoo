package com.what.carezoo.dao;

import java.util.List;
import java.util.Map;

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

}

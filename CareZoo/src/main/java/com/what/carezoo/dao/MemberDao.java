package com.what.carezoo.dao;

import java.util.List;

import com.what.carezoo.model.Customer;

public interface MemberDao {

	public int insertCustomer(Customer customer);
	public int updateCustomer(Customer customer);
	public int deleteCustomer(int num);
	public Customer selectOneByNum(int num);
	public Customer	selectOneByEmail(String email);
	public List<Customer> selectAll();
}

package com.what.carezoo.member.dao;

import java.util.List;

import com.what.carezoo.model.Customer;

public interface MemberDao {

	public int insertCustomer(Customer customer);
	public int updateCustomer(Customer customer);
	public int deleteCustomer(int num);
	public Customer selectCustomer(int num);
	public List<Customer> selectAll();
}

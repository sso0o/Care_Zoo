package com.what.carezoo.dao;

import java.util.List;

import com.what.carezoo.model.Admin;


public interface AdminDao {

	public int insert(Admin a);
	public int update(Admin a);
	public int delete(Admin a);
	public Admin selectOneByEmail(String adm_email);
	public List<Admin> selectAllAdmin();
}

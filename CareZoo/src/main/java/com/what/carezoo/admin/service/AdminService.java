package com.what.carezoo.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.AdminDao;
import com.what.carezoo.model.Admin;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao aDao;
	
	public Admin getOneAdminByEmail(String adm_email) {
		return aDao.selectOneByEmail(adm_email);
	}

}

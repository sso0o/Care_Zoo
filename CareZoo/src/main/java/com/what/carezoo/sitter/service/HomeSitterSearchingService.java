package com.what.carezoo.sitter.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.model.HomeSitterSearching;
import com.what.carezoo.sitter.dao.HomeSitterSearchingDao;

@Service
public class HomeSitterSearchingService {
	@Autowired
	private HomeSitterSearchingDao hssDao;
	public boolean modifyHSS(HomeSitterSearching hss) {
		if(hssDao.insertHSS(hss)>0) {
			return true;
		}
		return false;
	}
}

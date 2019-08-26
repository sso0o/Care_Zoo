package com.what.carezoo.sitter.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.HomeSitterListDao;
import com.what.carezoo.model.HomeSitterList;



@Service
public class HomeSitterSearchingService {
	@Autowired
	private HomeSitterListDao hssDao;
	public boolean modifyHSS(HomeSitterList hsl) {
		if(hssDao.insertHsl(hsl)>0) {
			return true;
		}
		return false;
	}
}

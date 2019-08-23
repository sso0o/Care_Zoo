package com.what.carezoo.sitter.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.HomeSitterSearchingDao;
import com.what.carezoo.model.HomeSitterSearching;

@Service
public class HomeSitterSearchingService {
	@Autowired
	private HomeSitterSearchingDao hssDao;
	public boolean modifyHSS(HomeSitterSearching hss) {

		return false;
	}
}

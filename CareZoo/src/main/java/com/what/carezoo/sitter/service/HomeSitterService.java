package com.what.carezoo.sitter.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.HomeSitterDao;
import com.what.carezoo.model.HomeSitter;

@Service
public class HomeSitterService {
	@Autowired
	private HomeSitterDao hsDao;
	//homesitter
	public boolean addHomeSitter(HomeSitter hs) {
		return false;
		
	}
	
	public boolean modifyHomeSitter(HomeSitter hs) {
		return false;
		
	}
	
	public boolean deleteHomeSitter(HomeSitter hs) {
		return false;
		
	}
	
	public HomeSitter getHomeSitterByNum(int hs_num) {
		return hsDao.selectOneByNum(hs_num);		
	}
	
	public HomeSitter getHomeSitterByEmail(String hs_email) {
		return hsDao.selectOneByEmail(hs_email);
	}
	
	public List<HomeSitter> getAllHomeSitter(){
		return null;
	}	
	//아이디 체크
	public int userIdCheck(String hs_email) {
		return hsDao.homeSitterIdCheck(hs_email);
	}
}

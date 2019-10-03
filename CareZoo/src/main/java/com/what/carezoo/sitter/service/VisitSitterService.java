package com.what.carezoo.sitter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.VisitSitterDao;
import com.what.carezoo.model.Customer;
import com.what.carezoo.model.VisitSitter;

@Service
public class VisitSitterService {
	
	@Autowired
	private VisitSitterDao vsDao;
	
	private static final String UPLOAD_PATH = "c:\\temp";
	
	public boolean addVisitSitter(VisitSitter vs) {
		return false;
		
	}
	
	public boolean modifyVisitSitter(VisitSitter vs) {
		return false;
		
	}
	
	public boolean deleteVisitSitter(VisitSitter vs) {
		return false;
		
	}
	
	public VisitSitter getVisitSitterByNum(int vs_num) {
		return vsDao.selectOneByNum(vs_num);
		
	}
	
	public VisitSitter getVisitSitterByEmail(String vs_email) {
		return vsDao.selectOneByEmail(vs_email);
	}
	
	public List<VisitSitter> getAllVisitSitter(){
		return vsDao.selectAllVisitSitter();
	}
	
	//아이디 체크
	public int userIdCheck(String vs_email) {
		return vsDao.userIdCheck(vs_email);
	}
	//가입
	public boolean joinVisitSitter(VisitSitter visitsitter) {
		int rst = vsDao.insertVisitSitter(visitsitter);
		if(rst>0) {
			return true;
		}
		return false;
	}
}

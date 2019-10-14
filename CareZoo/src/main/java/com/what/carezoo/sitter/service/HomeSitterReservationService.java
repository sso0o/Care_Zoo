package com.what.carezoo.sitter.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.HomeSitterReservationDao;
import com.what.carezoo.model.HomeSitterReservation;

@Service
public class HomeSitterReservationService {

	@Autowired
	private HomeSitterReservationDao hsrDao;
	
	public boolean writeHomeSitterRes(HomeSitterReservation hsr) {
		if(hsrDao.insert(hsr) >0 ) {
			return true;
		}
		return false;
	}
	
	public HomeSitterReservation getHomeSitterResByHsrnum(int hsr_num) {
		return hsrDao.selectByHsrnum(hsr_num);
	}
	
	public boolean deleteByC_num(int c_num) {
		if(hsrDao.deleteByC_num(c_num)>0) {
			return true;
		}
		return false;
	}
	
	public List<HomeSitterReservation> getHomeSitterResByCnum(int c_num){
		return hsrDao.selectByCnum(c_num);
	}
	
	public List<Map<String, Object>> getHomeSitterResByHSnum(int hs_num){
		return hsrDao.selectByHSnum(hs_num);
	}
	
	public List<HomeSitterReservation> getAllHomeSitterRes() {
		return hsrDao.selectAll();
	}
	
	public List<Map<String, Object>> getHSRInfo(int c_num){
		return hsrDao.getHSRInfo(c_num);
	}
	
	public List<Map<String, Object>> getStatus0(int hs_num){
		return hsrDao.getStatus0(hs_num);
	}
	
	public Map<String, Object> getModalHSR(int hsr_num){
		return hsrDao.getModalHSR(hsr_num);
	}
	
	public boolean acceptHsr(int hsr_num) {
		if(hsrDao.acceptHsr(hsr_num)>0) {
			return true;
		}
		return false;
	}
	
	public boolean cancelHsr(int hsr_num) {
		if(hsrDao.cancelHsr(hsr_num)>0) {
			return true;
		}
		return false;
	}
	
	public int countC_num(int c_num) {
		return hsrDao.countC_num(c_num);
	}
}

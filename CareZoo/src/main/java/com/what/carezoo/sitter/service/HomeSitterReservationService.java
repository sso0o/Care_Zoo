package com.what.carezoo.sitter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.HomeSitterReservationDao;
import com.what.carezoo.model.HomeSitterReservation;

@Service
public class HomeSitterReservationService {

	@Autowired
	private HomeSitterReservationDao hsrDao;
	
	public HomeSitterReservation getHomeSitterResByHsrnum(int hsr_num) {
		return hsrDao.selectByHsrnum(hsr_num);
	}
	
	
	public List<HomeSitterReservation> getHomeSitterResByCnum(int c_num){
		return hsrDao.selectByCnum(c_num);
	}
	
	public List<HomeSitterReservation> getHomeSitterResByHSnum(int hs_num){
		return hsrDao.selectByHSnum(hs_num);
	}
	
	
	public List<HomeSitterReservation> getAllHomeSitterRes() {
		return hsrDao.selectAll();
	}
}

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
	
	
	public List<HomeSitterReservation> getHomeSitterResByCnum(int c_num){
		return hsrDao.selectByCnum(c_num);
	}
	
	
	public List<HomeSitterReservation> getAllHomeSitterRes() {
		return hsrDao.selectAll();
	}
}

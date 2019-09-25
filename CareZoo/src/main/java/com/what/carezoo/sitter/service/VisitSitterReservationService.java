package com.what.carezoo.sitter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.VisitSitterReservationDao;
import com.what.carezoo.model.VisitSitterReservation;

@Service
public class VisitSitterReservationService {
	
	@Autowired
	private VisitSitterReservationDao vsrDao;
	
	
	public VisitSitterReservation getVisitSitterResBuVsrnum(int vsr_num) {
		return vsrDao.selectByVsrnum(vsr_num);
	}
	
	
	public List<VisitSitterReservation> getVisitSitterResByCnum(int c_num) {
		return vsrDao.selectByCnum(c_num);
	}
	
	public List<VisitSitterReservation> getVisitSitterResByVSnum(int vs_num) {
		return vsrDao.selectByVSnum(vs_num);
	}
	
	
	public List<VisitSitterReservation> getAllVisitSitterRes() {
		return vsrDao.selectAll();
	}

}

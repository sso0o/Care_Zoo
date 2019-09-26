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
	
	public boolean insertVisitSitterReservation(VisitSitterReservation vsr) {
		if(vsrDao.insert(vsr)>0) {
			return true;
		}
		return false;
	}
	
	public boolean updateVisitSitterReservation(String vsr_hour,String vsr_hAdd,String vsr_chkin) {
		VisitSitterReservation list = new VisitSitterReservation();
		list.setVsr_hAdd(vsr_hAdd);
		list.setVsr_hour(vsr_hour);
		list.setVsr_chkin(vsr_chkin);
		if(vsrDao.update(list)>0) {
			return true;
		}
		return false;
	}
	
	public boolean updateStatus(int vsr_num) {
		VisitSitterReservation list = new VisitSitterReservation();
		list.setVsr_num(vsr_num);
		if(vsrDao.updateStatus(list)>0) {
			return true;
		}
		return false;
	}
	
	public boolean deleteVisitSitterReservation(int vsr_num) {
		if(vsrDao.delete(vsr_num)>0) {
			return true;
		}
		return false;
	}
	
	public VisitSitterReservation getVisitSitterResByVsrnum(int vsr_num) {
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

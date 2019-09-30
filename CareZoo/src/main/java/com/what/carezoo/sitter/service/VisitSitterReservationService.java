package com.what.carezoo.sitter.service;

import java.util.ArrayList;
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
	
	public boolean updateVisitSitterReservation(String vsr_hour,String vsr_hAdd,String vsr_chkin,int vsr_count) {
		VisitSitterReservation list = new VisitSitterReservation();
		list.setVsr_hAdd(vsr_hAdd);
		list.setVsr_hour(vsr_hour);
		list.setVsr_chkin(vsr_chkin);
		list.setVsr_count(vsr_count);
		if(vsrDao.update(list)>0) {
			return true;
		}
		return false;
	}
	
	public boolean updateVisitSitterReservation2(String vsr_hour,String vsr_hAdd,String vsr_day,int vsr_count) {
		VisitSitterReservation list = new VisitSitterReservation();
		list.setVsr_hAdd(vsr_hAdd);
		list.setVsr_hour(vsr_hour);
		list.setVsr_day(vsr_day);
		list.setVsr_count(vsr_count);
		if(vsrDao.update2(list)>0) {
			return true;
		}
		return false;
	}
	
	public boolean updateTotalPrice(String vsr_totalPrice,ArrayList<Integer> vsr_num) {
		if(vsrDao.updateTotalPrice(vsr_totalPrice,vsr_num)>0) {
			return true;
		}
		return false;
	}
	
	public boolean updateContents(String vsr_attention,String vsr_contents,ArrayList<Integer> vsr_num) {
		if(vsrDao.updateContents(vsr_attention, vsr_contents, vsr_num)>0) {
			return true;
		}
		return false;
	}
	
	public boolean updateVsr_Chkin(String vsr_chkin,ArrayList<Integer> vsr_num) {
		if(vsrDao.updateVsr_Chkin(vsr_chkin, vsr_num)>0) {
			return true;
		}
		return false;
	}
	
	public boolean updateVsrCount(int c_num) {
		if(vsrDao.updateVsrCount(c_num)>0) {
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
	
	public boolean deleteByListVsrNum(ArrayList<Integer> vsr_num) {
		if(vsrDao.deleteByListVsrNum(vsr_num)>0) {
			return true;
		}
		return false;
	}
	
	public List<VisitSitterReservation> getVisitSitterResByVsrnum(int vsr_num) {
		return vsrDao.selectByVsrnum(vsr_num);
	}
	
	public List<VisitSitterReservation> selectByVsrnumbers(ArrayList<Integer> vsr_num){
		return vsrDao.selectByVsrnumbers(vsr_num);
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
	
	public List<VisitSitterReservation> selectByVsrCount(int vsr_count){
		return vsrDao.selectByVsrCount(vsr_count);
	}

}

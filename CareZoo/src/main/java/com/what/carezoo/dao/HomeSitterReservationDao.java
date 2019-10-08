package com.what.carezoo.dao;

import java.util.List;
import java.util.Map;

import com.what.carezoo.model.HomeSitterReservation;

public interface HomeSitterReservationDao {
	
	public int insert(HomeSitterReservation hsr);
	public int insertHsr(HomeSitterReservation hsr);
	public int update(HomeSitterReservation hsr);
	public int delete(HomeSitterReservation hsr);
	public HomeSitterReservation selectByHsrnum(int hsr_num);
	public List<HomeSitterReservation> selectByCnum(int c_num);
	public List<HomeSitterReservation> selectByHSnum(int hs_num);
//	public HomeSitterReservation selectByResInfo(HomeSitterReservation hsr);
	public List<HomeSitterReservation> selectAll();
	
	public List<Map<String, Object>> getHSRInfo(int c_num);
	
	public List<Map<String, Object>> getStatus0(int hs_num);
}

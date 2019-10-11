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
	public List<Map<String, Object>> selectByHSnum(int hs_num);
//	public HomeSitterReservation selectByResInfo(HomeSitterReservation hsr);
	public List<HomeSitterReservation> selectAll();
	
	//고객예약현황페이지에 넣을 정보 가져오기
	public List<Map<String, Object>> getHSRInfo(int c_num);
	
	public List<Map<String, Object>> getStatus0(int hs_num);
	
	
	//모달에 띄울 정보 가져오기
	public Map<String, Object> getModalHSR(int hsr_num);
	
	//예약수락
	public int acceptHsr(int hsr_num);
	//예약거절
	public int cancelHsr(int hsr_num);
}

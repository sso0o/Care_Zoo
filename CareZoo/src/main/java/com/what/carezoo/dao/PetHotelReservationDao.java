package com.what.carezoo.dao;

import java.util.List;
import java.util.Map;

import com.what.carezoo.model.PetHotelReservation;
import com.what.carezoo.model.PetHotelRoom;

public interface PetHotelReservationDao {
	
	public int insert(PetHotelReservation phr);
	public int update(PetHotelReservation phr);
	public int delete(PetHotelReservation phr);
	public int deleteByC_num(int c_num);
	public PetHotelReservation selectByPhrnum(int phr_num);
	public PetHotelReservation selectByPhnum(int ph_num);
	public PetHotelReservation selectByResInfo(PetHotelReservation phr);
	public int countC_num(int c_num);
	public PetHotelRoom selectPhRoomByPhrm_num(int phr_num);
	public List<PetHotelReservation> selectByCnum(int c_num);
	public List<PetHotelReservation> selectAll();
	public List<PetHotelReservation> selectByPhrm_num(int phrm_num);
	
	public List<Map<String, Object>> getPHRInfo(int c_num);

}

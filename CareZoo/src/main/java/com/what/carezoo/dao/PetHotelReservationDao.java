package com.what.carezoo.dao;

import java.util.List;

import com.what.carezoo.model.PetHotelReservation;

public interface PetHotelReservationDao {
	
	public int insert(PetHotelReservation phr);
	public int update(PetHotelReservation phr);
	public int delete(PetHotelReservation phr);
	public PetHotelReservation selectByPhrnum(int phr_num);
	public PetHotelReservation selectByPhnum(int ph_num);
	public PetHotelReservation selectByResInfo(PetHotelReservation phr);
	
	public List<PetHotelReservation> selectByCnum(int c_num);
	public List<PetHotelReservation> selectAll();
	public List<PetHotelReservation> selectByPhrm_num(int phrm_num);

}

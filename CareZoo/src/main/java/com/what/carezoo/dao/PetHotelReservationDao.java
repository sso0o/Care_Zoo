package com.what.carezoo.dao;

import java.util.List;

import com.what.carezoo.model.PetHotelReservation;

public interface PetHotelReservationDao {
	
	public int insert(PetHotelReservation phr);
	public int update(PetHotelReservation phr);
	public int delete(PetHotelReservation phr);
	public PetHotelReservation selectOneByNum(int phr_num);
	public PetHotelReservation selectByResInfo(PetHotelReservation phr);
	public List<PetHotelReservation> selectAll();

}

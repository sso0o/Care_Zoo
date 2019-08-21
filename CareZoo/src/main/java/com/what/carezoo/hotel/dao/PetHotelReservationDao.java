package com.what.carezoo.hotel.dao;

import java.util.List;

import com.what.carezoo.model.PetHotelReservation;

public interface PetHotelReservationDao {
	
	public int insert(PetHotelReservation phr);
	public int update(PetHotelReservation phr);
	public int delete(PetHotelReservation phr);
	public PetHotelReservation selectOne(int num);
	public List<PetHotelReservation> selectAll();

}
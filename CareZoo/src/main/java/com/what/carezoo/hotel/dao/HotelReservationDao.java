package com.what.carezoo.hotel.dao;

import java.util.List;

import com.what.carezoo.model.HotelReservation;

public interface HotelReservationDao {
	
	public int insert(HotelReservation hr);
	public int update(HotelReservation hr);
	public int delete(HotelReservation hr);
	public HotelReservation selectOne(int num);
	public List<HotelReservation> selectAll();
}

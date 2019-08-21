package com.what.carezoo.hotel.dao;

import java.util.List;

import com.what.carezoo.model.Hotel;

public interface HotelDao {
	
	public int insert(Hotel h);
	public int update(Hotel h);
	public int delete(Hotel h);
	public Hotel selectOne(int num);
	public List<Hotel> selectAll();
	

}

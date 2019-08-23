package com.what.carezoo.dao;

import java.util.List;

import com.what.carezoo.model.HotelRoom;

public interface HotelRoomDao {
	
	public int insert(HotelRoom hr);
	public int update(HotelRoom hr);
	public int delete(HotelRoom hr);
	public HotelRoom selectOne(int num);
	public List<HotelRoom> selectAllbyH_num();

}

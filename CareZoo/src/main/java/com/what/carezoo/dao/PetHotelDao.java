package com.what.carezoo.dao;

import java.util.List;

import com.what.carezoo.model.PetHotel;

public interface PetHotelDao {
	
	public int insert(PetHotel ph);
	public int update(PetHotel ph);
	public int delete(int ph_num);
	public PetHotel selectOne(int ph_num);
	public List<PetHotel> selectAll();

}

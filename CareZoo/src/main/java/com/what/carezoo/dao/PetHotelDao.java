package com.what.carezoo.dao;

import java.util.List;

import com.what.carezoo.model.PetHotel;

public interface PetHotelDao {
	
	public int insert(PetHotel ph);
	public int update(PetHotel ph);
	public int delete(PetHotel ph);
	public PetHotel selectOne(int num);
	public List<PetHotel> selectAll();

}

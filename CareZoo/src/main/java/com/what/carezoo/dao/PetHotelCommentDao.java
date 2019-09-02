package com.what.carezoo.dao;

import java.util.List;

import com.what.carezoo.model.PetHotelComment;

public interface PetHotelCommentDao {
	
	public int insert(PetHotelComment phc);
	public int update(PetHotelComment phc);
	public int delete(int phc_num);
	public PetHotelComment selectOne(int num);
	public List<PetHotelComment> selectAll();

	
	
}

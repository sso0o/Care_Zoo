package com.what.carezoo.dao;

import java.util.List;
import java.util.Map;

import com.what.carezoo.model.PetHotelComment;

public interface PetHotelCommentDao {
	
	public int insert(PetHotelComment phc);
	public int update(PetHotelComment phc);
	public int delete(int phc_num);
	public PetHotelComment selectByPhc_num(int phc_num);
	public List<PetHotelComment> selectByPh_num(int ph_num);
	public List<PetHotelComment> selectAll();
	public double ph_star(int ph_num);
	
	public List<Map<String, Object>> getPHCbyph_num(int ph_num);
	
	
}

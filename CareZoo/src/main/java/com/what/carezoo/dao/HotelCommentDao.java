package com.what.carezoo.dao;

import java.util.List;

import com.what.carezoo.model.HotelComment;

public interface HotelCommentDao {
	
	public int insert(HotelComment hc);
	public int update(HotelComment hc);
	public int delete(HotelComment hc);
	public HotelComment selectOne(int num);
	public List<HotelComment> selectAllbyH_num(int num);
	

}

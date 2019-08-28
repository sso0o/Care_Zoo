package com.what.carezoo.dao;

import java.util.List;
import java.util.Map;

import com.what.carezoo.model.Hotel;

public interface HotelDao {
	
	public int insert(Hotel h);
	public int update(Hotel h);
	public int delete(Hotel h);
	public Hotel selectOnebyH_num(int num);
	public List<Hotel> selectAll();
	public int insertFile(Map<String,Object> param);
	public String selectFileName(int h_num);

}

package com.what.carezoo.dao;

import java.util.List;

import com.what.carezoo.model.HomeSitter;

public interface HomeSitterDao {
	
	public int insert(HomeSitter hs);
	public int update(HomeSitter hs);
	public int delete(HomeSitter hs);
	public HomeSitter selectOneByNum(int hs_num);
	public HomeSitter selectOneByEmail(String hs_email);
	public List<HomeSitter> selectAllHomeSitter();
	

}

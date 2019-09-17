package com.what.carezoo.dao;

import java.util.List;

import com.what.carezoo.model.HomeSitter;

public interface HomeSitterDao {
	
	public int insertHomeSitter(HomeSitter hs);
	public int updateHomeSitter(HomeSitter hs);
	public int deleteHomeSitter(int Hhs_pass);
	public HomeSitter selectOneByNum(int hs_num);
	public HomeSitter selectOneByEmail(String hs_email);
	public List<HomeSitter> selectAllHomeSitter();
	

}

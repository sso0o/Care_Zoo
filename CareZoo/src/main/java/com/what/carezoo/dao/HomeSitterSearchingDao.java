package com.what.carezoo.dao;

import java.util.List;

import com.what.carezoo.model.HomeSitterSearching;


public interface HomeSitterSearchingDao {
	public int insertHss(HomeSitterSearching hss);
	public int insertHssAdd(HomeSitterSearching hss);
	public int updateHssAdd(HomeSitterSearching hss);
	public int deleteHss(int hss_num);
	public HomeSitterSearching selectOnebyHss_num(int hss_num);
	public List<HomeSitterSearching> selectAllHss();
}

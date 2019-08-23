package com.what.carezoo.sitter.dao;

import java.util.List;

import com.what.carezoo.model.HomeSitterSearching;

public interface HomeSitterSearchingDao {
	public int insertHSS(HomeSitterSearching hss);
	public int insertAddHSS(HomeSitterSearching hss);
	public int updateHSS(HomeSitterSearching hss);
	public int deleteHSS(int hss_num);
	public HomeSitterSearching selectOnebyHss(int hss_num);
	public List<HomeSitterSearching> selectAllHSS();
}

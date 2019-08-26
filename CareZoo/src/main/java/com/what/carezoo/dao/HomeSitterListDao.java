package com.what.carezoo.dao;

import java.util.List;

import com.what.carezoo.model.HomeSitterList;

public interface HomeSitterListDao {
	public int insertHss(HomeSitterList hss);
	public int insertHssAdd(HomeSitterList hss);
	public int updateHssAdd(HomeSitterList hss);
	public int deleteHss(int hss_num);
	public HomeSitterList selectOnebyHss_num(int hss_num);
	public List<HomeSitterList> selectAllHss();
}

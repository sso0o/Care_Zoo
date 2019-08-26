package com.what.carezoo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.what.carezoo.model.HomeSitterList;

public interface HomeSitterListDao {
	public int insertHsl(HomeSitterList hsl);
	public int insertHslAdd(HomeSitterList hsl);
	public int updateHsl(HomeSitterList hsl);
	public int deleteHsl(int hsl_num);
	public HomeSitterList selectOnebyHsl_num(int hsl_num);
	public HomeSitterList searchHsl(HomeSitterList hsl);
	public HomeSitterList searchHslbyAddress(@Param("hsl_address") String hsl_address,@Param("hsl_d_address")String hsl_d_address);
	public List<HomeSitterList> selectAllHsl(HomeSitterList hsl);
}

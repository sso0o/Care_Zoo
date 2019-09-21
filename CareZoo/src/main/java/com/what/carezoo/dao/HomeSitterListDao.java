package com.what.carezoo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.what.carezoo.model.HomeSitterList;

public interface HomeSitterListDao {
	public int insertHsl(HomeSitterList hsl);
	public int updateHsl(HomeSitterList hsl);
	public int deleteHsl(int hsl_num);
	public HomeSitterList selectOnebyHsl_num(int hsl_num);
	public List<HomeSitterList> selectHsl();	
	public List<HomeSitterList> selectAllHsl(@Param("list")List<String> hsl_address, @Param("hsl")HomeSitterList hsl);
	public int insertFile(Map<String,Object> param);
	public String selectFileName(int hsl_num);
	public List<String> selectFileList(int hsl_num);
}

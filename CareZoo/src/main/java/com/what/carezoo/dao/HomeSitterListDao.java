package com.what.carezoo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.what.carezoo.model.HomeSitterDisabledate;
import com.what.carezoo.model.HomeSitterList;

public interface HomeSitterListDao {
	//회원가입 
   public int insertHsl(HomeSitterList hsl);
   public int insertHomeSitterList(HomeSitterList hsl);
   public int updateHsl(HomeSitterList hsl);
   public int deleteHsl(int hsl_num);
   public HomeSitterList selectOnebyHsl_num(int hsl_num);
   public Map<String, Object> selectHsl(int hsl_num);   
   public List<Map<String, Object>> selectallHsl();
   
   public List<HomeSitterList> selectHsls();
   
//   public List<HomeSitterList> selectAllHsl(@Param("list")List<String> hsl_address, @Param("hsl")HomeSitterList hsl);
   public List<Map<String, Object>> selectAllHsl(@Param("list")List<String> hsl_address, @Param("hsl")HomeSitterList hsl);
  
   public int insertFile(Map<String,Object> param);
   public String selectFileName(int hsl_num);
   public List<String> selectFileList(int hsl_num);
   public int updateFile(Map<String,Object> param);
   
   //불가능 날짜(Disable Dates)
   public int insertDisdates(Map<String, Object> params);
   public int updateDisDates(Map<String, Object> params);
   // 가격
   public Map<String, Object> getHsPrice(@Param("hsl_size")String hsl_size, @Param("hsl_service_type")String hsl_service_type);  
}
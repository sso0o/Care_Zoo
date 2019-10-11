package com.what.carezoo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.what.carezoo.model.HomeSitter;

public interface HomeSitterDao {
	
	public int insertHomeSitter(Map<String, Object> params);
	public int updateHomeSitter(HomeSitter hs);
	public int deleteHomeSitter(int hs_num);
	public HomeSitter selectOneByNum(int hs_num);
	public HomeSitter selectOneByEmail(String hs_email);
	public List<HomeSitter> selectAllHomeSitter();
	public int homeSitterIdCheck(String hs_email);
	
	public String selectFile(int hs_num);
	public int insertFile(Map<String,Object> param);
	public int updateFile(Map<String,Object> param);
	
		//자바메일인증
	public int GetKey(@Param("hs_email")String hs_email, @Param("hs_email_key")String hs_email_key);  // 인증키 생성 메서드
	int alterHsKey(@Param("hs_email")String hs_email, @Param("hs_email_key")String hs_email_key); //인증키(난수로 생성/)된 것을 Y로 바꿔주는 메서드
	//email찾기
	public String findHs_email(@Param("name")String hs_name,@Param("number")String hs_contact);
	public int findHs_emailCount(@Param("name")String hs_name,@Param("number")String hs_contact);

}


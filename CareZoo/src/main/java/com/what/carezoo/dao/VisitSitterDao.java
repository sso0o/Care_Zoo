package com.what.carezoo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.what.carezoo.model.VisitSitter;

public interface VisitSitterDao {
	
	public int insertVisitSitter(VisitSitter vs);
	public int updateVisitSitter(VisitSitter vs);
	public int deleteVisitSitter(int vs_num);
	public VisitSitter selectOneByNum(int vs_num);
	public VisitSitter selectOneByEmail(String vs_email);
	public List<VisitSitter> selectAllVisitSitter();
/////////////
	public int userIdCheck(String vs_email);
	public int updateVisitSitterFile(Map<String, Object> param);
	public String selectFile(int vs_num);
	//email찾기
	public String findVs_email(@Param("name")String vs_name,@Param("number")String vs_contact);
	public int findVs_emailCount(@Param("name")String vs_name,@Param("number")String vs_contact);
	
	//자바메일인증
	public int GetKey(@Param("vs_email")String vs_email, @Param("vs_email_key")String vs_email_key);  //멤버 인증키 생성 메서드
	int alter_cKey(@Param("vs_email")String vs_email, @Param("vs_email_key")String vs_email_key); //멤버 인증키(난수로 생성/)된 것을 Y로 바꿔주는 메서드
}

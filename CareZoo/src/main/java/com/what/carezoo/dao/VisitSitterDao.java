package com.what.carezoo.dao;

import java.util.List;

import com.what.carezoo.model.VisitSitter;



public interface VisitSitterDao {
	
	public int insertVisitSitter(VisitSitter vs);
	public int update(VisitSitter vs);
	public int delete(VisitSitter vs);
	public VisitSitter selectOneByNum(int vs_num);
	public VisitSitter selectOneByEmail(String vs_email);
	public List<VisitSitter> selectAllVisitSitter();
/////////////
	public int userIdCheck(String vs_email);
}

package com.what.carezoo.dao;

import java.util.List;

import com.what.carezoo.model.VisitSitterReservation;

public interface VisitSitterReservationDao {
	
	public int insert(VisitSitterReservation vsr);
	public int update(VisitSitterReservation vsr);
	public int delete(VisitSitterReservation vsr);
	public List<VisitSitterReservation> selectByCnum(int c_num);
//	public VisitSitterReservation selectByResInfo(VisitSitterReservation vsr);
	public List<VisitSitterReservation> selectAll();

}

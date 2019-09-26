package com.what.carezoo.dao;

import java.util.List;

import com.what.carezoo.model.VisitSitterReservation;

public interface VisitSitterReservationDao {
	
	public int insert(VisitSitterReservation vsr);
	public int update(VisitSitterReservation vsr);
	public int updateStatus(VisitSitterReservation vsr);
	public int delete(int vsr_num);
	public VisitSitterReservation selectByVsrnum(int vsr_num);
	public List<VisitSitterReservation> selectByCnum(int c_num);
	public List<VisitSitterReservation> selectByVSnum(int vs_num);
//	public VisitSitterReservation selectByResInfo(VisitSitterReservation vsr);
	public List<VisitSitterReservation> selectAll();

}

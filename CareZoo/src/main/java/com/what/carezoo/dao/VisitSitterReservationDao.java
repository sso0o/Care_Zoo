package com.what.carezoo.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.what.carezoo.model.VisitSitterReservation;

public interface VisitSitterReservationDao {
	
	public int insert(VisitSitterReservation vsr);
	public int update(VisitSitterReservation vsr);
	public int updateTotalPrice(@Param("vsr_totalPrice")String vsr_totalPrice,@Param("list")ArrayList<Integer> vsr_num);
	public int updateContents(@Param("vsr_attention")String vsr_attention,@Param("vsr_contents")String vsr_contents,@Param("list")ArrayList<Integer> vsr_num);
	public int updateVsr_Chkin(@Param("vsr_chkin")String vsr_chkin,@Param("list")ArrayList<Integer> vsr_num);
	public int delete(int vsr_num);
	public VisitSitterReservation selectByVsrnum(int vsr_num);
	public List<VisitSitterReservation> selectByCnum(int c_num);
	public List<VisitSitterReservation> selectByVSnum(int vs_num);
//	public VisitSitterReservation selectByResInfo(VisitSitterReservation vsr);
	public List<VisitSitterReservation> selectAll();

}

package com.what.carezoo.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.what.carezoo.model.VisitSitterReservation;

public interface VisitSitterReservationDao {
	
	public int insert(VisitSitterReservation vsr);
	public int update(VisitSitterReservation vsr);
	public int update2(VisitSitterReservation vsr);
	public int updateTotalPrice(@Param("vsr_totalPrice")String vsr_totalPrice,@Param("list")ArrayList<Integer> vsr_num);
	public int updateContents(@Param("vsr_attention")String vsr_attention,@Param("vsr_contents")String vsr_contents,@Param("list")ArrayList<Integer> vsr_num);
	public int updateVsr_Chkin(@Param("vsr_chkin")String vsr_chkin,@Param("list")ArrayList<Integer> vsr_num);
	public int updateVsrCount(int c_num);
	public int delete(int vsr_num);
	public int deleteByListVsrNum(@Param("list")ArrayList<Integer> vsr_num);
	public int deleteByC_num(int c_num);
	public VisitSitterReservation selectByVsrnum(int vsr_num);
	public int selectByVsrnum0_6(Map<String, Object> param);
	public int countC_num(int c_num);
	
	public List<VisitSitterReservation> selectByVsrnumbers(@Param("list")ArrayList<Integer> vsr_num);
	public List<VisitSitterReservation> selectByCnum(int c_num);
	public List<VisitSitterReservation> selectByVSnum(int vs_num);
//	public VisitSitterReservation selectByResInfo(VisitSitterReservation vsr);
	public List<VisitSitterReservation> selectByVsrCount(int vsr_count);
	public List<VisitSitterReservation> selectAll();
	
	public List<VisitSitterReservation>getVsrByStatus7();
	public List<VisitSitterReservation>getVsrByStatus0_6();
	
	public List<Map<String, Object>> getVsrGroup(@Param("c_num")int c_num, @Param("vsr_count") int vsr_count);
	
	public List<VisitSitterReservation> checkDate7(Map<String, Object> param);
	public List<VisitSitterReservation> checkDate0_6(Map<String, Object> param);
	
	public int acceptVsr7(Map<String, Object> param);
	public int acceptVsr0_6(Map<String, Object> param);
	
	public List<Map<String, Object>> getMyResDay7(int vs_num);
	public List<Map<String, Object>> getMyResDay0_6(int vs_num);
	//중복예약 방지
	public int selectByP_numVsr_chkin(Map<String, Object> param);
	
	public List<Map<String, Object>> getVSRInfo(int c_cum);
	

}

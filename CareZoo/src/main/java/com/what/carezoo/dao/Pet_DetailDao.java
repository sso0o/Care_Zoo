package com.what.carezoo.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

import com.what.carezoo.model.Pet_Detail;
import com.what.carezoo.model.Pet_Details;

public interface Pet_DetailDao {
//	public int insertPet_DetailDao(Pet_Detail pet_detail);
//	public int insertPet_DetailDao2(Pet_Details pet_detail);
//	public int deletePet_Detail(@Param("pd_week")String pd_week,@Param("pd_hAdd")String pd_hAdd);
//	public List<Pet_Detail> selectByP_Num(@Param("list")List<Integer> list,@Param("c_num")int c_num);
//	public List<Pet_Detail> selectByWeek(List<String> pd_week);
//	public List<Pet_Detail> selectByC_Num(int c_num);
//	//delete ajax
//	public List<Pet_Detail> selectByWeeks2(@Param("set")Set<String> pd_week,@Param("c_num")int c_num);
//	//add/change
//	public List<Pet_Detail> selectByWeeks3(@Param("list")List<String> pd_week,@Param("c_num")int c_num);
//	//update - pd_hour, pd_hAdd
//	public int updatePet_Detail(@Param("pd_hour")String pd_hour,@Param("pd_hAdd")String pd_hAdd,@Param("pd_week")String pd_week);
	
	public int insertPet_Detail(@Param("vsr_num")int vsr_num, @Param("p_num")int p_num, @Param("c_num")int c_num);
	public int deletePet_Detail(int vsr_num);
	public int deleteByListVsr_num(@Param("list")ArrayList<Integer> vsr_num);
	public int deleteByC_num(int c_num);
	
	public List<Pet_Detail> selectByVsr_Num(int vsr_num);
	public List<Pet_Detail> selectByC_num(int c_num);
	
	public List<Map<String, Object>> getVsrInfo7();
	public List<Map<String, Object>> getVsrInfo0_6();
	
//	public int petCountGroupResNum(int vsr_num);
}

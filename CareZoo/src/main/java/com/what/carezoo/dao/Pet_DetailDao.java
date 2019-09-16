package com.what.carezoo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.what.carezoo.model.Pet_Detail;
import com.what.carezoo.model.Pet_Details;

public interface Pet_DetailDao {
	public int insertPet_DetailDao(Pet_Detail pet_detail);
	public int insertPet_DetailDao2(Pet_Details pet_detail);
	public int deletePet_Detail(String pd_week);
	public List<Pet_Detail> selectByP_Num(@Param("list")List<Integer> list,@Param("c_num")int c_num);
	public List<Pet_Detail> selectByWeek(List<String> pd_week);
}

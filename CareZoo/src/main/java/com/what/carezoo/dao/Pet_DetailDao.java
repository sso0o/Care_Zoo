package com.what.carezoo.dao;

import java.util.List;

import com.what.carezoo.model.Pet_Detail;

public interface Pet_DetailDao {
	public int insertPet_DetailDao(Pet_Detail pet_detail);
	public List<Pet_Detail> selectByP_Num(List<Integer> list);
	
}

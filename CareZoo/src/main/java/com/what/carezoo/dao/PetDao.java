package com.what.carezoo.dao;

import java.util.List;

import com.what.carezoo.model.Pet;

public interface PetDao {
	
	public int insertPet(Pet pet);
	public int updatePet(Pet pet);
	public int deletePet(Pet pet);
	public Pet selectPet(int p_num);
	public List<Pet> selectAllPet();
	public List<Pet> selectByC_Num(int c_num);
	public List<Pet> selectChoiceByP_Num(int p_num);
	public List<Pet> selectOnlyNameByP_Num(List<Integer> p_num);

}

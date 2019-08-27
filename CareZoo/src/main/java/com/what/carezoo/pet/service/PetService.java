package com.what.carezoo.pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.PetDao;
import com.what.carezoo.model.Pet;


@Service
public class PetService {
	
	@Autowired
	private PetDao petDao;
	
	public boolean insertPet(Pet pet) {
		if(petDao.insertPet(pet)>0) {
			return true;
		}
		return false;
	}
	
	public boolean updatePet(Pet pet) {
		if(petDao.updatePet(pet)>0) {
			return true;
		}
		return false;
	}
	
	public boolean deletePet(Pet pet) {
		if(petDao.deletePet(pet)>0) {
			return true;
		}return false;
	}
	
	public Pet selectPet(int num) {
		return petDao.selectPet(num);
	}
	
	public List<Pet> selectAllPet(){
		return petDao.selectAllPet();
	}
	
}

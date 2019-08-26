package com.what.carezoo.hotel.service;

import java.util.List;


import com.what.carezoo.dao.PetHotelDao;
import com.what.carezoo.model.PetHotel;


public class PetHotelService {
	
	
	private PetHotelDao petHotelDao;
	
	public boolean addPetHotel(PetHotel ph) {
		if(petHotelDao.insert(ph)>0) {
			return true;
		}
		return false;
	}
	
	public boolean modifyPetHotel(PetHotel ph) {
		if(petHotelDao.update(ph)>0) {
			return true;
		}
		return false;
	}
	
	public boolean removePetHotel(PetHotel ph) {
		if(petHotelDao.delete(ph)>0) {
			return true;
		}
		return false;
	}
	
	public PetHotel getPetHotelbyNum(int num) {
		return petHotelDao.selectOne(num);
	}
	
	public List<PetHotel> getAllPetHotel() {
		return petHotelDao.selectAll();
	}

}

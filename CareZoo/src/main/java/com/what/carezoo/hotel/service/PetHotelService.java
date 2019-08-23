package com.what.carezoo.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.hotel.dao.PetHotelDao;
import com.what.carezoo.model.PetHotel;

@Service
public class PetHotelService {
	
	@Autowired
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

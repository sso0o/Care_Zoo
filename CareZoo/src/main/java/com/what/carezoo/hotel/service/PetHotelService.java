package com.what.carezoo.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.PetHotelDao;
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
	
	public boolean removePetHotel(int ph_num) {
		if(petHotelDao.delete(ph_num)>0) {
			return true;
		}
		return false;
	}
	
	public PetHotel getPetHotelbyNum(int ph_num) {
		return petHotelDao.selectOne(ph_num);
	}
	
	public List<PetHotel> getAllPetHotel() {
		return petHotelDao.selectAll();
	}

}

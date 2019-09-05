package com.what.carezoo.hotel.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.PetHotelReservationDao;
import com.what.carezoo.model.PetHotelReservation;

@Service
public class PetHotelReservationService {
	
	@Autowired
	private PetHotelReservationDao petHotelResDao;
	
	public boolean addPetHotelRes(PetHotelReservation phr) {
		if(petHotelResDao.insert(phr) > 0) {
			return true;
		}
		return false;
	}
	
	public boolean modifyPetHotelRes(PetHotelReservation phr) {
		if(petHotelResDao.update(phr) > 0) {
			return true;
		}
		return false;
	}
	
	public boolean removePetHotelRes(PetHotelReservation phr) {
		if(petHotelResDao.delete(phr) > 0) {
			return true;
		}
		return false;
	}
	
	public PetHotelReservation getPetHotelRes(int ph_num) {
		return petHotelResDao.selectOne(ph_num);
	}
	
	public List<PetHotelReservation> getAllPetHotelRes() {
		return petHotelResDao.selectAll();
	}

}

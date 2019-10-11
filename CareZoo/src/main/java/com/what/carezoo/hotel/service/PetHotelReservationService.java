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

	public boolean deleteByC_num(int c_num) {
		if(petHotelResDao.deleteByC_num(c_num)>0) {
			return true;
		}
		return false;
	}
	
	public PetHotelReservation getPetHotelResByNum(int phr_num) {
		return petHotelResDao.selectByPhrnum(phr_num);
	}
	
	public PetHotelReservation getPetHotelResByResInfo(PetHotelReservation phr) {
		return petHotelResDao.selectByResInfo(phr);
	}
	
	public List<PetHotelReservation> getPetHotelResByCnum(int c_num) {
		return petHotelResDao.selectByCnum(c_num);
	}
	public List<PetHotelReservation> getPetHotelResByPhrm_num(int phrm_num) {
		return petHotelResDao.selectByPhrm_num(phrm_num);
	}
	
	public List<PetHotelReservation> getAllPetHotelRes() {
		return petHotelResDao.selectAll();
	}

}

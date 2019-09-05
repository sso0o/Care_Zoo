package com.what.carezoo.hotel.service;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.PetHotelReservationDao;
import com.what.carezoo.model.PetHotelReservation;

@Service
public class PetHotelReservationService {
	
	@Autowired
	private PetHotelReservationDao petHotelResDao;
	
	public boolean addPetHotelRes() {
		return false;
	}
	
	public boolean modifyPetHotelRes() {
		return false;
	}
	
	public boolean removePetHotelRes() {
		return false;
	}
	
	public PetHotelReservation getPetHotelRes() {
		return null;
	}
	
	public List<PetHotelReservation> getAllPetHotelRes() {
		return null;
	}

}

package com.what.carezoo.pet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.PetDao;


@Service
public class PetService {
	
	@Autowired
	private PetDao pdao;

}

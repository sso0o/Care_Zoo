package com.what.carezoo.pet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.Pet_DetailDao;
import com.what.carezoo.model.Pet_Detail;

@Service
public class Pet_DetailService {

	@Autowired
	private Pet_DetailDao pdDao;
	
	public boolean insertPet_Detail(Pet_Detail pd) {
//		Pet_Detail pd = new Pet_Detail();
//		pd.setP_num(p_num);
//		pd.setPd_hAdd(pd_hAdd);
//		pd.setPd_hour(pd_hour);
//		pd.setPd_num(pd_num);
//		pd.setPd_week(pd_week);	
		if(pdDao.insertPet_DetailDao(pd)>0) {
			return true;
		}
		return false;
	}
}

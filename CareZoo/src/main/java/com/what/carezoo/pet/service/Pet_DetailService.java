package com.what.carezoo.pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.Pet_DetailDao;
import com.what.carezoo.model.Pet_Detail;
import com.what.carezoo.model.Pet_Details;

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
	public boolean insertPet_Detail2(Pet_Details pd) {

		if(pdDao.insertPet_DetailDao2(pd)>0) {
			return true;
		}
		return false;
	}
	
	public boolean deletePet_Detail(String pd_week,String pd_hAdd) {
		if(pdDao.deletePet_Detail(pd_week,pd_hAdd)>0) {
			return true;
		}
		return false;
	}
	
	public List<Pet_Detail> selectByP_Num(List<Integer> p_num,int c_num){
		return pdDao.selectByP_Num(p_num, c_num);
	}
	
	public List<Pet_Detail> selectByWeek(List<String> pd_week){
		return pdDao.selectByWeek(pd_week);
	}
	
	public List<Pet_Detail> selectByC_Num(int c_num){
		return pdDao.selectByC_Num(c_num);
	}

}

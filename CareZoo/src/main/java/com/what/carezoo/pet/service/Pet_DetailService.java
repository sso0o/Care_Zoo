package com.what.carezoo.pet.service;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.Pet_DetailDao;
import com.what.carezoo.model.Pet_Detail;
import com.what.carezoo.model.Pet_Details;

@Service
public class Pet_DetailService {

	@Autowired
	private Pet_DetailDao pdDao;
	
	public boolean insertPet_Detail(int vsr_num, int p_num, int c_num) {
		if(pdDao.insertPet_Detail(vsr_num, p_num, c_num)>0) {
			return true;
		}
		return false;
	}
	
	public List<Pet_Detail> selectByVsr_Num(int vsr_num){
		return pdDao.selectByVsr_Num(vsr_num);
	}
	
	public List<Pet_Detail> selectByC_num(int c_num){
		return pdDao.selectByC_num(c_num);
	}
	
	
	
//	public boolean insertPet_Detail(Pet_Detail pd) {
////		Pet_Detail pd = new Pet_Detail();
////		pd.setP_num(p_num);
////		pd.setPd_hAdd(pd_hAdd);
////		pd.setPd_hour(pd_hour);
////		pd.setPd_num(pd_num);
////		pd.setPd_week(pd_week);	
//		if(pdDao.insertPet_DetailDao(pd)>0) {
//			return true;
//		}
//		return false;
//	}
//	public boolean insertPet_Detail2(Pet_Details pd) {
//
//		if(pdDao.insertPet_DetailDao2(pd)>0) {
//			return true;
//		}
//		return false;
//	}
//	
//	public boolean deletePet_Detail(String pd_week,String pd_hAdd) {
//		if(pdDao.deletePet_Detail(pd_week,pd_hAdd)>0) {
//			return true;
//		}
//		return false;
//	}
//	
//	public List<Pet_Detail> selectByP_Num(List<Integer> p_num,int c_num){
//		return pdDao.selectByP_Num(p_num, c_num);
//	}
//	
//	public List<Pet_Detail> selectByWeek(List<String> pd_week){
//		return pdDao.selectByWeek(pd_week);
//	}
//	
//	public List<Pet_Detail> selectByC_Num(int c_num){
//		return pdDao.selectByC_Num(c_num);
//	}
//
//	public List<Pet_Detail> selectByWeek2(Set<String> pd_week,int c_num){
//		return pdDao.selectByWeeks2(pd_week,c_num);
//	}
//	
//	public List<Pet_Detail> selectByWeek3(List<String> pd_week,int c_num){
//		return pdDao.selectByWeeks3(pd_week,c_num);
//	}
//	
//	public boolean updatePet_Detail(String pd_hour,String pd_hAdd,String pd_week){
//		if(pdDao.updatePet_Detail(pd_hour, pd_hAdd, pd_week)>0) {
//			return true; 
//		}
//		return false;
//	}
}

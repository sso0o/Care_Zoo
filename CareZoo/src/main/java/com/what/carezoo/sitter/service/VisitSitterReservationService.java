package com.what.carezoo.sitter.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.VisitSitterReservationDao;
import com.what.carezoo.model.VisitSitterReservation;

@Service
public class VisitSitterReservationService {
	
	@Autowired
	private VisitSitterReservationDao vsrDao;
	
	public boolean insertVisitSitterReservation(VisitSitterReservation vsr) {
		if(vsrDao.insert(vsr)>0) {
			return true;
		}
		return false;
	}
	
	public boolean updateVisitSitterReservation(String vsr_hour,String vsr_hAdd,String vsr_chkin,int vsr_count) {
		VisitSitterReservation list = new VisitSitterReservation();
		System.out.println("ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ"+vsr_hour);
		System.out.println((vsr_hAdd));
		System.out.println(vsr_chkin);
		System.out.println("ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ"+vsr_count);
		list.setVsr_hour(vsr_hour);
		list.setVsr_hAdd(vsr_hAdd);
		list.setVsr_chkin(vsr_chkin);
		list.setVsr_count(vsr_count);
		if(vsrDao.update(list)>0) {
			return true;
		}
		return false;
	}
	
	public boolean updateVisitSitterReservation2(String vsr_hour,String vsr_hAdd,String vsr_day,int vsr_count) {
		VisitSitterReservation list = new VisitSitterReservation();
		list.setVsr_hAdd(vsr_hAdd);
		list.setVsr_hour(vsr_hour);
		list.setVsr_day(vsr_day);
		list.setVsr_count(vsr_count);
		if(vsrDao.update2(list)>0) {
			return true;
		}
		return false;
	}
	
	public boolean updateTotalPrice(String vsr_totalPrice,ArrayList<Integer> vsr_num) {
		if(vsrDao.updateTotalPrice(vsr_totalPrice,vsr_num)>0) {
			return true;
		}
		return false;
	}
	
	public boolean updateContents(String vsr_attention,String vsr_contents,ArrayList<Integer> vsr_num) {
		if(vsrDao.updateContents(vsr_attention, vsr_contents, vsr_num)>0) {
			return true;
		}
		return false;
	}
	
	public boolean updateVsr_Chkin(String vsr_chkin,ArrayList<Integer> vsr_num) {
		if(vsrDao.updateVsr_Chkin(vsr_chkin, vsr_num)>0) {
			return true;
		}
		return false;
	}
	
	public boolean updateVsrCount(int c_num) {
		if(vsrDao.updateVsrCount(c_num)>0) {
			return true;
		}
		return false;
	}
	
	
	public boolean deleteVisitSitterReservation(int vsr_num) {
		if(vsrDao.delete(vsr_num)>0) {
			return true;
		}
		return false;
	}

	public boolean deleteByListVsrNum(ArrayList<Integer> vsr_num) {
		if(vsrDao.deleteByListVsrNum(vsr_num)>0) {
			return true;
		}
		return false;
	}
	
	public boolean deleteByC_num(int c_num) {
		if(vsrDao.deleteByC_num(c_num)>0) {
			return true;
		}
		return false;
	}

	public VisitSitterReservation getVisitSitterResByVsrnum(int vsr_num) {
		return vsrDao.selectByVsrnum(vsr_num);
	}
	
	public List<VisitSitterReservation> selectByVsrnumbers(ArrayList<Integer> vsr_num){
		return vsrDao.selectByVsrnumbers(vsr_num);
	}
	
	
	public List<VisitSitterReservation> getVisitSitterResByCnum(int c_num) {
		return vsrDao.selectByCnum(c_num);
	}
	
	public List<VisitSitterReservation> getVisitSitterResByVSnum(int vs_num) {
		return vsrDao.selectByVSnum(vs_num);
	}
	
	
	public List<VisitSitterReservation> getAllVisitSitterRes() {
		return vsrDao.selectAll();
	}
	
	public List<VisitSitterReservation> selectByVsrCount(int vsr_count){
		return vsrDao.selectByVsrCount(vsr_count);
	}
	
	//일반예약 가져오기(수락 전)
	public List<VisitSitterReservation> getVsrByStatus0(){
		return vsrDao.getVsrByStatus7();
	}
	//정기예약 가져오기(수락 전)
	public List<VisitSitterReservation> getVsrByStatus0Day(){
		return vsrDao.getVsrByStatus0_6();
	}
	
	//정기 묶음 가져오기
	public List<Map<String, Object>> getVsrGroup(int c_num, int vsr_count) {
		System.out.println("in service"+c_num+" "+vsr_count);
		return vsrDao.getVsrGroup(c_num, vsr_count);
	}
	
	//중복예약 체크(일반)
	public List<VisitSitterReservation> checkDate7(int vs_num, String vsr_chkin) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("vs_num", vs_num);
		param.put("vsr_chkin", vsr_chkin);
		List<VisitSitterReservation> list = vsrDao.checkDate7(param);
		System.out.println("list : "+list);
		return list;
	}
	
	//중복예약 체크(정기)
	public List<VisitSitterReservation> checkDate0_6(int vs_num, String a,String b,String c,String d) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("vs_num", vs_num);
		param.put("a", a);
		param.put("b", b);
		param.put("c", c);
		param.put("d", d);
		List<VisitSitterReservation> list = vsrDao.checkDate0_6(param);
		return list;
	}
	
	
	//예약 수락(일반)
	public boolean acceptVsr7(int vs_num, int vsr_num) {
		int rst = 0;
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("vsr_num", vsr_num);
		param.put("vs_num", vs_num);
		if(vsrDao.selectByVsrnum(vsr_num).getVs_num() == 0) {			
			rst = vsrDao.acceptVsr7(param);
		}
		if(rst>0) {
			return true;
		}
		
		return false;
	}
	
	//예약 수락 (정기)
	public boolean acceptVsr0_6(int vs_num, int a, int b, int c, int d) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("vs_num",vs_num);
		param.put("a",a);
		param.put("b",b);
		param.put("c",c);
		param.put("d",d);
		if(vsrDao.selectByVsrnum0_6(param)==0 && vsrDao.acceptVsr0_6(param)==4) {
			return true;
		}
		return false;
	}
	
	//내 예약 가져오기(일반)
	public List<Map<String, Object>> getMyResDay7(int vs_num) {
		List<Map<String, Object>> rst = vsrDao.getMyResDay7(vs_num);
		return rst;
	}
	
	
	//내 예약 가져오기 (정기)
	public List<Map<String, Object>> getMyResDay0_6(int vs_num) {
		List<Map<String, Object>> rst = vsrDao.getMyResDay0_6(vs_num);
		return rst;
	}
	
	//중복예약 방지
	public int selectByP_numVsr_chkin(int p_num,String vsr_chkin){
		Map<String, Object> param = new HashMap<String, Object>();
			param.put("p_num", p_num);
			param.put("vsr_chkin", vsr_chkin);
			
		return vsrDao.selectByP_numVsr_chkin(param);
	}
	
	public List<Map<String, Object>> getVSRInfo(int c_num){
		return vsrDao.getVSRInfo(c_num);
	}
	
	public int countC_num(int c_num) {
		return vsrDao.countC_num(c_num);
	}
	
	public Map<String, Object> getModalC(int vsr_num) {
		return vsrDao.getModalC(vsr_num);
	}

}

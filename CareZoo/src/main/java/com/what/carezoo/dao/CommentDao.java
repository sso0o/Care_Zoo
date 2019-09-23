package com.what.carezoo.dao;

import java.util.Map;

import com.what.carezoo.model.HomeSitterComment;
import com.what.carezoo.model.PetHotelComment;
import com.what.carezoo.model.ViSitSitterComment;

public interface CommentDao {
	
	public int commentChkHSC(int hsr_num);
	public int commentChkVSC(int vsr_num);
	public int commentChkPHC(int phr_num);
	
	public int insertHSC(HomeSitterComment hsc);
	public int insertVSC(ViSitSitterComment vsc);
	public int insertPHC(PetHotelComment phc);
	
	public int updateHSC(HomeSitterComment hsc);
	public int updateVSC(ViSitSitterComment vsc);
	public int updatePHC(PetHotelComment phc);
	
	public int deleteHSC(HomeSitterComment hsc);
	public int deleteVSC(ViSitSitterComment vsc);
	public int deletePHC(PetHotelComment phc);
	
	public HomeSitterComment selectHSCByHSCnum(int hsc_num);
	public ViSitSitterComment selectVSCByVSCnum(int vsc_num);
	public PetHotelComment selectPHCByPHCnum(int phc_num);
	
	public int HSCinsertFile(Map<String,Object> param);
	public int VSCinsertFile(Map<String,Object> param);
	public int PHCinsertFile(Map<String,Object> param);
	
	public Double getStarHS(int hs_num);
	public Double getStarVS(int vs_num);
	public Double getStarPH(int ph_num);
}

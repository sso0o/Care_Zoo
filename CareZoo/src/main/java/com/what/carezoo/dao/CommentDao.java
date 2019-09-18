package com.what.carezoo.dao;

import com.what.carezoo.model.HomeSitterComment;
import com.what.carezoo.model.PetHotelComment;
import com.what.carezoo.model.ViSitSitterComment;

public interface CommentDao {
	
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

}

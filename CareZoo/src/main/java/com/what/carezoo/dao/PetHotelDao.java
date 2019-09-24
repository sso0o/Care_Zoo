package com.what.carezoo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.what.carezoo.model.PetHotel;
import com.what.carezoo.model.PetHotelRoom;

public interface PetHotelDao {
	
	public int insert(PetHotel ph);
	public int update(PetHotel ph);
	public int delete(int ph_num);
	public PetHotel selectOne(int ph_num);
	public List<PetHotel> selectAll();
	public List<PetHotel> search(@Param("list")List<String> ph_address, @Param("ph")PetHotel ph);
	public List<PetHotelRoom> selectPhRoomByPh_num(int ph_num);
	
	public List<PetHotelRoom> DetailPhRoomByDate(@Param("phr_chkin")String phr_chkin, 
												@Param("phr_chkout")String phr_chkout, 
												@Param("ph_num")int ph_num);
	
	public PetHotelRoom selectPhRoomByPhrm_num(int phrm_num);
	public int insertFile(Map<String,Object> param);
	public String selectFileName(int ph_num);
	public List<String> selectFileList(int ph_num);

}

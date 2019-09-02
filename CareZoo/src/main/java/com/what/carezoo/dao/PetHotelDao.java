package com.what.carezoo.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.what.carezoo.model.PetHotel;

public interface PetHotelDao {
	
	public int insert(PetHotel ph);
	public int update(PetHotel ph);
	public int delete(int ph_num);
	public PetHotel selectOne(int ph_num);
	public List<PetHotel> selectAll();
	public int insertFile(Map<String,Object> param);
	public String selectFileName(int ph_num);
	public List<String> selectFileList(int ph_num);

}

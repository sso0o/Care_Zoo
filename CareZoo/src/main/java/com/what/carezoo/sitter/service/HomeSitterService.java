package com.what.carezoo.sitter.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.what.carezoo.dao.HomeSitterDao;
import com.what.carezoo.dao.HomeSitterListDao;
import com.what.carezoo.model.HomeSitter;
import com.what.carezoo.model.HomeSitterList;

@Service
public class HomeSitterService {
	
	
	private static final String UPLOAD_PATH = "c:\\temp";
	@Autowired
	private HomeSitterDao hsDao;
	@Autowired
	private HomeSitterListDao hslDao;
	//homesitter
	public boolean addHomeSitter(HomeSitter hs) {
		return false;
		
	}
	
	public boolean modifyHomeSitter(HomeSitter hs) {
		return false;
		
	}
	
	public boolean deleteHomeSitter(HomeSitter hs) {
		return false;
		
	}
	
	public HomeSitter getHomeSitterByNum(int hs_num) {
		return hsDao.selectOneByNum(hs_num);		
	}
	
	public HomeSitter getHomeSitterByEmail(String hs_email) {
		return hsDao.selectOneByEmail(hs_email);
	}
	
	public List<HomeSitter> getAllHomeSitter(){
		return null;
	}
	
	//homesitterList
	public HomeSitterList getHomeSitterByHsl_Num(int hsl_num) {
		return hslDao.selectOnebyHsl_num(hsl_num);		
	}
	public boolean modifyHsl(HomeSitterList hsl) {
		if(hslDao.insertHsl(hsl)>0) {
			return true;
		}
		return false;
	}
	public List<HomeSitterList> getbySearchingHsl(List<String> hsl_address,HomeSitterList hsl){		
		return hslDao.selectAllHsl(hsl_address,hsl);
	}
	public List<HomeSitterList> getByHsl(HomeSitterList hsl){
		return hslDao.searchHsls(hsl);
	}
	public List<HomeSitterList> getallHsl(){
		return hslDao.selectHsl();
	}
	public String writeFile(MultipartFile file) {
		String fullName = null;
		UUID uuid = UUID.randomUUID();
		fullName = uuid.toString()+"_"+file.getOriginalFilename();
		File target = new File(UPLOAD_PATH,fullName);
		try {
			FileCopyUtils.copy(file.getBytes(), target);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("파일복사예외발생!");
		}
		return fullName;
	}	
}

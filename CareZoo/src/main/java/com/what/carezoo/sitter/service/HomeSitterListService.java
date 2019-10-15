package com.what.carezoo.sitter.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.what.carezoo.dao.HomeSitterListDao;
import com.what.carezoo.model.HomeSitterDisabledate;
import com.what.carezoo.model.HomeSitterList;
@Service
public class HomeSitterListService {
	
	private static final String UPLOAD_PATH = "c:\\temp";

	@Autowired
	private HomeSitterListDao hslDao;
	
	//게시글 등록
	public boolean writeHomeSitterList(HomeSitterList hsl) {
		if(hslDao.insertHomeSitterList(hsl)>0) {
			return true;
		}
		return false;
	}
	//Disable dates 등록
	public boolean writeDisableDates(Map<String, Object> params) {
		System.out.println("동작쓰");
		if(hslDao.updateDisDates(params)>0) {
			System.out.println("이거왜 동작안하지");
			return true;
		}
		return false;
	}
	//Disable dates 가져오기
	public List<String> getDisableDates(int hsl_num){
		return hslDao.selectDisdates(hsl_num);
	}
	
	
	//
	public boolean addHsl(HomeSitterList hsl, List<MultipartFile> files) {
		if(hslDao.insertHsl(hsl)>0) {
			System.out.println("게시글 등록 service");
			if(files.isEmpty()) {
				System.out.println("게시글 파일 없음");
				return true;
			}else {
				System.out.println("게시글 파일 있음");
				for(MultipartFile mf : files) {
					String fullName = writeFile(mf);
					System.out.println("fullName = "+fullName);
					Map<String, Object> fileParam = new HashMap<String, Object>();
					System.out.println(hsl.getHsl_num());
					fileParam.put("hsl_num", hsl.getHsl_num());
					fileParam.put("hsl_img_filename", fullName);
					if(hslDao.insertFile(fileParam)>0) {
						//insertfile에서 오류생기면 게시글도 안올라가게 막기
					}
				} 
			}
			return true;
		}
		return false;
	}
	public boolean addDisDates(int hsl_num, List<String> hsd_disabledate_list) {
		if(hsd_disabledate_list.isEmpty()) {
			System.out.println("hsd_disabledate_list 파일 없음");
			return true;
		}else {
			System.out.println("hsd_disabledate_list="+hsd_disabledate_list);
			for(String list : hsd_disabledate_list) {
				Map<String, Object> disDates = new HashMap<String, Object>();
				disDates.put("hsd_disabledate", list);
				disDates.put("hsl_num", hsl_num);
				hslDao.insertDisdates(disDates);				
			}
			return true;
		}
	}
	public Map<String, Object> getHomeSitterByHsl_Num(int hsl_num) {
		return hslDao.selectOnebyHsl_num(hsl_num);		
	}
	public boolean modifyHsl(HomeSitterList hsl) {
		if(hslDao.insertHsl(hsl)>0) {
			return true;
		}
		return false;
	}
//	public List<HomeSitterList> getbySearchingHsl(List<String> hsl_address,HomeSitterList hsl){		
//		return hslDao.selectAllHsl(hsl_address,hsl);
//	}
	public List<Map<String,Object>> getbySearchingHsl(List<String> hs_address,HomeSitterList hsl){		
		return hslDao.selectAllHsl(hs_address,hsl);
	}
	public Map<String, Object> getallHsl(int hsl_num){
		return hslDao.selectHsl(hsl_num);
	} 
	public List<Map<String, Object>> getHsl(){
		return hslDao.selectallHsl();
	}
	public List<Map<String,Object>> getHsls(){
		return hslDao.selectHsls();
	}
	public String writeFile(MultipartFile file) {
		String fullName = null;
		UUID uuid = UUID.randomUUID(); // UUID만들어서 파일이름에 붙여서 저장할 파일명 생성
		fullName = uuid.toString()+"_"+file.getOriginalFilename();
		File target = new File(UPLOAD_PATH,fullName); //지정한 경로에 파일 만들고 받아온 파일의 내용을 복붙하는 방식으로 저장
		try {
			FileCopyUtils.copy(file.getBytes(), target);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("파일복사예외발생!");
			return null;
		}
		return fullName; //만든 파일명 반환
	}	
	
	public int updateHslAddress(HomeSitterList hsl) {
		return hslDao.updateAddressHsl(hsl);
	}
	
	//게시글 이미지 가져오기
	public List<String> getFileList(int hsl_num) {
		List<String> filesName = hslDao.selectFileList(hsl_num);
		return filesName;
	}
	public String getFile(int hsl_num) {
		String fileName = hslDao.selectFileName(hsl_num);
		return fileName;
	}
}

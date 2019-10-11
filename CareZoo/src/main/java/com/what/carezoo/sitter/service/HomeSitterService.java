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

import com.what.carezoo.dao.HomeSitterDao;
import com.what.carezoo.model.HomeSitter;

@Service
public class HomeSitterService {
	
	private static final String UPLOAD_PATH = "c:\\temp";

	@Autowired
	private HomeSitterDao hsDao;
	//homesitter
	public boolean addHomeSitter(HomeSitter hs) {
		return false;
		
	}
	
	public boolean modifyHomeSitter(HomeSitter hs, MultipartFile file) {
		System.out.println("hs서비스 동작??????");
		if(hsDao.updateHomeSitter(hs)>0) {
			if(file == null) {
				System.out.println("파일 없음");
				return true;	
			} else {
				String fullName = writeFile(file);
				System.out.println("fullname : "+fullName);
				Map<String, Object> fileParam = new HashMap<String, Object>();
				fileParam.put("hs_num", hs.getHs_num());
				fileParam.put("hs_filename", fullName);
				if(getImage(hs.getHs_num()) != null) {
					if(hsDao.updateFile(fileParam)>0) {
						return true;
					} else return false;
				} else {
					if(hsDao.updateFile(fileParam) > 0) {
						return true;
					}
				}					
			}
		}
		return false;
		
	}
	
	public boolean deleteHomeSitter(int hs_num) {
		if(hsDao.deleteHomeSitter(hs_num)>0) {
			return true;
		}
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
	//아이디 체크
	public int userIdCheck(String hs_email) {
		System.out.println("서비스 동작?"+hs_email);
		return hsDao.homeSitterIdCheck(hs_email);
	}

	public boolean joinHomeSitter(Map<String, Object> params) {
		int rst = hsDao.insertHomeSitter(params);
		if(rst>0) {
			return true;
		}
		return false;
	}
	private String writeFile(MultipartFile file) {
		String fullName = null;
		// 1.UUID 만들고, 파일이름에 붙여서 저장할 파일명 생성
		UUID uuid = UUID.randomUUID();
		fullName = uuid.toString() + "_" + file.getOriginalFilename();
		// 2. 파일저장(지정한 경로에 파일을 만들고, 받아온 파일의 내용을 복사)
		File target = new File(UPLOAD_PATH, fullName); // 비어있는 파일 하나 만들어진 것
		try {
			FileCopyUtils.copy(file.getBytes(), target);
		} catch (IOException e) {
			System.out.println("파일 복사 예외 발생!!");
			e.printStackTrace();
			return null;
		}
		// 3. 만든 파일 이름 반환
		return fullName;
	}
	
	public int updateHsAddress(HomeSitter hs) {
		return hsDao.updateAddressHs(hs);
	}
	
	public String  getImage(int hs_num) {
		return hsDao.selectFile(hs_num);
	}
	//email찾기
	public String findHs_email(String hs_name,String hs_contact){
		return hsDao.findHs_email(hs_name,hs_contact);
	}
	public int findHs_emailCount(String hs_name,String hs_contact){
		return hsDao.findHs_emailCount(hs_name,hs_contact);
	}
}

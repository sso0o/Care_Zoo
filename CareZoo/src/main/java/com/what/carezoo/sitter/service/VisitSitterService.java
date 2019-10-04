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

import com.what.carezoo.dao.VisitSitterDao;
import com.what.carezoo.model.Customer;
import com.what.carezoo.model.Pet;
import com.what.carezoo.model.VisitSitter;

@Service
public class VisitSitterService {
	
	@Autowired
	private VisitSitterDao vsDao;
	
	private static final String UPLOAD_PATH = "c:\\temp";
	
	public boolean addVisitSitter(VisitSitter vs) {
		return false;
		
	}
	
	public boolean modifyVisitSitter(VisitSitter vs) {
		return false;
		
	}
	
	public boolean deleteVisitSitter(VisitSitter vs) {
		return false;
		
	}
	
	public VisitSitter getVisitSitterByNum(int vs_num) {
		return vsDao.selectOneByNum(vs_num);
		
	}
	
	public VisitSitter getVisitSitterByEmail(String vs_email) {
		return vsDao.selectOneByEmail(vs_email);
	}
	
	public List<VisitSitter> getAllVisitSitter(){
		return vsDao.selectAllVisitSitter();
	}
	
	//아이디 체크
	public int userIdCheck(String vs_email) {
		return vsDao.userIdCheck(vs_email);
	}
	//가입
	public boolean joinVisitSitter(VisitSitter visitsitter) {
		int rst = vsDao.insertVisitSitter(visitsitter);
		if(rst>0) {
			return true;
		}
		return false;
	}
	
	public boolean insertVisitSitterFile(VisitSitter vs, MultipartFile file) {
		Map<String, Object> param = new HashMap<String, Object>();
		if(vsDao.insertVisitSitter(vs) > 0) {
			if(file == null) {
				return true;
			} else {
				String fullName = writeFile(file);
				System.out.println("fullname : "+fullName);
				param.put("vs_img", fullName);
				param.put("vs_num", vs.getVs_num());
				if(vsDao.updateVisitSitterFile(param) > 0) {
					return true;
				}
			}
		} return false;
		
		
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
}

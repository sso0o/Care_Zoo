package com.what.carezoo.hotel.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

import com.what.carezoo.dao.PetHotelDao;
import com.what.carezoo.model.DownloadView;
import com.what.carezoo.model.PetHotel;



@Transactional
@Service
public class PetHotelService {
	
	private static final String UPLOAD_PATH="c:\\temp";
	
	@Autowired
	private PetHotelDao petHotelDao;
	
	public boolean addPetHotel(PetHotel ph,MultipartFile file) {
		if(petHotelDao.insert(ph)>0) {
			if(file.isEmpty()) {
				return true;
			}else {
				String fullName = writeFile(file);
				Map<String,Object> fileParam = new HashMap<String,Object>();
				fileParam.put("ph_num",ph.getPh_num());
				fileParam.put("ph_fileName",fullName);
				if(petHotelDao.insertFile(fileParam)>0) {			
					//file업로드 안됐는디 게시글이 올려지는 게 이상함. 그래서 트랜잭션 적용 ㄱ_ㄱ
					//트랜잭션:
					//insertFile이 실행되지 않았을 때  insertBoard도 실행되지 않게 해라!
					return true;
				}
			}
		}
		return false;
	}
	public String writeFile(MultipartFile file) {
		String fullName= null;
		//1.UUID 만들고, 파일이름에 붙여서 저장할 파일명 생성
		UUID uuid = UUID.randomUUID();
		fullName=uuid.toString()+"_"+file.getOriginalFilename();
		//2. 파일저장(지정한 경로에 파일을 만들고, 받아온 파일의 내용을 복사)
		File target = new File(UPLOAD_PATH,fullName); //비어있는 파일 하나 만들어진 것
		try {
			FileCopyUtils.copy(file.getBytes(), target);
		} catch (IOException e) {
			System.out.println("파일 복사 예외 발생!!");
			e.printStackTrace();
			return null;
		}	
		//3. 만든 파일 이름 반환
		return fullName;
	}
	public boolean modifyPetHotel(PetHotel ph) {
		if(petHotelDao.update(ph)>0) {
			return true;
		}
		return false;
	}
	
	public boolean removePetHotel(int ph_num) {
		if(petHotelDao.delete(ph_num)>0) {
			return true;
		}
		return false;
	}
	
	public PetHotel getPetHotelbyNum(int ph_num) {
		return petHotelDao.selectOne(ph_num);
	}
	
	public List<PetHotel> getAllPetHotel() {
		return petHotelDao.selectAll();
	}
	public int insertFile(Map<String,Object> param) {
		return 0;
	
	}
	public String selectFileName(int ph_num) {
		return null;
		
	}
	
	public View getAttachment(int ph_num) {
		//게시글 번호를 이용해서, 파일이름 얻어오고
		//파일이 저장된 경로에서 파일 얻어오기
		
		PetHotel petHotel = petHotelDao.selectOne(ph_num);
		String fileName= petHotel.getPh_fileName();
		//저장된 파일에 참조하기 위한 파일 객체생성
		File file = new File(UPLOAD_PATH,fileName);
		
		//View 만들어 내기 
		View view = new DownloadView(file);
		
		return view;
	}
	
}

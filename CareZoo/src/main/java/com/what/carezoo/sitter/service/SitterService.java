package com.what.carezoo.sitter.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.what.carezoo.model.HomeSitter;
import com.what.carezoo.model.VisitSitter;

@Service
public class SitterService {
	
	private static final String UPLOAD_PATH = "c:\\temp";
	
//	@Autowired
//	private HomeSitter hsService;
//	
//	@Autowired
//	private VisitSitter vsServive;
	
	
	
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

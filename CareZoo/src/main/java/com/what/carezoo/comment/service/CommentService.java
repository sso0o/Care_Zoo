package com.what.carezoo.comment.service;

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

import com.what.carezoo.dao.CommentDao;
import com.what.carezoo.model.HomeSitterComment;
import com.what.carezoo.model.PetHotelComment;
import com.what.carezoo.model.ViSitSitterComment;

@Service
public class CommentService {
	
	private static final String UPLOAD_PATH = "c:\\temp";

	@Autowired
	private CommentDao cDao;

	public boolean writeHSC(HomeSitterComment hsc) {
		if (cDao.insertHSC(hsc) > 0) {
			return true;
		}
		return false;
	}

	public boolean writeVSC(ViSitSitterComment vsc) {
		if (cDao.insertVSC(vsc) > 0) {
			return true;
		}
		return false;
	}

	public boolean writePHC(PetHotelComment phc, List<MultipartFile> files) {
		if (cDao.insertPHC(phc) > 0) {
			if (files.isEmpty()) {
				return true;
			} else {
				for (MultipartFile mf : files) {
					String fullName = writeFile(mf);
					Map<String, Object> fileParam = new HashMap<String, Object>();
					fileParam.put("phc_num", phc.getPhc_num());
					fileParam.put("phc_img_filename",fullName);
					if(cDao.HSCinsertFile(fileParam)>0) {
						return true;
					} else return false;
				}

			}
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

}

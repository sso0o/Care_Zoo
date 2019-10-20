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
	
	
	public Double getStarHS(int hs_num) {
		if(cDao.getStarHS(hs_num) == null) {
			return 0.0;
		}
		return cDao.getStarHS(hs_num);
	}
	
	public Double getStarVS(int vs_num) {
		if(cDao.getStarVS(vs_num) == null) {
			return 0.0;
		}
		return cDao.getStarVS(vs_num);
	}
	
	public Double getStarPH(int ph_num) {
		if(cDao.getStarPH(ph_num) == null) {
			return 0.0;
		}
		return cDao.getStarPH(ph_num);
	}
	
	
	
	public boolean commentChkHSC(int hsr_num) {
		if(cDao.commentChkHSC(hsr_num)==0) {
			return true;
		}
		return false;
	}
	
	public boolean commentChkVSC(int vsr_num) {
		if(cDao.commentChkVSC(vsr_num)==0) {
			return true;
		}
		return false;
	}
	
	public boolean commentChkPHC(int phr_num) {
		if(cDao.commentChkPHC(phr_num)==0) {
			return true;
		}
		return false;
	}
	
	public boolean writeHSC(HomeSitterComment hsc, List<MultipartFile> files) {
		System.out.println("넣기전 hsc_num"+hsc.getHsc_num());
		if (cDao.insertHSC(hsc) > 0) {
			System.out.println("넣고나서 hsc_num"+hsc.getHsc_num());
			if (files.isEmpty()) {
				return true;
			} else {
				System.out.println("파일이 있을경우ㅠ 일로 넘어오냐ㅑㅑㅑ");
				for (MultipartFile mf : files) {
					String fullName = writeFile(mf);
					Map<String, Object> fileParam = new HashMap<String, Object>();
					fileParam.put("hsc_num", hsc.getHsc_num());
					fileParam.put("hsc_img_filename",fullName);
					System.out.println(fileParam);
					if(cDao.HSCinsertFile(fileParam)>0) {
						return true;
					} else return false;
				}
			}
		}
		return false;
	}

	public boolean writeVSC(ViSitSitterComment vsc, List<MultipartFile> files) {
		System.out.println("넣기전 vsc_num"+vsc.getVsc_num());
		if (cDao.insertVSC(vsc) > 0) {
			System.out.println("넣고나서 vsc_num"+vsc.getVsc_num());
			if (files.isEmpty()) {
				return true;
			} else {
				System.out.println("파일이 있을경우ㅠ 일로 넘어오냐ㅑㅑㅑ");
				for (MultipartFile mf : files) {
					String fullName = writeFile(mf);
					Map<String, Object> fileParam = new HashMap<String, Object>();
					fileParam.put("vsc_num", vsc.getVsc_num());
					fileParam.put("vsc_img_filename",fullName);
					System.out.println(fileParam);
					if(cDao.VSCinsertFile(fileParam)>0) {
						return true;
					} else return false;
				}
			}
		}
		return false;
	}

	public boolean writePHC(PetHotelComment phc, List<MultipartFile> files) {
		System.out.println("넣기전 phc_num"+phc.getPhc_num());
		if (cDao.insertPHC(phc) > 0) {
			System.out.println("넣고나서 phc_num"+phc.getPhc_num());
			if (files.isEmpty()) {
				return true;
			} else {
				System.out.println("파일이 있을경우ㅠ 일로 넘어오냐ㅑㅑㅑ");
				for (MultipartFile mf : files) {
					String fullName = writeFile(mf);
					Map<String, Object> fileParam = new HashMap<String, Object>();
					fileParam.put("phc_num",phc.getPhc_num());
					fileParam.put("phc_img_filename",fullName);
					System.out.println(fileParam);
					if(cDao.PHCinsertFile(fileParam)>0) {
						return true;
					} else return false;
				}
			}
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
	
	public List<ViSitSitterComment> getmyCommentVsr(int vs_num) {
		return cDao.getmyCommentVsr(vs_num);
	}

}

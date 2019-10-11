package com.what.carezoo.pet.service;

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

import com.what.carezoo.dao.PetDao;
import com.what.carezoo.dao.Pet_DetailDao;
import com.what.carezoo.model.Pet;


@Service
public class PetService {
	
	private static final String UPLOAD_PATH = "c:\\temp";
	
	@Autowired
	private PetDao petDao;
	
	public boolean insertPetFile(Pet pet, MultipartFile file) {
		Map<String, Object> param = new HashMap<String, Object>();
		if(petDao.insertPet(pet) > 0) {
			if(file == null) {
				return true;
			} else {
				String fullName = writeFile(file);
				System.out.println("fullname : "+fullName);
				param.put("p_img", fullName);
				param.put("p_num", pet.getP_num());
				if(petDao.updatePetFile(param) > 0) {
					return true;
				}
			}
		} return false;
		
		
	}
	
	public boolean updatePet(Pet pet, MultipartFile file) {
		Map<String, Object> param = new HashMap<String, Object>();
		if(petDao.updatePet(pet)>0) {
			if(file == null) {
				return true;
			} else {
				String fullName = writeFile(file);
				System.out.println("fullname : "+fullName);
				param.put("p_img", fullName);
				param.put("p_num", pet.getP_num());
				if(petDao.updatePetFile(param) > 0) {
					return true;
				}
			}
		} return false;
	}
	
	public boolean insertPet(Pet pet) {
		if(petDao.insertPet(pet)>0) {
			return true;
		}
		return false;
	}
	
	public boolean updatePet(Pet pet) {
		if(petDao.updatePet(pet)>0) {
			return true;
		}
		return false;
	}
	
	public boolean deletePet(int p_num) {
		if(petDao.deletePet(p_num)>0) {
			return true;
		}return false;
	}
	
	public boolean deletePetByC_num(int c_num) {
		if(petDao.deletePetByC_num(c_num)>0) {
			return true;
		}
		return false;
	}
	
	public Pet selectPet(int p_num) {
		return petDao.selectPet(p_num);
	}
	
	public List<Pet> selectAllPet(){
		return petDao.selectAllPet();
	}
	public List<Pet> selectByC_Num(int c_num){
		return petDao.selectByC_Num(c_num);
	}

	public List<Pet> selectOnlyNameByP_Num(List<Integer> p_num){
		return petDao.selectOnlyNameByP_Num(p_num);
	}
	public int c_has_pet(int c_num) {
		return petDao.countPetByC_num(c_num);

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
	
	public String  getImage(int p_num) {
		return petDao.selectFile(p_num);
	}
}

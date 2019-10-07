package com.what.carezoo.pet.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.what.carezoo.model.Pet;
import com.what.carezoo.pet.service.PetService;

@Controller
@RequestMapping("/pet")
public class PetController {
	
	private static final String FILE_PATH = "c:/temp/";
	
	@Autowired
	private PetService pService;
	
	@RequestMapping(value = "/addPet", method = RequestMethod.POST)
	public String addPet(Pet p, MultipartHttpServletRequest mtfRequest, Model m, HttpSession session) {
		System.out.println("addPet 하나?");
		MultipartFile file = mtfRequest.getFile("file");
		System.out.println("file : " + file);
		System.out.println("p : "+p);
		int user_num = (Integer) session.getAttribute("user_num");
		boolean rst = pService.insertPetFile(p,file);
		if(rst) {
			m.addAttribute("msg", "펫 등록 성공!");
			m.addAttribute("pL", pService.selectByC_Num(user_num));
			return "my&customer/petInfo";
		} else {
			m.addAttribute("msg", "펫 등록 실패!");
			return "main";
		}

		
	}
	
	@ResponseBody
	@RequestMapping(value = "/image")
	public byte[] getImg(String fileName) {
		File file = new File(FILE_PATH + fileName);
		
		InputStream in = null;
		try {
			in = new FileInputStream(file);
			// 스트림을 byte[] 형태로 만들기 위해서 라이브러리 추가(CommonIO)
			return IOUtils.toByteArray(in);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(in != null) in.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	
	@RequestMapping("/modifyPetInfo")
	public String modifyPetInfo(int p_num, Model m) {
		System.out.println("펫수정 펫넘버ㅓㅓㅓㅓㅓㅓㅓㅓ--"+p_num);
		m.addAttribute("p_num", p_num);
		return "my&customer/checkUser";
		
	}
	
	@RequestMapping(value = "/modifyPet", method = RequestMethod.POST)
	public String modifyPet(Pet pet, MultipartHttpServletRequest mtfRequest, Model m) {
		System.out.println("펫수정 펫넘버ㅓㅓㅓㅓㅓㅓㅓㅓ--"+pet.getP_num());
		MultipartFile file = mtfRequest.getFile("file");
		System.out.println("file : " + file);
		
		boolean rst = pService.updatePet(pet, file);
		
		if(rst) {
			m.addAttribute("msg", "펫정보를 수정하였습니다");
			List<Pet> pL = pService.selectByC_Num(pet.getC_num());
			System.out.println(pL);
			m.addAttribute("pL", pL);
			return "my&customer/petInfo";
		} else {
			m.addAttribute("msg", "펫정보 수정 실패!");
			m.addAttribute("pet", pet);
			return "my&customer/modifyPetinfo";
		}
		
		
		
	}
	
	

}

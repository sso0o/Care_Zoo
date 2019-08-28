package com.what.carezoo.sitter.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.what.carezoo.model.HomeSitterList;
import com.what.carezoo.sitter.service.HomeSitterSearchingService;

@RequestMapping("home")
@Controller
public class HomeSitterController {
	@Autowired
	private HomeSitterSearchingService hssService;

	// 가정시터목록보여주는 메인 띄우기
	@RequestMapping("/main")
	public String enterHomeSitterMain() {
		return "sitter/home/homeSitterList";
	}

	// 가정시터 검색
	@RequestMapping("/search")
	public String searchHS(Model model, HomeSitterList hsl) {
		model.addAttribute("hslList", hssService.getbySearchingHsl(hsl));
		return "sitter/home/homeSitterList";
	}

	// 가정시터 게시글 등록
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeHs(Model model) {
		return "sitter/home/homeSitterPosting";
	}

//	public String getFolder() {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		Date date = new Date();
//		String str = sdf.format(date);
//		return str.replace("-", File.separator);
//	}
	@RequestMapping(value = "/uploadAjaxAction", method = RequestMethod.POST)
	public void uploadAjaxPost(MultipartFile[] uploadFile) {
		String uploadFolder = "C:\\";
		// make folder
//		File uploadPath = new File(uploadFolder, getFolder());
//		if(uploadPath.exists()==false) {
//			uploadPath.mkdir();
//		}
		for (MultipartFile multipartFile : uploadFile) {
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			File saveFile = new File(uploadFolder, uploadFileName);
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} // end for
	}

	@ResponseBody
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getFile(String fileName){
		File file = new File("c:\\"+fileName);
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}

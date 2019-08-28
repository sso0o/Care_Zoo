package com.what.carezoo.hotel.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/hotel")
public class HotelController {
	
	@RequestMapping("/main")
	public String showHotelMain() {
		return "hotel/hotelMain";
	}
	private static final String FILE_PATH = "c:/temp/";
	// controller/ImageController.java

	// 이미지 요청이 들어오면 해당하는 이미지를 반환 :view가 아니라 이미지 자체를 반환
	
	@ResponseBody
	@RequestMapping(value = "/image")
	public byte[] getImage(String fileName) {
		// 지정된 경로에서 이미지 읽어서 byte[]형태로 반환
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
}

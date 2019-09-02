package com.what.carezoo.hotel.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.what.carezoo.hotel.service.PetHotelService;
import com.what.carezoo.model.PetHotel;


@Controller
@RequestMapping("/petHotel")
public class PetHotelController {// 보호자 비동반 애견호텔 컨트롤러

	@Autowired
	private PetHotelService phService;
	private static final String FILE_PATH = "c:/temp/";

	// 펫호텔 목록보기
	@RequestMapping("/petHotelList")
	public String showPetHotelList(Model model) {
		List<PetHotel> hList = phService.getAllPetHotel();

		model.addAttribute("hList", hList);
		return "hotel/petHotelList";
	}

	// 펫호텔 예약폼
	@RequestMapping("/petHotelResForm")
	public String showPetHotelResForm() {
		return "hotel/petHotelResForm";
	}

	// 펫호텔 상세보기
	@RequestMapping("/petHotelView")
	public String showPetHotelView(Model model, @RequestParam("ph_num") int ph_num) {
		System.out.println(phService.getPetHotelbyNum(ph_num));
		model.addAttribute("pethotel", phService.getPetHotelbyNum(ph_num));
		return "hotel/petHotelView";
	}
	
	// 펫호텔 키워드로 선택
	@RequestMapping("/addressKeyword")
	public String addressKeyworkSelect(String keywork) {
		
		return null;
	}
	
	
	
	
	
	
//	"${contextPath}/image?ph_num=${pethotel.ph_num}&fileName=9eed7ab3-fb5d-451d-84b0-137dc68e5c2e_NAVER.jpg"/></td>
	
	@ResponseBody
	@RequestMapping(value = "/image")
	public byte[] getImage(@RequestParam("ph_num") int ph_num) {
		// 지정된 경로에서 이미지 읽어서 byte[]형태로 반환
		PetHotel pethotel = phService.getPetHotelbyNum(ph_num);
		System.out.println(pethotel.getPh_fileName());
		File file = new File(FILE_PATH + pethotel.getPh_fileName());
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
//	public View download(int ph_num) { //다운로드를 위해서 필요한건 게시글 번호
//		//문자열을 반환하면 스프링컨테이너가 이게 viewname구나 인식.
//		//그 viewname을 통해 view resolver가 뷰를 만들어서 응답을함
//		//@responsebody를 붙이면 반환하는 값을 message로 인식하고 
//		//messageConverter객체가 응답을 만들어냄
//		// 파일다운로드를 위해서 반환값을 개발자가 직접 view를 만들어서 응답.
//		
//		//왜 view로 응답해야 하는가..?
//		
//		//num : 게시글 번호 
//		//1. 게시글 번호를 이용해서 파일이름을 얻어오고,
//		//2. 지정한 경로에 있는 파일을 복사하기 
//		//3. 파일을 응답 (View를 응답)
//		//   - output을 직접생성 (복사한 파일에서 데이터를 넣어줌)
//		//   - 만들어낸 output이 파일임을 알려줌(header 셋팅)
//		
//		
//		System.out.println("BoardContoller /download 호출"+ ph_num);
//		
//		return phService.getAttachment(ph_num);
//	}

}

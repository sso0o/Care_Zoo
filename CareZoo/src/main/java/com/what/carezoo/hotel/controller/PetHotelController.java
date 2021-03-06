package com.what.carezoo.hotel.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Array;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.what.carezoo.hotel.service.PetHotelReservationService;
import com.what.carezoo.hotel.service.PetHotelService;
import com.what.carezoo.member.service.MemberService;
import com.what.carezoo.model.Customer;
import com.what.carezoo.model.Pet;
import com.what.carezoo.model.PetHotel;
import com.what.carezoo.model.PetHotelReservation;
import com.what.carezoo.model.PetHotelRoom;
import com.what.carezoo.pet.service.PetService;

@Controller
@RequestMapping("/petHotel")
public class PetHotelController {// 보호자 비동반 애견호텔 컨트롤러

	@Autowired
	private MemberService mService;

	@Autowired
	private PetService pService;

	@Autowired
	private PetHotelService phService;

	@Autowired
	private PetHotelReservationService phrService;

	private static final String FILE_PATH = "c:/temp/";

	// 펫호텔 정보 가져오기
	@RequestMapping("/petHotel")
	@ResponseBody
	public Map<String, Object> getPetHotel(int ph_num) {
		Map<String, Object> rst = new HashMap<String, Object>();
		rst.put("ph", phService.getPetHotelbyNum(ph_num));
//		System.out.println(rst);
		return rst;

	}

	// 펫호텔 목록보기
	@RequestMapping("/petHotelList")
	public String showPetHotelList(Model model) {
//		List<PetHotel> phList = phService.getAllPetHotel();
//		for (int i = 0; i < phList.size(); i++) {
//			(phList.get(i)).setPh_filesName(phService.getFileList((phList.get(i)).getPh_num()));
//		}
//		System.out.println(phList);
//		model.addAttribute("phList", phList);
		return "hotel/petHotelList";
	}

//	@ResponseBody
//	@RequestMapping("/petHotelListLoading")
//	public List<PetHotel> loadingPetHotelList() {          
//		List<PetHotel> phList = phService.getAllPetHotel();
//		for(int i=0;i<phList.size();i++) {
//			(phList.get(i)).setPh_filesName(phService.getFileList((phList.get(i)).getPh_num()));
//		}
//		System.out.println(phList);
////		model.addAttribute("phList", phList);
//		return phList;
//	}
//	   @ResponseBody
//	   @RequestMapping("/petHotelSearch")
//	   public List<PetHotel> searchPetHotel(@RequestParam(value="ph_address" ,required = false) ArrayList<String> ph_address, PetHotel ph) {
//	      System.out.println("모델:"+ph_address); //주소
//	      System.out.println("ph:"+ph); //서비스 예약일 반려견 나이 반려견 크기 정보
//	      if(ph==null) {         
//	         ph = new PetHotel();
//	      }
//	      if(ph_address==null) {
//	         ph_address = new ArrayList<String>();          
//	      }      
//	      List<PetHotel> phList = phService.searchPetHotel(ph_address,ph);
//	      
//			for(int i=0;i<phList.size();i++) {
//				(phList.get(i)).setPh_filesName(phService.getFileList((phList.get(i)).getPh_num()));
//			}
//	      
//	      System.out.println("==============================값"
//	      +phList);
//	      return phList;
//	   }
//	
	// 호텔리스트 스크롤 내리면 로딩되는 ajax
	@ResponseBody
	@RequestMapping("/petHotelListLoading")
	public List<PetHotel> searchPetHotel(@RequestParam(value = "searchSwitch", required = false) int switchNumber,
			@RequestParam(value = "ph_address", required = false) ArrayList<String> ph_address, PetHotel ph,
			Model model) {
//		System.out.println("여기까지?");
//		System.out.println("swichNumber=====>" + switchNumber);
		if (switchNumber == 1) {
//
			if (ph == null) {
				ph = new PetHotel();
			}
			if (ph_address == null) {
				ph_address = new ArrayList<String>();
			}
			List<PetHotel> phList = phService.searchPetHotel(ph_address, ph);

			for (int i = 0; i < phList.size(); i++) {
				(phList.get(i)).setPh_filesName(phService.getFileList((phList.get(i)).getPh_num()));
			}

//			System.out.println("==============================값" + phList);
//		   model.addAttribute("phList", phList);
			return phList;
		} else {
			List<PetHotel> phList = phService.getAllPetHotel();
			for (int i = 0; i < phList.size(); i++) {
				(phList.get(i)).setPh_filesName(phService.getFileList((phList.get(i)).getPh_num()));
			}
//			System.out.println("==============================값" + phList);
//			model.addAttribute("phList", phList);
			return phList;
		}
//		return phList;

	}

	@ResponseBody
	@RequestMapping("/petchk")
	public Map<String, Object> petchk(int c_num) {
		Map<String, Object> rst = new HashMap<String, Object>();
		List<Pet> pL = pService.selectByC_Num(c_num);
		rst.put("pL", pL);
		return rst;
	}

	@ResponseBody
	@RequestMapping("/phchk")
	public Map<String, Object> getPh_Name(int ph_num) {
		Map<String, Object> rst = new HashMap<String, Object>();
		PetHotel ph = phService.getPetHotelbyNum(ph_num);
		rst.put("ph_name", ph.getPh_name());
		return rst;
	}

	// ----------------Pay-----------------------
	@RequestMapping("/paySuccess")
	public String payCompleteForm(HttpSession session, PetHotelReservation phr, String phr_numof_pet,
			HttpServletRequest request) {
//		System.out.println("phr: " + phr);
//		System.out.println("phr_numof_pet:" + phr_numof_pet);
//		params
//ph_num, phrm_num, phr_status=3, p_num, phr_price,phr,totaldays
		int c_num = (Integer) session.getAttribute("user_num");
		phr.setC_num(c_num);

		int intPhr_numof_pet = Integer.parseInt(phr_numof_pet);
		phr.setP_num(intPhr_numof_pet);
		phr.setPhr_status("3");
		phrService.addPetHotelRes(phr);
		Customer cus = mService.getMemberByC_num(c_num);
		PetHotel petHotel = phService.getPetHotelbyNum(phr.getPh_num());
		// 인증메일 보내기 메서드
		phrService.mailSendWithMemberKey(petHotel, phr, request, cus);

		return "hotel/payComplete";
	}

	// 펫호텔 예약폼 --> 회원가입 상태(고객)여야하고, 고객넘, 고객의 펫리스트, 호텔넘 넘겨야함
	@RequestMapping(value = "/petHotelResForm", method = RequestMethod.POST)
	@PreAuthorize("hasAnyAuthority({'ROLE_CUSTOMER'} )")
	public String resPetHotelForm(HttpSession session, Model m, PetHotelReservation phr, String days,
			@RequestParam("quantity") int quantity, @RequestParam("oneNightValue") String oneNightValue,
			@RequestParam("nightCountValue") String nightCountValue, @RequestParam("petAddValue") String petAddValue,
			@RequestParam("totalValue") String totalValue, @RequestParam("phrm_num") int phrm_num) {
//		System.out.println("days: "+days);
//		System.out.println("quantity: "+ quantity+1);
//		System.out.println("phr:"+phr);
//		System.out.println(session.getAttribute("user_num"));
		PetHotelRoom phrm = phService.petHotelRoomDetail(phrm_num);
//		System.out.println("oneNightPrice" + oneNightValue);
//		System.out.println("nightCountPrice" + nightCountValue);
//		System.out.println("petAddValue" + petAddValue);
//		System.out.println("totalValue" + totalValue);
		List<Pet> pL = pService.selectByC_Num((Integer) session.getAttribute("user_num"));
//		System.out.println(pL);
		PetHotel ph = phService.getPetHotelbyNum(phrm.getPh_num());
		int year = Calendar.getInstance().get(Calendar.YEAR);
		for (int i = 0; i < pL.size(); i++) {
			int age = year - Integer.parseInt(((pL.get(i)).getP_birth()).substring(0, 4));
			(pL.get(i)).setAge(age + 1);
//			System.out.println(age);
		}
		m.addAttribute("ph", ph);
		m.addAttribute("phrm", phrm);
		m.addAttribute("quantity", quantity + 1);
		m.addAttribute("totalDays", days);
		m.addAttribute("phr_chkin", phr.getPhr_chkin());
		m.addAttribute("phr_chkout", phr.getPhr_chkout());
		m.addAttribute("petList", pL);
		m.addAttribute("oneNightValue", oneNightValue);
		m.addAttribute("nightCountValue", nightCountValue);
		m.addAttribute("petAddValue", petAddValue);
		m.addAttribute("totalValue", totalValue);
		phrService.getPetHotelResByPhrm_num(phr.getPhrm_num());
		return "hotel/petHotelResForm";
	}

//	//
//	@RequestMapping(value = "/resPetHotel", method = RequestMethod.POST)
//	@ResponseBody
//	public boolean resPetHotel(String str, HttpServletRequest req) {
//		List<PetHotelReservation> phR = new ArrayList<PetHotelReservation>();
//		System.out.println("str -----------" + str);
//		JSONArray jArray = new JSONArray(str);
//		System.out.println(jArray);
//		for (int i = 0; i < jArray.length(); i++) {
//			PetHotelReservation r = new PetHotelReservation();
//			JSONObject jo = jArray.getJSONObject(i);
//			r.setC_num(jo.getInt("c_num"));
//			r.setP_num(jo.getInt("p_num"));
//			r.setPh_num(jo.getInt("ph_num"));
//			r.setPhr_chkin(jo.getString("phr_chkin"));
//			r.setPhr_chkout(jo.getString("phr_chkout"));
//			System.out.println(r);
//			phR.add(r);
//		}
//		int addCount = 0;
//		for (PetHotelReservation r : phR) {
//			PetHotelReservation selectResult = phrService.getPetHotelResByResInfo(r);
//			if (selectResult == null) {
//				boolean rst = phrService.addPetHotelRes(r);
//				if (rst) {
//					addCount += 1;
//				}
//			}
//		}
//
//		if (addCount == phR.size()) {
//			return true;
//		} else {
//			return false;
//		}
//
//	}

	// 펫호텔 상세보기
	@RequestMapping("/petHotelView")
	public String showPetHotelView(Model model, @RequestParam("ph_num") int ph_num, String phr_chkin,
			String phr_chkout) {
		PetHotel petHotel = phService.getPetHotelbyNum(ph_num);
		petHotel.setPh_filesName(phService.getFileList(petHotel.getPh_num()));
		List<String> filesName = phService.getFileList(ph_num);
		for (int i = 0; i < filesName.size(); i++) {
			String str = filesName.get(i);
//			System.out.println(str);
		}

		List<PetHotelRoom> petHotelRoomList = phService.getAllPetHotelRoom(ph_num);

		for (int j = 0; j < petHotelRoomList.size(); j++) {
			if (((petHotelRoomList.get(j)).getPhrm_option()) != null) {
				String date[] = ((petHotelRoomList.get(j)).getPhrm_option()).split(",");
				List<String> optionList = new ArrayList<String>();
//				System.out.println("Arrays.to :" + Arrays.toString(date));
				for (int l = 0; l < date.length; l++) {
//					System.out.println("date[]:" + date[l]);
					optionList.add(date[l]);
//					System.out.println(optionList.get(l));
				}
				petHotelRoomList.get(j).setPhrm_options(optionList);
			}
		}
		model.addAttribute("petHotel", petHotel);
		model.addAttribute("petHotelRoomList", petHotelRoomList);
		model.addAttribute("filesName", filesName);
		model.addAttribute("phComment", phService.getPHCbyph_num(ph_num));

		return "hotel/petHotelView";
	}

	// view에서 Room을 선택했을 때 자세히 띄워줌
	@ResponseBody
	@RequestMapping("/petHotelRoomDetail")
	public PetHotelRoom showPetHotelRoomDetail(@RequestParam("phrm_num") int phrm_num) {
		PetHotelRoom petHotelRoom = phService.petHotelRoomDetail(phrm_num);
		petHotelRoom.setRemaining_room((petHotelRoom.getPhrm_p_max())-(petHotelRoom.getRcount()));
		return petHotelRoom;
	}

	@ResponseBody
	@RequestMapping("/petHotelRoomDateChoice")
	public List<PetHotelRoom> showPetHotelRoom(String phr_chkin, String phr_chkout,
			@RequestParam("ph_num") int ph_num) {
//		System.out.println(phr_chkin + phr_chkout + ph_num);

		List<PetHotelRoom> dateChoice = phService.getHotelRoomByDate(phr_chkin, phr_chkout, ph_num);
		for (int i = 0; i < dateChoice.size(); i++) {
//			System.out.println("p_max:" + (dateChoice.get(i)).getPhrm_p_max());
//			System.out.println("Rcount:" + (dateChoice.get(i)).getRcount());
			(dateChoice.get(i)).setRemaining_room((dateChoice.get(i).getPhrm_p_max()) - (dateChoice.get(i).getRcount()));
			if (0 >= (dateChoice.get(i)).getRemaining_room()) {
				dateChoice.get(i).setRemaining_room(0);
			}
//			System.out.println("remainingRoom:" + dateChoice.get(i).getRemaining_room());
		}
//		System.out.println(dateChoice);
		return dateChoice;
	}

	// 펫호텔 키워드로 선택
	@RequestMapping("/addressKeyword")
	public String addressKeyworkSelect(String keywork) {
		return null;
	}

	@ResponseBody
	@RequestMapping(value = "/petHotelReservation")
	public List<PetHotelReservation> makePetHotelRes(@RequestParam("phrm_num") int phrm_num) {
		int compare = 0;
		Date phrCheckOut;
		Date today = new Date();
		List<PetHotelReservation> phrList = phrService.getPetHotelResByPhrm_num(phrm_num);
//		System.out.println(phrList);
//		System.out.println("size: " + phrList.size());
		int phrSize = phrList.size();
		for (int i = phrSize - 1; i + 1 > 0; i--) { // checkout날짜 today와 비교해서 지난 날짜는 리스트에서 삭제.
			String from = (phrList.get(i)).getPhr_chkout();
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd"); // String to Date format
			try {
				phrCheckOut = transFormat.parse(from); // String to Date
				if (0 < (compare = today.compareTo(phrCheckOut))) { // compare은 -1,0,1만 나올 수 있음 ex ==) today>phrCheckOut
																	// ==> compare =1
					phrList.remove(i);
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return phrList;

	}

//	"${contextPath}/image?ph_num=${pethotel.ph_num}&fileName=9eed7ab3-fb5d-451d-84b0-137dc68e5c2e_NAVER.jpg"/></td>	
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
		} finally {
			try {
				if (in != null)
					in.close();
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

//	//호텔이메일로 예약확정 메일 보내기.
//	@RequestMapping(value="/join", method=RequestMethod.POST)
//	public String join(Customer customer, Model m,HttpServletRequest request) {
//		//회원가입 메서드
//		
//		return "joinForm";
//	}

}

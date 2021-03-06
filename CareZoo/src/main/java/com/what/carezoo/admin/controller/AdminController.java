package com.what.carezoo.admin.controller;

import static org.springframework.test.web.client.match.MockRestRequestMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.taglibs.standard.lang.jstl.IntegerDivideOperator;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonParser;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.what.carezoo.hotel.service.DongbanHotelService;
import com.what.carezoo.hotel.service.PetHotelReservationService;
import com.what.carezoo.hotel.service.PetHotelService;
import com.what.carezoo.member.service.MemberMailSendService;
import com.what.carezoo.member.service.MemberService;
import com.what.carezoo.model.Customer;
import com.what.carezoo.model.HomeSitter;
import com.what.carezoo.model.Pet;
import com.what.carezoo.model.PetHotel;
import com.what.carezoo.model.PetHotelReservation;
import com.what.carezoo.model.PetHotelRoom;
import com.what.carezoo.model.VisitSitter;
import com.what.carezoo.model.VisitSitterReservation;
import com.what.carezoo.pet.service.PetService;
import com.what.carezoo.pet.service.Pet_DetailService;
import com.what.carezoo.sitter.service.HomeSitterListService;
import com.what.carezoo.sitter.service.HomeSitterMailSendService;
import com.what.carezoo.sitter.service.HomeSitterReservationService;
import com.what.carezoo.sitter.service.HomeSitterService;
import com.what.carezoo.sitter.service.SitterService;
import com.what.carezoo.sitter.service.VisitSitterReservationService;
import com.what.carezoo.sitter.service.VisitSitterService;
import com.what.carezoo.sitter.service.visitSitterMailSenderService;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class AdminController {

	@Autowired
	private MemberMailSendService mailsender;
	
	@Autowired
	private PetHotelService phService;

	@Autowired
	private DongbanHotelService dhService;

	@Autowired
	private MemberService mService;

	@Autowired
	private PetService pService;

	@Autowired
	private PetHotelReservationService phrService;
	
	@Autowired
	private VisitSitterService vsService;
	
	@Autowired
	private HomeSitterService hsService;
	
	@Autowired
	private VisitSitterReservationService vsrService;
	
	@Autowired
	private Pet_DetailService pdService;
	
	@Autowired
	private HomeSitterReservationService hsrService;

	@Autowired
	private HomeSitterListService hslService;
	
	@Autowired
	private visitSitterMailSenderService vsmailsender;
	
	@Autowired
	private HomeSitterMailSendService hsmailsender;
	
	
	@RequestMapping("/main")
	public String showAdminMain() {
		return "admin/adminMain";
	}

	// <---------------------------------------------------------이거 위치
	@RequestMapping("/qna")
	public String showQna() {
		return "my&customer/qna";
	}

	@RequestMapping("/test")
	public String test(HttpServletRequest request, Model m, String email, String pass) {
		String radio = request.getParameter("user");
		m.addAttribute("user", radio);

		return "test";

	}

	// <-----------------------------------------------------------------이거 위치

	///////////////////////////////////////////////////////////////////////////////// 멤버

	@RequestMapping("/memberList")
	public String showMemberList(Model m) {
		List<Customer> cList = mService.selectAll();

		m.addAttribute("cList", cList);
		return "admin/memberList";
	}

	@RequestMapping("/memberView")
	public String showMemberView(String c_email, Model m) {
		Customer c = mService.getMemberByEmail(c_email);
		int c_num = c.getC_num();
		List<Pet> pL = pService.selectByC_Num(c_num);

		m.addAttribute("c", c);
		m.addAttribute("pL", pL);

		return "admin/memberView";
	}


	@RequestMapping("/memberDelete")
	public String memberDelete(@RequestParam("c_num") int c_num, Model model,HttpServletRequest request) {
		//강제탈퇴 이메일보내기
		mailsender.mailSendWithMember(mService.getMemberByC_num(c_num).getC_email(), mService.getMemberByC_num(c_num).getC_name(), request);
		
		//고객삭제
		mService.deleteCustomer(c_num);
		//강아지삭제
		if(pService.countPetByC_num(c_num)>0) {
			pService.deletePetByC_num(c_num);
		}
		
		//펫디테일 삭제
		if(pdService.countPetByC_num(c_num)>0) {
			pdService.deleteByC_num(c_num);
		}
		
		//방문예약 삭제
		if(vsrService.countC_num(c_num)>0) {
			vsrService.deleteByC_num(c_num);
		}
		
		//가정예약 삭제
		if(hsrService.countC_num(c_num)>0) {
			hsrService.deleteByC_num(c_num);
		}
		
		//펫호텔 예약 삭제
		if(phrService.countC_num(c_num)>0) {
			phrService.deleteByC_num(c_num);
		}
		List<Customer> c = mService.selectAll();
		model.addAttribute("cList", c);
		return "admin/memberList";
	}


	///////////////////////////////////////////////////////////////////////////////// 펫

	@ResponseBody
	@RequestMapping("/petchk")
	public Map<String, Object> petchk(int c_num) {
		Map<String, Object> rst = new HashMap<String, Object>();
		List<Pet> pL = pService.selectByC_Num(c_num);
		rst.put("pL", pL);
		return rst;
	}

	////////////////////////////////////////////////////////////////////////// 예약

	@ResponseBody
	@RequestMapping("/phchk")
	public Map<String, Object> getPh_Name(int ph_num) {
		Map<String, Object> rst = new HashMap<String, Object>();
		PetHotel ph = phService.getPetHotelbyNum(ph_num);
		rst.put("ph_name", ph.getPh_name());
		return rst;
	}

	@RequestMapping("/resPetHotelList")
	public String resList(Model m) {
		List<PetHotelReservation> phR = phService.getAllPetHotelRes();
		for (int i = 0; i < phR.size(); i++) {
			(phR.get(i)).setPh_name((phService.getPetHotelbyNum((phR.get(i)).getPh_num())).getPh_name());
			(phR.get(i)).setPhrm_name((phrService.getOnePetHotelRoom(phR.get(i).getPhrm_num())).getPhrm_name());
			(phR.get(i)).setC_name((mService.getMemberByC_num((phR.get(i)).getC_num())).getC_name());

			if (((phR.get(i)).getPhr_status()).equals("3")) {
				(phR.get(i)).setPhr_status("결제 완료");
			} else if (((phR.get(i)).getPhr_status()).equals("4")) {
				(phR.get(i)).setPhr_status("이용 완료");
			} else {

			}
		}

		m.addAttribute("phR", phR);
		return "admin/resPetHotelList";
	}
	
	// 펫호텔예약 취소
	@RequestMapping("/cancelPHR")
	public String cancelPHR(int num, Model m,HttpServletRequest request) {
		PetHotelReservation phr = phrService.getPetHotelResByNum(num);
		if (mService.cancelPHR(num)) {
			m.addAttribute("msg", "예약이 취소되었습니다.");
			PetHotel ph = phService.getPetHotelbyNum(phr.getPh_num());
			System.out.println(ph);
			Customer cus = mService.getMemberByC_num(phr.getC_num());
			mailsender.mailSendCancelPHR(ph,phr,cus,request);
			System.out.println("=============이메일 성공");
		} else {
			m.addAttribute("msg", "취소 실패");
		}
		
		return "admin/resPetHotelList";
	}
	
	@RequestMapping("/resPetHotelForm")
	public String resPetHotelForm(Model m) {
		List<Customer> cL = mService.selectAll();
		List<PetHotel> phL = phService.getAllPetHotel();

		m.addAttribute("cL", cL);
		m.addAttribute("phL", phL);
		return "admin/resPetHotelForm";
	}

	@RequestMapping(value = "/resPetHotel", method = RequestMethod.POST)
	@ResponseBody
	public boolean resPetHotel(String str, HttpServletRequest req) {
		List<PetHotelReservation> phR = new ArrayList<PetHotelReservation>();
		System.out.println("str -----------" + str);
		JSONArray jArray = new JSONArray(str);
		System.out.println(jArray);
		for (int i = 0; i < jArray.length(); i++) {
			PetHotelReservation r = new PetHotelReservation();
			JSONObject jo = jArray.getJSONObject(i);
			r.setC_num(jo.getInt("c_num"));
			r.setP_num(jo.getInt("p_num"));
			r.setPh_num(jo.getInt("ph_num"));
			r.setPhr_chkin(jo.getString("phr_chkin"));
			r.setPhr_chkout(jo.getString("phr_chkout"));
			System.out.println(r);
			phR.add(r);
		}

//		for (PetHotelReservation r : phR) {
//			boolean result = rst.add(phrService.addPetHotelRes(r));
//			if(result) {
//				
//			}
//		}
//		
//		
//		if (!rst.contains(false)) {
//			return true;
//		}

		if (phR.size() > 0) {
			return true;
		}
		return false;
	}

	////////////////////////////////////////////////////////////////////////// 호텔
	// add PetHotel Form
	@RequestMapping("/addHotelForm")
	public String showAddHotelForm() {
		return "admin/addHotelForm";
	}

	// add pet hotel
	@RequestMapping("/addHotel")
	public String addHotel(PetHotel ph) {
		return "admin/addHotelForm";
	}

	///////////////////////////////////////////////////////////////////////////////// 펫호텔

	// add PetHotel Form
	@RequestMapping("/addPetHotelForm")
	public String showAddPetHotelForm() {
		return "admin/addPetHotelForm";
	}

	   // 펫호텔 추가
	   @RequestMapping(value = "/addPetHotel", method = RequestMethod.POST)
	   public String name(PetHotel ph, Model m, MultipartHttpServletRequest mtfRequest) {
	      String phone = mtfRequest.getParameter("phone");
	      String phone1 = mtfRequest.getParameter("phone1");
	      String phone2 = mtfRequest.getParameter("phone2");
	      String ph_contact = phone + "-" + phone1 + "-" + phone2;
	      ph.setPh_contact(ph_contact);
	      List<MultipartFile> files = mtfRequest.getFiles("file");
	      boolean rst = phService.addPetHotel(ph, files);
	      String phrm_pet_size_memo = "";
	      String[] phrm_pet_size = null;
	      String[] phrm_option = null;
	      String phrm_pet_option_memo = "";
//	      System.out.println("phone "+phone);
//	      System.out.println("phone1 "+phone1); 
//	      System.out.println("phone2 "+phone2);
//	      System.out.println("ph_contact" + ph_contact);
	      String[] phrm_nam = mtfRequest.getParameterValues("phrm_nam");
//	      System.out.println(phrm_nam);
	      String[] phrm_name = mtfRequest.getParameterValues("phrm_name");
	      String[] phrm_price = mtfRequest.getParameterValues("phrm_price");
	      String[] phrm_m_price = mtfRequest.getParameterValues("phrm_m_price");
	      String[] phrm_l_price = mtfRequest.getParameterValues("phrm_l_price");
	      String[] phrm_p_max = mtfRequest.getParameterValues("phrm_p_max");
	      PetHotel petHotel = phService.getPetHotelbyName(ph.getPh_name());
//	      System.out.println("ph:" + ph);
	      for (int i = 0; i < phrm_name.length; i++) {
	         String result_size = "";
	         if (mtfRequest.getParameterValues("phrm_pet_size" + i) != null) {
	            phrm_pet_size = mtfRequest.getParameterValues("phrm_pet_size" + i);
//	            System.out.println("phrm_pet_size:" + Arrays.toString(phrm_pet_size));
//	            System.out.println("phrm_pet_size" + phrm_pet_size);
	            for (int j = 0; j < phrm_pet_size.length; j++) {
	               result_size += phrm_pet_size_memo.concat(phrm_pet_size[j]);
	               if (j < (phrm_pet_size.length) - 1) {
	                  result_size += phrm_pet_size_memo.concat(",");
	               }
	            }
	         }
	         String result_option = "";
	         if (mtfRequest.getParameterValues("phrm_option" + i) != null) {
	            phrm_option = mtfRequest.getParameterValues("phrm_option" + i);
//	            System.out.println("phrm_option:" + Arrays.toString(phrm_option));
//	            System.out.println("phrm_option" + phrm_option);
	            for (int j = 0; j < phrm_option.length; j++) {
	               result_option += phrm_pet_option_memo.concat(phrm_option[j]);
	               if (j < (phrm_option.length) - 1) {
	                  result_option += phrm_pet_option_memo.concat(",");
	               }
	            }
	         }
	         PetHotelRoom phrm = new PetHotelRoom();
//	         System.out.println("ph.getPh_num:" + ph.getPh_num());
	         int ph_num = ph.getPh_num();
//	         System.out.println("ph_num" + ph_num);
	         phrm.setPh_num(ph_num);
	         phrm.setPhrm_name(phrm_name[i]);
	         phrm.setPhrm_price(Integer.parseInt(phrm_price[i]));
	         phrm.setPhrm_m_price(Integer.parseInt(phrm_m_price[i]));
	         phrm.setPhrm_l_price(Integer.parseInt(phrm_l_price[i]));
	         phrm.setPhrm_p_max(Integer.parseInt(phrm_p_max[i]));
	         phrm.setPhrm_pet_size(result_size);
	         phrm.setPhrm_option(result_option);
	         phService.addPetHotelRoom(phrm);
	      }

//	           String src = mtfRequest.getParameter("src");
//	           System.out.println("src value : " + src);
//	           System.out.println(fileList.get(0));
//	           for (MultipartFile mf : fileList) {
//	               String originFileName = mf.getOriginalFilename(); // 원본 파일 명
//	               long fileSize = mf.getSize(); // 파일 사이즈
	      //
//	               System.out.println("originFileName : " + originFileName);
//	               System.out.println("fileSize : " + fileSize);
//	           }

//	         boolean add_phrm = phService.addPetHotelRoom(phrm);

	      if (rst) {
	         return "redirect:/admin/petHotelList";
	      } else {
	         return "redirect:/admin/addPetHotelForm";
	      }

	   }

	// 펫호텔 수정하기 위해 리스트 보기
	@RequestMapping("/petHotelList")
	public String showPetHotelList(Model m) {
		List<PetHotel> phL = phService.getAllPetHotel();
		m.addAttribute("phL", phL);
		System.out.println(phL);
		return "admin/petHotelList";
	}

	@RequestMapping("/petHotelDelete")
	public String petHotelRemove(@RequestParam("ph_num") int ph_num, Model m) {
		phService.removePetHotel(ph_num);
		List<PetHotel> phL = phService.getAllPetHotel();
		m.addAttribute("phL", phL);
		return "admin/petHotelList";
	}

	@RequestMapping("/petHotelModifyForm")
	public String showPetHotelModiForm(@RequestParam("ph_num") int ph_num) {
		phService.removePetHotel(ph_num);
		return "admin/petHotelList";
	}

	// 펫호텔 상세보기
	@RequestMapping("/viewPetHotel")
	public String viewPetHotel(int ph_num, Model model) {
//		PetHotel ph = phService.getPetHotelbyNum(ph_num);
//		model.addAttribute("ph", ph);
		System.out.println(phService.getPetHotelbyNum(ph_num));
		List<String> filesName = phService.getFileList(ph_num);
		for (int i = 0; i < filesName.size(); i++) {
			String str = filesName.get(i);
			System.out.println(str);
		}
		model.addAttribute("pethotel", phService.getPetHotelbyNum(ph_num));
		model.addAttribute("filesName", filesName);
		return "admin/viewPetHotel";
	}

	@RequestMapping("/petHotelView")
	public String showPetHotelView(Model model, @RequestParam("ph_num") int ph_num) {
		System.out.println(phService.getPetHotelbyNum(ph_num));
		model.addAttribute("pethotel", phService.getPetHotelbyNum(ph_num));
		return "hotel/petHotelView";
	}

	// 펫호텔 수정
	@RequestMapping(value = "/modifyPetHotel", method = RequestMethod.POST)
	public String modifyPetHotel(PetHotel ph, Model m) {
		int num = ph.getPh_num();
		boolean rst = phService.modifyPetHotel(ph);
		if (rst) {
			return "redirect:/admin/petHotelList";
		} else {
			return "admin/viewPetHotel?ph_num=" + num;
		}
	}

	@RequestMapping("/delPetHotel")
	public String delPetHotel(int ph_num) {
		boolean rst = phService.removePetHotel(ph_num);
		if (rst) {
			return "redirect:/admin/petHotelList";
		} else {
			return "redirect:/admin/viewPetHotel?ph_num=" + ph_num;
		}
	}
////////////////////////////////////////////////////////////////////////////////sitter
	//가정시터
	@RequestMapping(value="/hsList",method= RequestMethod.GET)
	public String hsListForm(Model model) {
		List<HomeSitter> hsList = hsService.getAllHomeSitter();

		model.addAttribute("hsList", hsList);
		return "admin/hsList";
	}
	//강제탈퇴
	@RequestMapping("/hsDelete")
	public String hsDelete(@RequestParam("hs_num")int hs_num,Model model,HttpServletRequest request) {
		//강퇴 이메일 보내주기
		hsmailsender.mailSendWithMember(hsService.getHomeSitterByNum(hs_num).getHs_email(), hsService.getHomeSitterByNum(hs_num).getHs_name(), request);
		//홈시터 삭제
		hsService.deleteHomeSitter(hs_num);
		//홈시터 탈퇴시 해당 게시글도 지우기
		hslService.removeHsl(hs_num);
		List<HomeSitter> hsList = hsService.getAllHomeSitter();
		model.addAttribute("hsList", hsList);
		return "admin/hsList";
	}
	
	//방문시터
	@RequestMapping(value="/vsList", method=RequestMethod.GET)
	public String vsListForm(Model model) {
		List<VisitSitter> vsList = vsService.getAllVisitSitter();

		model.addAttribute("vsList", vsList);
		return "admin/vsList";
	}
	
	//강제탈퇴
	@RequestMapping("/vsDelete")
	public String vsDelete(@RequestParam("vs_num")int vs_num,Model model,HttpServletRequest request) {
		//강퇴 당하는 이유 메일 보내주기
		vsmailsender.mailSendWithMember(vsService.getVisitSitterByNum(vs_num).getVs_email(),vsService.getVisitSitterByNum(vs_num).getVs_name() , request);
		//방문시터 삭제
		vsService.deleteVisitSitter(vs_num);
		//예약 내역 삭제
		if(vsrService.countVs_num(vs_num)>0) {
			vsrService.deleteByVs_num(vs_num);
		}
		List<VisitSitter> vsList = vsService.getAllVisitSitter();
		model.addAttribute("vsList", vsList);
		return "admin/vsList";
		
	}
}

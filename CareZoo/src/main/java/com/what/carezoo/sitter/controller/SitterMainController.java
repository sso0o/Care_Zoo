package com.what.carezoo.sitter.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.what.carezoo.customer.service.CustomerService;
import com.what.carezoo.member.service.MemberService;
import com.what.carezoo.model.Customer;
import com.what.carezoo.model.HomeSitter;
import com.what.carezoo.model.HomeSitterList;
import com.what.carezoo.model.HomeSitterReservation;
import com.what.carezoo.model.Pet;
import com.what.carezoo.model.Pet_Detail;
import com.what.carezoo.model.VisitSitter;
import com.what.carezoo.model.VisitSitterReservation;
import com.what.carezoo.pet.service.PetService;
import com.what.carezoo.pet.service.Pet_DetailService;
import com.what.carezoo.sitter.service.HomeSitterListService;
import com.what.carezoo.sitter.service.HomeSitterReservationService;
import com.what.carezoo.sitter.service.HomeSitterService;
import com.what.carezoo.sitter.service.SitterService;
import com.what.carezoo.sitter.service.VisitSitterReservationService;
import com.what.carezoo.sitter.service.VisitSitterService;
@RequestMapping("/sitter")
@Controller
public class SitterMainController {
	
	private static final String FILE_PATH = "c:/temp/";
	
	@Autowired
	private VisitSitterService vsService;
	
	@Autowired
	private HomeSitterService hsService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private PetService pService;
	
	@Autowired
	private Pet_DetailService pdService;
	
	@Autowired
	private HomeSitterReservationService hsrService;
	
	@Autowired
	private VisitSitterReservationService vsrService;
	
	@Autowired
	private HomeSitterListService hslService;
	
	@RequestMapping(value="main",method=RequestMethod.GET)
	public String MainPage() {
		return "sitter/sitterMain";
		
	}
	
	
	@RequestMapping(value = "/myReservationHS" , method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getMyReservationHS(int hs_num) {
		Map<String, Object> rst = new HashMap<String, Object>();
		List<Map<String, Object>> hsr = hsrService.getHomeSitterResByHSnum(hs_num);
		rst.put("hsrList",hsr);
		
		return rst;
	}
	
	//예약현황에서 방문시터의 모든 예약정보 가져오기(정기랑 일반 구분)
	@RequestMapping(value = "/myReservationVS", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getMyReservationVS(int vs_num) {
		List<Map<String, Object>> rst1 = vsrService.getMyResDay7(vs_num);
		List<Map<String, Object>> rst2 = vsrService.getMyResDay0_6(vs_num);
		
		Map<String, Object> rst = new HashMap<String, Object>();
		
		rst.put("rst1",rst1);
		rst.put("rst2",rst2);
	
		return rst;
		
	}
	
	//vs정보 가져오기(ajax)
	@ResponseBody
	@RequestMapping("/getVisitInfo")
	public Map<String, Object> getVisitInfo(int vs_num) {
//		System.out.println("여기오니이이이ㅣ이ㅣㅣㅣㅇ");
		Map<String, Object> rst = new HashMap<String, Object>();
		rst.put("vsInfo", vsService.getVisitSitterByNum(vs_num));
		return rst;
	}
	
	//hs정보 가져오기(ajax)
	@ResponseBody
	@RequestMapping("/getHomeInfo")
	public Map<String, Object> getHomeInfo(int hs_num) {
//		System.out.println("여기오니이이이ㅣ이ㅣㅣㅣㅇ");
		Map<String, Object> rst = new HashMap<String, Object>();
		rst.put("hsInfo", hsService.getHomeSitterByNum(hs_num));
		return rst;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/getVsImg", method=RequestMethod.GET)
	public Map<String, Object> getVsImg(int vs_num) {
		System.out.println("vs넘어오나");
		System.out.println(vs_num);
		Map<String, Object> rst = new HashMap<String, Object>();
		String filename = vsService.getImage(vs_num);
		rst.put("filename", filename);
		System.out.println("rst : "+rst);
		return rst;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getHsImg", method=RequestMethod.GET)
	public Map<String, Object> getHsImg(int hs_num) {
		System.out.println("hs넘어오나");
		System.out.println(hs_num);
		Map<String, Object> rst = new HashMap<String, Object>();
		String filename = hsService.getImage(hs_num);
		rst.put("filename", filename);
		System.out.println("rst : "+rst);
		return rst;
	}
	
	//가정, 방문 둘다 여기로옴
	@RequestMapping("/modifySitterInfo")
	public String modifySitterInfo() {
		return "sitter/checkUser";
	}
	
	
	// 수정 전회원 확인(비밀번호 확인)
	@RequestMapping(value = "/userCheck", method = RequestMethod.POST)
	public String userCheck(HttpSession session, int num, String pw, Model m, @RequestParam(defaultValue = "0") int p_num) {
		String type = (String)session.getAttribute("user_numtype");
		String url = "";
		
		if (type.equals("vs_num")) {
			VisitSitter vs = vsService.getVisitSitterByNum(num);
			if(vs.getVs_pass().equals(pw)) {
				m.addAttribute("vs", vs);
				url =  "sitter/modifyVisitInfo";
			} else {
				m.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
				url = "sitter/checkUser";
			}
		} else if(type.equals("hs_num")) {
			HomeSitter hs = hsService.getHomeSitterByNum(num);
			if(hs.getHs_pass().equals(pw)) {
				m.addAttribute("hs", hs);
				url = "sitter/modifyHomeInfo";
			} else {
				m.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
				url = "sitter/checkUser";
			}
		}
		System.out.println(url);
		return url;
	}
	
	//회원정보 수정vs
	@RequestMapping(value = "/modifyVs", method = RequestMethod.POST)
	public String modifyVs(VisitSitter vs, Model m, MultipartHttpServletRequest mtfRequest) {
		MultipartFile file = mtfRequest.getFile("file");
		System.out.println("file : " + file);
		System.out.println("vs : "+vs);
		boolean rst = vsService.modifyUser(vs, file);
		if(rst) {
			m.addAttribute("vs", vs);
			m.addAttribute("msg", "회원정보를 수정하였습니다");
			return "sitter/visitInfo";
		} else {
			m.addAttribute("vs", vs);
			m.addAttribute("msg", "회원정보 수정 실패!");
			return "sitter/modifyVisitInfo";
		}
	}
	
	//회원정보 수정hs
	@RequestMapping(value = "/modifyHs", method = RequestMethod.POST)
	public String modifyVs(HomeSitter hs, Model m, MultipartHttpServletRequest mtfRequest) {
		MultipartFile file = mtfRequest.getFile("file");
		System.out.println("file : " + file);
		System.out.println("hs : "+hs);
		boolean rst = hsService.modifyHomeSitter(hs,file);
		if(rst) {
			m.addAttribute("hs", hs);
			m.addAttribute("msg", "회원정보를 수정하였습니다");
			return "sitter/homeInfo";
		} else {
			m.addAttribute("hs", hs);
			m.addAttribute("msg", "회원정보 수정 실패!");
			return "sitter/modifyHomeInfo";
		}
	}
	
	
	//방문시터 신청한 예약 목록 가져오기(방문
	@RequestMapping("/getVsrStatus0")
	public String getVsrList(Model m) {		
		//일반
		List<Map<String, Object>> rst1 = pdService.getResInfo7();
		//정기
		List<Map<String, Object>> rst2 = pdService.getResInfo0_6();
		m.addAttribute("rst1", rst1);
		m.addAttribute("rst2", rst2);
		return "sitter/reservationListVs";
	}
	
	//나한테 신청한 예약들 가져오기(가정)
	@RequestMapping("/getHsrStatus0")
	public String getHsrList() {
		return "sitter/reservationListHs";
	}
	
	//reservationListHs / ajax 데이터 가져오기
	@RequestMapping("/getMyDataHs")
	@ResponseBody
	public Map<String, Object> getMyDataHs(int hs_num) {
		Map<String, Object> rst = new HashMap<String, Object>();
		
		rst.put("status0", hsrService.getStatus0(hs_num));
		rst.put("status2", hsrService.getHomeSitterResByHSnum(hs_num));
		
		return rst;
	}
	
	
	
//	//정기묶음 예약점 가져오기
//	@RequestMapping("/vsrGroup")
//	@ResponseBody
//	public Map<String, Object> vsrGroup(int num) {
//		Map<String, Object> rst = new HashMap<String, Object>();
//		VisitSitterReservation vsr = vsrService.getVisitSitterResByVsrnum(num);
//		int c_num = vsr.getC_num();
//		int vsr_count = vsr.getVsr_count();
//		List<Map<String, Object>> list = vsrService.getVsrGroup(c_num, vsr_count);
//		System.out.println(list);
//		
//		return rst;
//	}
	
	
	//모달에 띄울 vsr 정보 
	@RequestMapping("/getVSRInfo")
	@ResponseBody
	public Map<String, Object> getVSRInfo(int vsr_num) {
		Map<String, Object> rst = new HashMap<String, Object>();
		System.out.println("vsr_num : "+vsr_num);
		List<Pet_Detail> pd = pdService.selectByVsr_Num(vsr_num);
		System.out.println("======================================================");
		System.out.println(pd);
		List<Map<String, Object>> petTotal = new ArrayList<Map<String,Object>>();
		for(Pet_Detail p:pd) {
			Map<String, Object> petList = new HashMap<String, Object>();
			Pet pet = pService.selectPet(p.getP_num());
			String img = pService.getImage(pet.getP_num());
			
			petList.put("pet", pet);
			petList.put("img", img);
			
			petTotal.add(petList);
		}
		
		rst.put("petList", petTotal);
		
		VisitSitterReservation vsr = vsrService.getVisitSitterResByVsrnum(vsr_num);
		int hour = Integer.parseInt(vsr.getVsr_hour());
		int endhour = Integer.parseInt(vsr.getVsr_hour())+Integer.parseInt(vsr.getVsr_hAdd())+3;
		String time = hour+" ~ "+endhour;
		rst.put("hour", time);
		rst.put("chkin", vsr.getVsr_chkin());
		rst.put("address", mService.getMemberByC_num(vsr.getC_num()).getC_address());	
		String attenttion = "";
		String str = vsr.getVsr_attention();
		
		if(str.contains("1")) {
			attenttion += "/ 노산책 놀이대체 ";
		}
		if(str.contains("2")) {
			attenttion += "/ 산책 위주 ";
		}
		if(str.contains("3")) {
			attenttion += "/ 생식급여  ";
		}
		if(str.contains("4")) {
			attenttion += "/ 노령견 및 환자견 케어 ";
		}		
		rst.put("attention", attenttion);
		return rst;	
	}
	
	
	@RequestMapping("/getHSRInfo")
	@ResponseBody
	public Map<String, Object> getHSRInfo(int hsr_num) {
		Map<String, Object> rst = new HashMap<String, Object>();
		rst = hsrService.getModalHSR(hsr_num);
		return rst;
	}
	
	
	//방문시터 예약수락
	@RequestMapping("/acceptVsr")
	public String acceptVsr(HttpSession session, Model m, int vsr_num) {
		int vs_num = (Integer)session.getAttribute("user_num");
		System.out.println("vs_num : "+vs_num);
		int c_num = vsrService.getVisitSitterResByVsrnum(vsr_num).getC_num();
		int vsr_count =  vsrService.getVisitSitterResByVsrnum(vsr_num).getVsr_count();
//		일반인지 정기인지 체크
		List<Map<String, Object>> list = vsrService.getVsrGroup(c_num, vsr_count);
		System.out.println("일반 정기 확인 리스트 사이즈: "+list);
		int check = list.size();
		
		if(check == 4) {
			System.out.println("이리로 넘어오냐ㅑㅑㅑㅑㅑ");
			List<VisitSitterReservation> num = vsrService.checkDate0_6(vs_num,
										(String)list.get(0).get("VSR_CHKIN"),
										(String)list.get(1).get("VSR_CHKIN"),
										(String)list.get(2).get("VSR_CHKIN"),
										(String)list.get(3).get("VSR_CHKIN"));
			System.out.println("num : "+num);

			if (num.size() == 0 && vsrService.acceptVsr0_6(vs_num, 
										((BigDecimal)list.get(0).get("VSR_NUM")).intValue(),
										((BigDecimal)list.get(1).get("VSR_NUM")).intValue(),
										((BigDecimal)list.get(2).get("VSR_NUM")).intValue(),
										((BigDecimal)list.get(3).get("VSR_NUM")).intValue() )){
				m.addAttribute("msg", "수락이 완료되었습니다!");
				return "sitter/myReservation_visit";
			} else {
				//일반
				List<Map<String, Object>> rst1 = pdService.getResInfo7();
				//정기
				List<Map<String, Object>> rst2 = pdService.getResInfo0_6();
				m.addAttribute("rst1", rst1);
				m.addAttribute("rst2", rst2);
				m.addAttribute("msg", "예약을 수락할 수 없습니다.(중복예약)");
				return "sitter/reservationListVs";
			}
			
		} else {
			//일반
			
			//그날 내가 예약있는지부터 확인
			String resDate = vsrService.getVisitSitterResByVsrnum(vsr_num).getVsr_chkin();
			System.out.println("예약 확인");
			if(vsrService.checkDate7(vs_num, resDate).size()==0) {
				System.out.println("내가 예약 가지고있나 확인");
				if(vsrService.acceptVsr7(vs_num,vsr_num)){
					m.addAttribute("msg", "수락이 완료되었습니다!");
					return "sitter/myReservation_visit";
				}
			} else {
				//일반
				List<Map<String, Object>> rst1 = pdService.getResInfo7();
				//정기
				List<Map<String, Object>> rst2 = pdService.getResInfo0_6();
				m.addAttribute("rst1", rst1);
				m.addAttribute("rst2", rst2);
				m.addAttribute("msg", "예약을 수락할 수 없습니다.(중복예약)");
				return "sitter/reservationListVs";
			}
				
			
			
		}
		return null;	
	}
	
	//예약 수락
	@RequestMapping("/acceptHsr")
	public String acceptHsr(int hsr_num, Model m) {
		if(hsrService.acceptHsr(hsr_num)) {
			m.addAttribute("msg", "수락이 완료되었습니다!");

		} else {
			m.addAttribute("msg", "예약을 수락할 수 없습니다.");
		}
		return "sitter/reservationListHs";
	}
	
	//거절
	@RequestMapping("/cancelHsr")
	public String cancelHsr(int hsr_num, Model m) {
		if(hsrService.cancelHsr(hsr_num)) {
			m.addAttribute("msg", "거절이 완료되었습니다!");
		} else {
			m.addAttribute("msg", "예약을 거절할 수 없습니다.");
		}
		return "sitter/reservationListHs";
	}
		
		
	
	//방문시터 예약현황 페이지
	@RequestMapping("/myReservationVs_Page")
	public String myResPageVS() {
		return "sitter/myReservation_visit";
	}
	
	@RequestMapping("/myReservationHs_Page")
	public String myResPageHS() {
		return "sitter/myReservation_home";
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
	
	//탈퇴 전 회원  확인 폼
	@RequestMapping(value = "/goodByeCheckUser", method = RequestMethod.GET)
	public String goodbByeCheckUserForm() {
		return "sitter/goodByeCheckUser";
	}
	
	@RequestMapping(value="goodBye", method=RequestMethod.GET)
	public String goodByeForm() {
		return "sitter/goodBye";
	}
	
	
	// 탈퇴 전회원 확인(비밀번호 확인)
	@RequestMapping(value = "/goodByeCheckUser", method = RequestMethod.POST)
	public String goodByeCheckUser(HttpSession session, int num, String pw, Model m, @RequestParam(defaultValue = "0") int p_num) {
		String type = (String)session.getAttribute("user_numtype");
		String url = "";
		
		if (type.equals("vs_num")) {
			VisitSitter vs = vsService.getVisitSitterByNum(num);
			if(vs.getVs_pass().equals(pw)) {
				m.addAttribute("vs", vs);
				m.addAttribute("msg", "정말로 탈퇴하시겠습니까?");
				vsService.deleteVisitSitter(vs.getVs_num());
				url =  "sitter/goodBye";
			} else {
				m.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
				url = "sitter/goodByeCheckUser";
			}
		} else if(type.equals("hs_num")) {
			HomeSitter hs = hsService.getHomeSitterByNum(num);
			if(hs.getHs_pass().equals(pw)) {
				m.addAttribute("hs", hs);
				m.addAttribute("msg", "정말로 탈퇴하시겠습니까?");
				hsService.deleteHomeSitter(num);
				url = "sitter/goodBye";
			} else {
				m.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
				url = "sitter/goodByeCheckUser";
			}
		}
		System.out.println(url);
		m.addAttribute("url", url);
		return "result";
	}
	
}

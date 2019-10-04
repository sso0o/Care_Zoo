package com.what.carezoo.sitter.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
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
import com.what.carezoo.model.HomeSitterReservation;
import com.what.carezoo.model.Pet;
import com.what.carezoo.model.Pet_Detail;
import com.what.carezoo.model.VisitSitter;
import com.what.carezoo.model.VisitSitterReservation;
import com.what.carezoo.pet.service.PetService;
import com.what.carezoo.pet.service.Pet_DetailService;
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
	
	
	@RequestMapping(value = "/myReservationHS" , method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getMyReservationHS(int hs_num) {
		Map<String, Object> rst = new HashMap<String, Object>();
		List<HomeSitterReservation> hsr = hsrService.getHomeSitterResByHSnum(hs_num);
		List<Customer> cList = new ArrayList<Customer>();
		System.out.println("hsr : "+hsr);
		if(hsr != null) {
			for (int i = 0; i < hsr.size(); i++) {
				Customer c = mService.getMemberByC_num(hsr.get(i).getC_num());
				cList.add(c);
			}
			rst.put("hsrList", hsr);
			rst.put("cList", cList);

		}
		
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
		System.out.println("여기오니이이이ㅣ이ㅣㅣㅣㅇ");
		Map<String, Object> rst = new HashMap<String, Object>();
		rst.put("vsInfo", vsService.getVisitSitterByNum(vs_num));
		return rst;
	}
	
	//hs정보 가져오기(ajax)
	@ResponseBody
	@RequestMapping("/getHomeInfo")
	public Map<String, Object> getHomeInfo(int hs_num) {
		System.out.println("여기오니이이이ㅣ이ㅣㅣㅣㅇ");
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
		String filename = mService.getImage(vs_num);
		rst.put("filename", filename);
		System.out.println("rst : "+rst);
		return rst;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getHsImg", method=RequestMethod.GET)
	public Map<String, Object> getHsImg(int hs_num) {
		System.out.println("vs넘어오나");
		System.out.println(hs_num);
		Map<String, Object> rst = new HashMap<String, Object>();
		String filename = mService.getImage(hs_num);
		rst.put("filename", filename);
		System.out.println("rst : "+rst);
		return rst;
	}
	
	
	

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
				url =  "sitter/modifyVisitInfo";
			} else {
				m.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
				url = "sitter/checkUser";
			}
		} else if(type.equals("hs_num")) {
			HomeSitter hs = hsService.getHomeSitterByNum(num);
			if(hs.getHs_pass().equals(pw)) {
				url = "sitter/modifyHomeInfo";
			} else {
				m.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
				url = "sitter/checkUser";
			}
		}

		return url;
	}
	
	//회원정보 수정vs
	@RequestMapping(value = "/modifyVs", method = RequestMethod.POST)
	public String modifyVs(VisitSitter vs, Model m, MultipartHttpServletRequest mtfRequest) {
		
		return null;
	}
	
	//회원정보 수정hs
	@RequestMapping(value = "/modifyHs", method = RequestMethod.POST)
	public String modifyVs(HomeSitter hs, Model m, MultipartHttpServletRequest mtfRequest) {

		return null;
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
	
	
	//방문시터 신청한 예약 목록 가져오기
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
	
	//가정시터 신청한 예약 목록 가져오기
	public List<HomeSitterReservation> getHsrList() {
		List<HomeSitterReservation> hsrList = new ArrayList<HomeSitterReservation>();

		return hsrList;

	}
	
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
	
	
	@RequestMapping("/acceptVsr")
	public String acceptVsr(HttpSession session, Model m, int vsr_num, @RequestParam(required = false) int b, @RequestParam(required = false) int c, @RequestParam(required = false) int d) {
		int vs_num = (Integer)session.getAttribute("user_num");
		System.out.println("vs_num : "+vs_num);
		//일반
		if(b == 0 && c==0 && d ==0) {
			//그날 내가 예약있는지부터 확인
			String resDate = vsrService.getVisitSitterResByVsrnum(vsr_num).getVsr_chkin();
			if(vsrService.checkDate(vs_num, resDate)==0 && vsrService.acceptVsr(vs_num,vsr_num)) {
				m.addAttribute("msg", "수락이 완료되었습니다!");
				return "sitter/myReservation_visit";
			} else {
				m.addAttribute("msg", "예약을 수락할 수 없습니다.(중복예약)");
				return "sitter/reservationListVs";
			}
			
		} else {//정기
			//내가 예약 가지고있는지부터 확인
			String[] resDate = {vsrService.getVisitSitterResByVsrnum(vsr_num).getVsr_chkin(),
			                        vsrService.getVisitSitterResByVsrnum(b).getVsr_chkin(),
			                        vsrService.getVisitSitterResByVsrnum(c).getVsr_chkin(),
			                        vsrService.getVisitSitterResByVsrnum(d).getVsr_chkin()};
			vsrService.acceptVsr(vs_num,vsr_num);
			
		}
		
		
	}
	
	//방문시터 예약현황 페이지
	@RequestMapping("/myReservationVs_Page")
	public String myResPageVS() {
		return "sitter/myReservation_visit";
	}

}

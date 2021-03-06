package com.what.carezoo.sitter.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.what.carezoo.member.service.MemberMailSendService;
import com.what.carezoo.member.service.MemberService;
import com.what.carezoo.model.Customer;
import com.what.carezoo.model.Pet;
import com.what.carezoo.model.VisitSitter;
import com.what.carezoo.model.VisitSitterReservation;
import com.what.carezoo.pet.service.PetService;
import com.what.carezoo.pet.service.Pet_DetailService;

import com.what.carezoo.sitter.service.VisitSitterReservationService;
import com.what.carezoo.sitter.service.VisitSitterService;
import com.what.carezoo.sitter.service.visitSitterMailSenderService;

@RequestMapping("/visit")
@Controller
public class VisitSitterController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private PetService petService;
	@Autowired
	private Pet_DetailService pdService;
	@Autowired
	private VisitSitterService vsService;
	@Autowired
	private VisitSitterReservationService vsrService;
	@Autowired
	private visitSitterMailSenderService mailsender;
	
	// 예약 메인(로그인, 회원가입)
	@PreAuthorize("isAuthenticated() && hasRole('ROLE_CUSTOMER')")
	@RequestMapping("/main")
	public String showMain(HttpSession session, Model model) {
		int c_num = (Integer) session.getAttribute("user_num");
		model.addAttribute("c_num", c_num);

		return "sitter/visit/reservation2";
	}

	// 주소
	@RequestMapping("/address")
	public String address() {
		return "sitter/visit/Address";
	}

	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm() {
		return "sitter/visit/joinForm";
	}

	// 방문시터 정보 가져오기
	@RequestMapping("/visitSitter")
	@ResponseBody
	public Map<String, Object> getVisitSitter(int vs_num) {
		Map<String, Object> rst = new HashMap<String, Object>();
		rst.put("vs", vsService.getVisitSitterByNum(vs_num));
		return rst;
	}

	// 일반돌봄신청
	@RequestMapping(value = "nomalapply", method = RequestMethod.GET)
	public String reservation3_1Form(Model model, int c_num) {
		model.addAttribute("c_num", c_num);
		return "sitter/visit/reservation3_1";
	}

	// 돌봄신청 폼(펫조인)
	@RequestMapping(value = "apply", method = RequestMethod.GET)
	public String reservation3Form(Model model, int c_num) {
		model.addAttribute("c_num", c_num);
		return "sitter/visit/reservation3";
	}

	// 펫등록(일반)
	@RequestMapping(value = "petjoin", method = RequestMethod.POST)
	public String petjoin(Model model, Pet pet, int c_num,MultipartHttpServletRequest mtfReq){
		//이미지 uuid가져오기
		MultipartFile file = mtfReq.getFile("file");
		System.out.println("일반,petjoin,file: "+file);
		
		String msg = "등록 실패";
		String url = "nomalapply?c_num=" + c_num;
			if (petService.insertPetFile(pet, file)) {
				msg = "등록성공";
				url = "petList1?c_num=" + c_num;
			}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("c_num", c_num);

		return "result";
	}
	
	// 펫등록(정기)
	@RequestMapping(value = "petjoin2", method = RequestMethod.POST)
	public String petjoin2(Model model, Pet pet, int c_num, MultipartHttpServletRequest mtfReq) {
		//이미지 uuid가져오기
		MultipartFile file = mtfReq.getFile("file");
		System.out.println("정기,petjoin2,file: "+file);
				
		String msg = "등록 실패";
		String url = "apply?c_num=" + c_num;
			if (petService.insertPetFile(pet, file)) {
				msg = "등록성공";
				url = "petList?c_num=" + c_num;
			}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("c_num", c_num);

		return "result";
	}

	// 일반 펫 리스트 폼
	@RequestMapping(value = "petList1", method = RequestMethod.GET)
	public String petList4_1Form(Model model, int c_num) {
		model.addAttribute("c_num", c_num);
		model.addAttribute("petList", petService.selectByC_Num(c_num));
		return "sitter/visit/petList4_1";
	}

	// 일반 펫리스트 강아지 고르기
	@RequestMapping(value = "petList1", method = RequestMethod.POST)
	public String petList4_1(@RequestParam() ArrayList<Integer> p_num, Model model, int c_num) {
//		String[] checks = request.getParameterValues("p_num");

		model.addAttribute("c_num", c_num);
		model.addAttribute("p_num", p_num);
		model.addAttribute("p_name", petService.selectOnlyNameByP_Num(p_num));
		// model.addAttribute("pList", petService.selectPet(p_num));
		return "redirect:reservation5_1";
	}

	// 펫리스트폼
	@RequestMapping(value = "petList", method = RequestMethod.GET)
	public String petList4Form(Model model, int c_num) {
		model.addAttribute("c_num", c_num);
		model.addAttribute("petList", petService.selectByC_Num(c_num));
		return "sitter/visit/petList4";
	}

	// 펫리스트에서 강아지 고르기
	@RequestMapping(value = "petList", method = RequestMethod.POST)
	public String petList(@RequestParam() ArrayList<Integer> p_num, Model model, int c_num) {
//		String[] checks = request.getParameterValues("p_num");

		model.addAttribute("c_num", c_num);
		model.addAttribute("p_num", p_num);
		model.addAttribute("p_name", petService.selectOnlyNameByP_Num(p_num));
		// model.addAttribute("pList", petService.selectPet(p_num));

		return "redirect:reservation5";
	}

	// 펫리스트에서 선택 펫 삭제
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public boolean delete(@RequestParam("p_num") int p_num) {
		return petService.deletePet(p_num);
	}

	// 일반예약 안내사항 폼
	@RequestMapping(value = "reservation5_1", method = RequestMethod.GET)
	public String preReservation5_1Form(@RequestParam() ArrayList<Integer> p_num, Model model, int c_num) {
		model.addAttribute("c_num", c_num);
		model.addAttribute("p_num", p_num);
		model.addAttribute("p_name", petService.selectOnlyNameByP_Num(p_num));
		return "sitter/visit/reservation5_1";
	}

	// 일반 예약요일, 시간, 추가시간 고르기
	@RequestMapping(value = "complete10", method = RequestMethod.POST)
	public String reservation6_1Form(@RequestParam() ArrayList<Integer> p_num, Model model, int c_num) {
		model.addAttribute("c_num", c_num);
		model.addAttribute("p_num", p_num);
		model.addAttribute("p_name", petService.selectOnlyNameByP_Num(p_num));
		return "sitter/visit/reservation6_1";
	}

	// 예약 전 안내사항 폼
	@RequestMapping(value = "reservation5", method = RequestMethod.GET)
	public String preReservation5Form(@RequestParam() ArrayList<Integer> p_num, Model model, int c_num) {
		model.addAttribute("c_num", c_num);
		model.addAttribute("p_num", p_num);
		model.addAttribute("p_name", petService.selectOnlyNameByP_Num(p_num));
		return "sitter/visit/reservation5";
	}

	// 예약 요일,시간, 추가시간 고르기
	@RequestMapping(value = "complete", method = RequestMethod.POST)
	public String reservation6Form(@RequestParam() ArrayList<Integer> p_num, Model model, int c_num) {
		model.addAttribute("c_num", c_num);
		model.addAttribute("p_num", p_num);
		model.addAttribute("p_name", petService.selectOnlyNameByP_Num(p_num));
		return "sitter/visit/reservation6";
	}

	// 예약날자 리스트 확인(일반)
	@RequestMapping(value = "complete11", method = RequestMethod.POST)
	public String reservation7_1Form(@RequestParam ArrayList<Integer> p_num, int c_num, String vsr_chkin,
			String vsr_hour, String vsr_hAdd, Model model) {
		System.out.println("complete11,vsr_chkin: " + vsr_chkin);
		// 문자열 조각내기
		String[] tempVsr_chkin = vsr_chkin.split(",");
		// visitReservation, pet_detail 동시에 저장!
		// visitReservation저장
		VisitSitterReservation vsr = new VisitSitterReservation();
		ArrayList<Integer> vsr_num = new ArrayList<Integer>();
			for (int i = 0; i < tempVsr_chkin.length; i++) {

				vsr.setC_num(c_num);
				vsr.setVsr_chkin(tempVsr_chkin[i]);
				vsr.setVsr_hAdd(vsr_hAdd);
				vsr.setVsr_hour(vsr_hour);

				if (vsr.getVsr_day() == null) {
					vsr.setVsr_day("7");
				}
				vsrService.insertVisitSitterReservation(vsr);
				vsr_num.add(vsr.getVsr_num());
				// pet_detail저장
				for (int j = 0; j < p_num.size(); j++) {
					pdService.insertPet_Detail(vsr.getVsr_num(), p_num.get(j), c_num);
					System.out.println("test,p_num: "+p_num.get(j)+",test,chkin: "+tempVsr_chkin[i]);
					//System.out.println(vsrService.selectByP_numVsr_chkin(p_num.get(j), tempVsr_chkin[i]));
						if (vsrService.selectByP_numVsr_chkin(p_num.get(j), tempVsr_chkin[i]) > 1) {
							System.out.println(vsr_num.size());
						for(int k =0;k<vsr_num.size();k++) {
							System.out.println(vsr_num.get(k));
							vsrService.deleteVisitSitterReservation(vsr_num.get(k));
							pdService.deletePet_Detail(vsr_num.get(k));
						}
						model.addAttribute("msg", "중복예약입니다.");
						model.addAttribute("c_num", c_num);
						model.addAttribute("p_num", p_num);
						model.addAttribute("p_name", petService.selectOnlyNameByP_Num(p_num));
						return "sitter/visit/reservation6_1";
					}
						
				}
			}
			// count 업로드!!
			vsrService.updateVsrCount(c_num);

		

		System.out.println("complete11,post2:" + vsr_num);
		model.addAttribute("list", vsrService.selectByVsrnumbers(vsr_num));
		model.addAttribute("p_num", p_num);
		model.addAttribute("c_num", c_num);
//		model.addAttribute("vsr_num", vsr_num);
		return "sitter/visit/reservation7_1";
		}

	// 예약리스트의 요일 삭제
	@RequestMapping(value = "delete1", method = RequestMethod.POST)
	@ResponseBody
	public boolean delete1(int vsr_num) {
		System.out.println("delete1: " + vsr_num);
		return vsrService.deleteVisitSitterReservation(vsr_num);
	}

	// 추가/변경폼
	@RequestMapping(value = "addForm", method = RequestMethod.GET)
	public String addForm(int vsr_num, String vsr_chkin, String vsr_hour, String vsr_hAdd, int c_num, Model model,
			int vsr_count) {
		// p_num 어떻게 넘기는지...
		ArrayList<Integer> p_num = new ArrayList<Integer>();
		for (int i = 0; i < pdService.selectByVsr_Num(vsr_num).size(); i++) {
			System.out.println(pdService.selectByVsr_Num(vsr_num).get(i).getP_num());
			int nums = pdService.selectByVsr_Num(vsr_num).get(i).getP_num();
			p_num.add(nums);
		}
		System.out.println("addForm결과===========" + p_num);
		model.addAttribute("vsr_chkin", vsr_chkin);
		model.addAttribute("vsr_hour", vsr_hour);
		model.addAttribute("vsr_hAdd", vsr_hAdd);
		model.addAttribute("c_num", c_num);
		model.addAttribute("p_num", p_num);
		model.addAttribute("vsr_num", vsr_num);
		model.addAttribute("vsr_count", vsr_count);
		return "sitter/visit/addForm";
	}

	// 추가/변경폼2
	@RequestMapping(value = "adds", method = RequestMethod.POST)
	public String hAdd(String vsr_chkin, String vsr_hour, String vsr_hAdd, int vsr_num,
			@RequestParam ArrayList<Integer> p_num, int c_num, Model model, int vsr_count) {
		System.out.println("adds,p_num: " + p_num);
		System.out.println(vsr_hour);
		System.out.println(vsr_hAdd);
		System.out.println(vsr_chkin);
		System.out.println("=============:" + vsr_count);
		// update 하고, complete11(redirect)
		System.out.println(vsrService.updateVisitSitterReservation(vsr_hour, vsr_hAdd, vsr_chkin, vsr_count));
		vsrService.updateVisitSitterReservation(vsr_hour, vsr_hAdd, vsr_chkin, vsr_count);
		model.addAttribute("c_num", c_num);
		model.addAttribute("vsr_num", vsr_num);
		model.addAttribute("vsr_count", vsr_count);
//		model.addAttribute("p_num", p_num);
//		model.addAttribute("vsr_chkin", vsr_chkin);
//		model.addAttribute("vsr_hour", vsr_hour);
//		model.addAttribute("vsr_hAdd", vsr_hAdd);
		return "redirect:complete11";
	}

	// 예약날자 리스트 확인(일반 adds)
	@RequestMapping(value = "complete11", method = RequestMethod.GET)
	public String reservation7_1Form2(int c_num, int vsr_num, Model model, int vsr_count) {

		ArrayList<Integer> p_num = new ArrayList<Integer>();
		for (int i = 0; i < pdService.selectByVsr_Num(vsr_num).size(); i++) {
			System.out.println("complete11,get: " + pdService.selectByVsr_Num(vsr_num).get(i).getP_num());
			int nums = pdService.selectByVsr_Num(vsr_num).get(i).getP_num();
			p_num.add(nums);
		}
		System.out.println("complete11결과===========" + p_num);
		System.out.println("complete11,get,vsr_count " + vsr_count);

		model.addAttribute("list", vsrService.selectByVsrCount(vsr_count));
		model.addAttribute("p_num", p_num);
		model.addAttribute("c_num", c_num);
		model.addAttribute("vsr_num", vsr_num);
		return "sitter/visit/reservation7_1";
	}

	// 전달 요청사항 신청폼(일반신청)
	@RequestMapping(value = "complete22", method = RequestMethod.POST)
	public String reservationBtn(@RequestParam() ArrayList<Integer> p_num, Model model, int c_num,
			@RequestParam() ArrayList<Integer> vsr_num, int vsr_count) {

		model.addAttribute("p_num", p_num);
		model.addAttribute("c_num", c_num);
		model.addAttribute("vsr_num", vsr_num);
		model.addAttribute("vsr_count", vsr_count);

		return "sitter/visit/reservation8";
	}

	// 놀이시간표체크폼
	@RequestMapping(value = "playPlan", method = RequestMethod.GET)
	public String playPlanForm() {
		return "sitter/visit/playPlan";
	}

	// 예약 확인및 결제정보 (일반)
	@RequestMapping(value = "sub", method = RequestMethod.POST)
	public String reservation10(@RequestParam() ArrayList<Integer> p_num, Model model, int c_num, String vsr_attention,
			String vsr_contents, @RequestParam() ArrayList<Integer> vsr_num, int vsr_count)
			throws JsonProcessingException {
		System.out.println("sub: "+vsr_num);
		// 특이사항 요청 저장하기
		String attention = "";
		if (vsr_attention == null) {
			attention = "0";
		} else {
			attention = vsr_attention;
		}
		String contents = "";
		if (vsr_contents == "") {
			contents = "0";
		} else {
			contents = vsr_contents;
		}

		vsrService.updateContents(attention, contents, vsr_num);

		model.addAttribute("p_num", p_num);
		model.addAttribute("c_num", c_num);
		model.addAttribute("vsr_count", vsr_count);
		model.addAttribute("address", memberService.getMemberByC_num(c_num));
		model.addAttribute("nameList", petService.selectOnlyNameByP_Num(p_num));
		model.addAttribute("vsr_hAddList", vsrService.selectByVsrCount(vsr_count));

		// map에 담아보기..(p_num)
		Map<String, Object> d = new HashMap<String, Object>();
		ObjectMapper om = new ObjectMapper();
		for (int i = 0; i < p_num.size(); i++) {

			d.put("p_num" + i, p_num.get(i));

		}
		String jsonStr = om.writeValueAsString(d);
		System.out.println("sub: " + jsonStr);

		model.addAttribute("list", jsonStr);

		return "redirect:payment";
	}

	// 요금 세부 정보 보기 폼
	// json으로 만들어서 보내야한다..
	@RequestMapping(value = "payment", method = RequestMethod.GET)
	public String paymentForm(Model model, int c_num, @RequestParam() ArrayList<Integer> p_num, int vsr_count)
			throws JsonProcessingException {

		System.out.println("payment: " + c_num + "payment" + p_num + "vsr_count" + vsr_count);
		model.addAttribute("p_num", p_num);
		model.addAttribute("c_num", c_num);
		model.addAttribute("vsr_count", vsr_count);
		// map에 담아보기..(p_num)
		Map<String, Object> d = new HashMap<String, Object>();
		ObjectMapper om = new ObjectMapper();
		for (int i = 0; i < p_num.size(); i++) {

			d.put("p_num" + i, p_num.get(i));

		}
		String jsonStr = om.writeValueAsString(d);
		System.out.println("zzzzz: " + jsonStr);

		model.addAttribute("list", jsonStr);

		Map<String, Object> dd = new HashMap<String, Object>();
		System.out.println(vsrService.selectByVsrCount(vsr_count).size());
		for (int i = 0; i < vsrService.selectByVsrCount(vsr_count).size(); i++) {
			dd.put("vsr_chkin" + i, vsrService.selectByVsrCount(vsr_count).get(i).getVsr_chkin());
		}
		String jsonStr2 = om.writeValueAsString(dd);
		System.out.println("zzzzzz2: " + jsonStr2);
		System.out.println("zzzzzz3: " + vsrService.getVisitSitterResByCnum(c_num));
		model.addAttribute("list2", jsonStr2);
		model.addAttribute("vsr_hAddList", vsrService.selectByVsrCount(vsr_count));
		return "sitter/visit/payment";
	}

	// payment중 p_num파싱!!
	@RequestMapping(value = "test", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> test(@RequestParam Map<String, Object> p_num) {

		System.out.println("str-----" + p_num);

		return p_num;
	}

	// payment중 pd_week파싱!!
	@RequestMapping(value = "test2", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> test2(@RequestParam Map<String, Object> vsr_chkin) {

		System.out.println("str2-----" + vsr_chkin);

		return vsr_chkin;
	}

	// 예약 확인 및 결제정보 폼
	@RequestMapping(value = "reservation10", method = RequestMethod.POST)
	public String reservation10Form(@RequestParam() ArrayList<Integer> p_num, Model model, int c_num, int vsr_count, @RequestParam()ArrayList<String> hAdds,String basicTotal)
			throws JsonProcessingException {
		
		System.out.println("reservation10, hAdds: "+ hAdds);
		System.out.println(basicTotal);
		List<VisitSitterReservation> selectList = vsrService.selectAddPrice(vsr_count, c_num);
		System.out.println(selectList);
		List<Map<String, Object>> rst = new ArrayList<Map<String,Object>>();
		

		for (int i = 0; i < hAdds.size(); i++) {
//			System.out.println((selectList.get(i).getVsr_num()));
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("num",selectList.get(i).getVsr_num());
			map.put("hadds", hAdds.get(i));
			map.put("basic", basicTotal);
			rst.add(map);
		}
		System.out.println(rst);
		vsrService.updatePrice(rst);
//		for(int i=0;i<list.size();i++) {
//			System.out.println(list.get(i).getVsr_num());
//			System.out.println(hAdds.get(i));
//			System.out.println(vsrService.updatePrice(basicTotal, hAdds.get(i), list.get(i).getVsr_num()));
//			
//		}
		model.addAttribute("p_num", p_num);
		model.addAttribute("c_num", c_num);
		model.addAttribute("address", memberService.getMemberByC_num(c_num));
		model.addAttribute("nameList", petService.selectOnlyNameByP_Num(p_num));
		model.addAttribute("vsr_hAddList", vsrService.selectByVsrCount(vsr_count));
		

		// map에 담아보기..(p_num)
		Map<String, Object> d = new HashMap<String, Object>();
		ObjectMapper om = new ObjectMapper();
		for (int i = 0; i < p_num.size(); i++) {

			d.put("p_num" + i, p_num.get(i));

		}
		String jsonStr = om.writeValueAsString(d);
		System.out.println("reservation10: " + jsonStr);

		model.addAttribute("list", jsonStr);

		return "sitter/visit/reservation10";
	}

	// 일반 예약완료
	@RequestMapping(value = "end", method = RequestMethod.POST)
	public String end(Model model, String vsr_totalPrice, @RequestParam ArrayList<Integer> vsr_num) {
		System.out.println(vsr_totalPrice);
		System.out.println(vsr_num);
		System.out.println(vsrService.updateTotalPrice(vsr_totalPrice, vsr_num));
		vsrService.updateTotalPrice(vsr_totalPrice, vsr_num);
		model.addAttribute("msg", "예약접수가 완료 되었습니다.");

		return "main";
	}

	// 정기요일의 날자를 선택(정기돌봄)
	@RequestMapping(value = "complete1", method = RequestMethod.POST)
	public String reservation7Form(Model model, int c_num, @RequestParam() ArrayList<Integer> p_num, String vsr_day,
			String vsr_hour, String vsr_hAdd) {
		System.out.println("정기,complete,p_num: "+p_num);
		// 문자열 조각내기
		String[] tempVsr_day = vsr_day.split(",");
		// visitReservation, pet_detail 동시에 저장!
		// chkin 날자열에 맞춰서 추가 삽입!

		// visitReservation저장
		VisitSitterReservation vsr = new VisitSitterReservation();
		ArrayList<Integer> vsr_num = new ArrayList<Integer>();
		for (int i = 0; i < tempVsr_day.length; i++) {

			vsr.setC_num(c_num);
			vsr.setVsr_day(tempVsr_day[i]);
			vsr.setVsr_hAdd(vsr_hAdd);
			vsr.setVsr_hour(vsr_hour);

			if (vsr.getVsr_chkin() == null) {
				vsr.setVsr_chkin("0");
			}
			vsrService.insertVisitSitterReservation(vsr);
			System.out.println(vsr.getVsr_num());
			vsr_num.add(vsr.getVsr_num());
			for (int j = 0; j < p_num.size(); j++) {
				pdService.insertPet_Detail(vsr.getVsr_num(), p_num.get(j), c_num);
			}
		}
		// count 업로드!!
		vsrService.updateVsrCount(c_num);

		model.addAttribute("list", vsrService.selectByVsrnumbers(vsr_num));
		model.addAttribute("p_num", p_num);
		model.addAttribute("c_num", c_num);
		return "sitter/visit/reservation7";

	}

	// 정기요일의 날자를 선택(정기돌봄 ajax)
	@RequestMapping(value = "complete1", method = RequestMethod.GET)
	public String reservation7Form2(Model model, int c_num, int vsr_num, int vsr_count) {
		// int c_num,int vsr_num,
		ArrayList<Integer> p_num = new ArrayList<Integer>();
		for (int i = 0; i < pdService.selectByVsr_Num(vsr_num).size(); i++) {
			System.out.println(pdService.selectByVsr_Num(vsr_num).get(i).getP_num());
			int nums = pdService.selectByVsr_Num(vsr_num).get(i).getP_num();
			p_num.add(nums);
		}
		System.out.println("결과===========" + p_num);

		model.addAttribute("list", vsrService.selectByVsrCount(vsr_count));
		model.addAttribute("p_num", p_num);
		model.addAttribute("c_num", c_num);
		return "sitter/visit/reservation7";

	}

	// 추가/변경폼
	@RequestMapping(value = "addForm2", method = RequestMethod.GET)
	public String addForm2(int vsr_num, String vsr_day, String vsr_hour, String vsr_hAdd, int c_num, Model model,
			int vsr_count) {
		// p_num 어떻게 넘기는지...
		ArrayList<Integer> p_num = new ArrayList<Integer>();
		for (int i = 0; i < pdService.selectByVsr_Num(vsr_num).size(); i++) {
			System.out.println(pdService.selectByVsr_Num(vsr_num).get(i).getP_num());
			int nums = pdService.selectByVsr_Num(vsr_num).get(i).getP_num();
			p_num.add(nums);
		}
		System.out.println("결과===========" + p_num);
		model.addAttribute("vsr_day", vsr_day);
		model.addAttribute("vsr_hour", vsr_hour);
		model.addAttribute("vsr_hAdd", vsr_hAdd);
		model.addAttribute("c_num", c_num);
		model.addAttribute("p_num", p_num);
		model.addAttribute("vsr_num", vsr_num);
		model.addAttribute("vsr_count", vsr_count);
		return "sitter/visit/addForm2";
	}

	// 추가/변경폼2
	@RequestMapping(value = "adds2", method = RequestMethod.POST)
	public String hAdd2(String vsr_day, String vsr_hour, String vsr_hAdd, int vsr_num,
			@RequestParam ArrayList<Integer> p_num, int c_num, Model model, int vsr_count) {
		// update 하고, complete11(redirect)
		System.out.println(p_num);
		System.out.println(vsr_hour);
		System.out.println(vsr_hAdd);
		System.out.println(vsr_day);
		System.out.println(vsr_count);
		System.out.println(vsrService.updateVisitSitterReservation2(vsr_hour, vsr_hAdd, vsr_day, vsr_count));
		vsrService.updateVisitSitterReservation2(vsr_hour, vsr_hAdd, vsr_day, vsr_count);
		System.out.println(p_num);
		model.addAttribute("c_num", c_num);
		model.addAttribute("vsr_num", vsr_num);
		model.addAttribute("vsr_count", vsr_count);
		return "redirect:complete1";
	}

	// 전달 요청사항 신청폼(정기신청)
	@RequestMapping(value = "complete2", method = RequestMethod.POST)
	public String reservationBtn2(@RequestParam() ArrayList<Integer> p_num, Model model, int c_num,
			@RequestParam() ArrayList<Integer> vsr_num, @RequestParam() ArrayList<String> vsr_day, int vsr_count) {
		model.addAttribute("p_num", p_num);
		model.addAttribute("c_num", c_num);
		model.addAttribute("vsr_num", vsr_num);
		model.addAttribute("vsr_day", vsr_day);
		model.addAttribute("vsr_count", vsr_count);
		model.addAttribute("list", vsrService.selectByVsrCount(vsr_count));

		return "sitter/visit/calendal";
	}

	// 시작날자 정함
	@RequestMapping(value = "getDate", method = RequestMethod.POST)
	public String reservation8Form(Model model, int c_num, @RequestParam() ArrayList<Integer> p_num,
			@RequestParam() ArrayList<Integer> vsr_num, String vsr_chkin, int vsr_count, String vsr_day,
			String vsr_hour, String vsr_hAdd) {
		// chkin 날자 update 해줘야함...
		System.out.println("c_num: "+c_num);
		System.out.println("getDate,vsr_num: " + vsr_num);
		System.out.println("vsr_chkin: " + vsr_chkin);
		System.out.println("vsr_day: " + vsr_day);
		System.out.println("vsr_count: " + vsr_count);
		System.out.println("p_num: " + p_num);
		
		//pet_detail 기존에 있던거 삭제하기
		pdService.deleteByListVsr_num(vsr_num);
		
		//날자 선택 안했을 때!!
		if(vsr_chkin == null) {
			model.addAttribute("p_num", p_num);
			model.addAttribute("c_num", c_num);
			model.addAttribute("vsr_num", vsr_num);
			model.addAttribute("vsr_day", vsr_day);
			model.addAttribute("vsr_count", vsr_count);
			model.addAttribute("list", vsrService.selectByVsrCount(vsr_count));
			model.addAttribute("msg", "날자를 선택해주세요");
			return "sitter/visit/calendal";
		}
		
		String[] tempVsr_chkin = vsr_chkin.split(",");

		VisitSitterReservation vsr = new VisitSitterReservation();
		ArrayList<Integer> number = new ArrayList<Integer>();
		for (int i = 0; i < tempVsr_chkin.length; i++) {

			vsr.setC_num(c_num);
			vsr.setVsr_chkin(tempVsr_chkin[i]);
			vsr.setVsr_hAdd(vsr_hAdd);
			vsr.setVsr_hour(vsr_hour);
			vsr.setVsr_day(vsr_day);
			vsr.setVsr_count(vsr_count);
			vsrService.insertVisitSitterReservation(vsr);
			number.add(vsr.getVsr_num());		
			// pet_detail저장
			for (int j = 0; j < p_num.size(); j++) {
					pdService.insertPet_Detail(vsr.getVsr_num(), p_num.get(j), c_num);
			}
		}
		vsrService.updateVsrCount(c_num);
		vsrService.deleteByListVsrNum(vsr_num);
		
		//중복 없애기...
		System.out.println("dddddddddddd: "+number);
		for(int i =0;i<number.size();i++) {
			for(int j=0;j<p_num.size();j++) {
				System.out.println("test,vsr_num: "+number.get(i)+" vsr_chkin: "+tempVsr_chkin[i]+" p_num: "+p_num.get(j));
				
				System.out.println(vsrService.selectByP_numVsr_chkin(p_num.get(j), tempVsr_chkin[i]));
					if (vsrService.selectByP_numVsr_chkin(p_num.get(j), tempVsr_chkin[i]) > 1) {
						vsrService.deleteByListVsrNum(number);
						pdService.deleteByListVsr_num(number);
					model.addAttribute("msg", "중복예약입니다.");
					model.addAttribute("c_num", c_num);
					model.addAttribute("p_num", p_num);
					model.addAttribute("p_name", petService.selectOnlyNameByP_Num(p_num));
					return "sitter/visit/reservation6";
				}
			}
			
		}
		model.addAttribute("c_num", c_num);
		model.addAttribute("p_num", p_num);
		model.addAttribute("vsr_num", number);
		model.addAttribute("vsr_count", vsr_count);
		return "sitter/visit/reservation8";
	}

	///////////////////////////////////////////////////////////////////////////////
	// VisitSitter MyPage
	//아이디 유효성 검사
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> idCheck(String vs_email) {
		System.out.println("vs_email: "+vs_email);
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		count = vsService.userIdCheck(vs_email);
		System.out.println("count: "+count);
		map.put("cnt", count);
		return map;
	}
	
	//회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(VisitSitter vs, Model m, MultipartHttpServletRequest mtfReq, HttpServletRequest request) {
		String phone = request.getParameter("phone");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		System.out.println(phone);
		System.out.println(phone1);
		System.out.println(phone2);
		String contact = phone+phone1+phone2;
		vs.setVs_contact(contact);
		// 이미지 uuid가져오기
		MultipartFile file = mtfReq.getFile("file");
		System.out.println("일반,petjoin,file: " + file);
		boolean rst = vsService.insertVisitSitterFile(vs, file);
		if (rst) {
			// 인증메일 보내기 메서드
			mailsender.mailSendWithMemberKey(vs.getVs_email(), vs.getVs_name(), request);
			m.addAttribute("msg", "인증 메일이 전송 되었습니다. 확인후 로그인 해주세요 :)");
			return "main";

		} else {
			return "joinForm_visitSitter";
		}

	}
	
	// e-mail 인증 컨트롤러
	@RequestMapping(value = "/key_alter", method = RequestMethod.GET)
	public String key_alterConfirm(VisitSitter vs, Model m
			, String vs_email, String vs_email_key
			) {
		System.out.println("이거 메일 인증 커느롤러"+mailsender.alter_userKey_service(vs.getVs_email(), vs.getVs_email_key())); // mailsender의 경우 @Autowired
		
		if(mailsender.alter_userKey_service(vs.getVs_email(), vs.getVs_email_key())>0) {
			m.addAttribute("msg", "회원가입이 완료되었습니다! 로그인을 해 주세요:)");
			m.addAttribute("url", "loginForm");

			return "result";
		} 
		return "main";
	}
}

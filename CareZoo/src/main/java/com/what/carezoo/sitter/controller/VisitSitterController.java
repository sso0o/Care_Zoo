package com.what.carezoo.sitter.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.what.carezoo.dao.Pet_WeekListDao;
import com.what.carezoo.member.service.MemberService;
import com.what.carezoo.model.Pet;
import com.what.carezoo.model.Pet_Detail;
import com.what.carezoo.model.Pet_Details;
import com.what.carezoo.model.Pet_WeekList;
import com.what.carezoo.pet.service.PetService;
import com.what.carezoo.pet.service.Pet_DetailService;
import com.what.carezoo.sitter.service.VisitSitterService;
@RequestMapping("/visit")
@Controller
public class VisitSitterController{
	@Autowired
	private MemberService memberService;
	@Autowired
	private PetService petService;
	@Autowired
	private Pet_DetailService pdService;
	@Autowired
	private Pet_WeekListDao pwlServcie;
	@Autowired
	private VisitSitterService vsService;
	
	//예약 메인(로그인, 회원가입)
	@PreAuthorize("isAuthenticated()")
	@RequestMapping("/main")
	public String showMain(HttpSession session,Model model) {
		int c_num = (Integer)session.getAttribute("c_num");
		model.addAttribute("c_num", c_num);
		
		return "sitter/visit/reservation2";
	}
	//주소
	@RequestMapping("/address")
	public String address() {
		return "sitter/visit/Address";
	}
	//회원가입
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinForm() {
		return "sitter/visit/joinForm";
	}
	
	//방문시터 정보 가져오기
	@RequestMapping("/visitSitter")
	@ResponseBody
	public Map<String, Object> getVisitSitter(int vs_num){
		Map<String, Object> rst = new HashMap<String, Object>();
		rst.put("vs", vsService.getVisitSitterByNum(vs_num));
		return rst;
	}
	
	
//	@RequestMapping(value="/join", method=RequestMethod.POST)
//	public String join(Customer customer,Model model) {
//		if(customer.getC_address() != null & customer.getC_birth() !=null
//				& customer.getC_contact() != null & customer.getC_d_address() != null 
//				& customer.getC_e_address() !=null & customer.getC_email() !=null 
//				& customer.getC_name()!=null & customer.getC_pass() !=null 
//				& customer.getC_pass_chk() !=null	& customer.getC_sex() != null) {
//			boolean result =memberService.joinMember(customer);
//			//loginForm -> /member/loginForm 으로 가버리기 때문에 contextPath가 필요하다.
//			if(result) {
//				model.addAttribute("c_num", memberService.getMemberByEmail(customer.getC_email()).getC_num());
//				return "sitter/visit/reservation2";
//			}
//			String msg ="비밀번호 일치 여부를 확인해 주세요";
//			String url = "join";
//			model.addAttribute("msg", msg);
//			model.addAttribute("url", url);
//			return "result";
//		}
//		String msg ="빈칸이 있는지 확인해 주세요";
//		String url = "join";
//		model.addAttribute("msg", msg);
//		model.addAttribute("url", url);
//		return "result";
//	}

	//일반돌봄신청
	@RequestMapping(value="nomalapply",method=RequestMethod.GET)
	public String reservation3_1Form(Model model,int c_num){
		model.addAttribute("c_num", c_num);
		return "sitter/visit/reservation3_1";
	}
	
	//돌봄신청 폼(펫조인)
	@RequestMapping(value="apply",method=RequestMethod.GET)
	public String reservation3Form(Model model,int c_num) {
		model.addAttribute("c_num", c_num);
		return "sitter/visit/reservation3";
	}
	
	//펫등록
	@RequestMapping(value="petjoin", method=RequestMethod.POST)
	public String petjoin(Model model,Pet pet,int c_num) {
		String msg="등록 실패";
		String url="apply?c_num="+c_num;
		if (pet.getC_num() != 0 & pet.getP_birth() != null & pet.getP_img() != null
				& pet.getP_kind() != null & pet.getP_name() != null & pet.getP_none_sex() != null
				& pet.getP_notify() != null & pet.getP_sex() != null & pet.getP_weight() != null) {
			if (petService.insertPet(pet)) {
				msg="등록성공";
				url="petList?c_num="+c_num;
			}
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("c_num", c_num);

		return "result";
	}
	//일반 펫 리스트 폼
	@RequestMapping(value="petList1",method=RequestMethod.GET)
	public String petList4_1Form(Model model,int c_num) {
		model.addAttribute("c_num", c_num);
		model.addAttribute("petList", petService.selectByC_Num(c_num));
		return "sitter/visit/petList4_1";
	}
	
	//일반 펫리스트 강아지 고르기
	@RequestMapping(value="petList1", method=RequestMethod.POST)
	public String petList4_1(@RequestParam() ArrayList<Integer> p_num,Model model,int c_num) {
//		String[] checks = request.getParameterValues("p_num");
		
		model.addAttribute("c_num", c_num);
		model.addAttribute("p_num",p_num);
		model.addAttribute("p_name",petService.selectOnlyNameByP_Num(p_num));
		//model.addAttribute("pList", petService.selectPet(p_num));
		return "redirect:reservation5_1";
	}
	
	//펫리스트폼
	@RequestMapping(value="petList",method=RequestMethod.GET)
	public String petList4Form(Model model,int c_num) {
		model.addAttribute("c_num", c_num);
		model.addAttribute("petList", petService.selectByC_Num(c_num));
		return "sitter/visit/petList4";
	}
	
	//펫리스트에서 강아지 고르기
	@RequestMapping(value="petList", method=RequestMethod.POST)
	public String petList(@RequestParam() ArrayList<Integer> p_num,Model model,int c_num) {
//		String[] checks = request.getParameterValues("p_num");
		
		model.addAttribute("c_num", c_num);
		model.addAttribute("p_num",p_num);
		model.addAttribute("p_name",petService.selectOnlyNameByP_Num(p_num));
		//model.addAttribute("pList", petService.selectPet(p_num));
			
		return "redirect:reservation5";
	}
	
	//일반예약 안내사항 폼
	@RequestMapping(value="reservation5_1",method=RequestMethod.GET)
	public String preReservation5_1Form(@RequestParam() ArrayList<Integer> p_num,Model model,int c_num) {	
		model.addAttribute("c_num", c_num);
		model.addAttribute("p_num", p_num);
		model.addAttribute("p_name", petService.selectOnlyNameByP_Num(p_num));
		return "sitter/visit/reservation5_1";
	}
	
	//일반 예약요일, 시간, 추가시간 고르기
	@RequestMapping(value="complete10",method=RequestMethod.POST)
	public String reservation6_1Form(@RequestParam() ArrayList<Integer> p_num,Model model,int c_num) {	
		model.addAttribute("c_num", c_num);
		model.addAttribute("p_num", p_num);
		model.addAttribute("p_name", petService.selectOnlyNameByP_Num(p_num));
		return "sitter/visit/reservation6_1";
	}
	
	//예약 전 안내사항 폼
	@RequestMapping(value="reservation5",method=RequestMethod.GET)
	public String preReservation5Form(@RequestParam() ArrayList<Integer> p_num,Model model,int c_num) {	
		model.addAttribute("c_num", c_num);
		model.addAttribute("p_num", p_num);
		model.addAttribute("p_name", petService.selectOnlyNameByP_Num(p_num));
		return "sitter/visit/reservation5";
	}
	//예약 요일,시간, 추가시간 고르기
	@RequestMapping(value="complete",method=RequestMethod.POST)
	public String reservation6Form(@RequestParam() ArrayList<Integer> p_num,Model model,int c_num) {	
		model.addAttribute("c_num", c_num);
		model.addAttribute("p_num", p_num);
		model.addAttribute("p_name", petService.selectOnlyNameByP_Num(p_num));
		return "sitter/visit/reservation6";
	}
	//예약내용 확인하는 폼(정기돌봄)
	@RequestMapping(value="complete1",method=RequestMethod.POST)
	public String reservation7Form(Model model,Pet_Details list
			,@RequestParam() ArrayList<Integer> p_num,int c_num,
					@RequestParam() ArrayList<String> p_name) {
		
		System.out.println(list);
		for(int i : p_num) {
			list.setC_num(c_num);
		}
		list.setP_name(p_name);
		pdService.insertPet_Detail2(list);//저장
		
		model.addAttribute("c_num", c_num);
		model.addAttribute("p_name",list.getP_name());
		model.addAttribute("pd_week", list.getPd_week());
		model.addAttribute("pd_hour", list.getPd_hour());
		model.addAttribute("pd_hAdd", list.getPd_hAdd());
		model.addAttribute("p_num", p_num);
		//model.addAttribute("pd_List", pdService.selectByP_Num(p_num));
		return "sitter/visit/reservation7";
	}
	
	//예약내용 확인하는 폼(일반돌봄)
	@RequestMapping(value="complete11",method=RequestMethod.POST)
	public String reservation9Form(Model model,Pet_Details list
			,@RequestParam() ArrayList<Integer> p_num,int c_num,
					@RequestParam() ArrayList<String> p_name) throws JsonProcessingException {
		
		System.out.println(list);
		for(int i : p_num) {
			list.setC_num(c_num);
		}
		list.setP_name(p_name);
		pdService.insertPet_Detail2(list);//저장
		
		model.addAttribute("c_num", c_num);
		model.addAttribute("p_name",list.getP_name());
		model.addAttribute("pd_week", list.getPd_week());
		model.addAttribute("pd_hour", list.getPd_hour());
		model.addAttribute("pd_hAdd", list.getPd_hAdd());
		model.addAttribute("p_num", p_num);
		
		return "sitter/visit/reservation7_1";
	}
	//ajax방식
	@RequestMapping(value="complete11",method=RequestMethod.GET)
	public String complete11List(int c_num,Model model ) {
		System.out.println(c_num);
		System.out.println("조회======="+pdService.selectByC_Num(c_num));
		
		Set<String> p_name = new HashSet<String>();
		Set<String> pd_week = new HashSet<String>();
		Set<String> pd_hour = new HashSet<String>();
		Set<String> pd_hAdd = new HashSet<String>();
		Set<Integer> p_num = new HashSet<Integer>();
		
		for(int i=0;i<pdService.selectByC_Num(c_num).size();i++) {
			p_name.add(pdService.selectByC_Num(c_num).get(i).getP_name());
			p_num.add(pdService.selectByC_Num(c_num).get(i).getP_num());
			pd_week.add(pdService.selectByC_Num(c_num).get(i).getPd_week());
			pd_hour.add(pdService.selectByC_Num(c_num).get(i).getPd_hour());
			pd_hAdd.add(pdService.selectByC_Num(c_num).get(i).getPd_hAdd());
			
		}

		model.addAttribute("c_num", c_num);
		model.addAttribute("p_name", p_name);
		model.addAttribute("pd_week", pd_week);
		model.addAttribute("pd_hour", pd_hour);
		model.addAttribute("pd_hAdd", pd_hAdd);
		model.addAttribute("p_num", p_num);
		model.addAttribute("pd_List", pdService.selectByC_Num(c_num));
		return "sitter/visit/reservation7_1";
	}
	
	//펫리스트에서 선택 펫 삭제
	@RequestMapping(value="delete",method=RequestMethod.POST)
	@ResponseBody
	public boolean delete(@RequestParam("p_num") int p_num) {
		return petService.deletePet(p_num);
	}
	
	//추가/변경폼
	@RequestMapping(value="addForm",method=RequestMethod.GET)
	public String addForm() {
		return "sitter/visit/addForm";
	}
	
	//추가/변경폼2
	@RequestMapping(value="hAdd", method=RequestMethod.POST)
	public String hAdd() {
		return "";
		
	}
	
	//예약리스트의 요일 삭제
	@RequestMapping(value="delete1",method=RequestMethod.POST)
	@ResponseBody
	public boolean delete1(@RequestParam() String pd_week,@RequestParam() String pd_hAdd) {
		System.out.println("delete1: "+pd_week+",delete1: "+pd_hAdd);
		return pdService.deletePet_Detail(pd_week,pd_hAdd);
	}
	
	//정기 리스트 달력 표시
	@RequestMapping(value="complete2",method = RequestMethod.POST)
	public String checkWeek(@RequestParam() ArrayList<Integer> p_num,Model model,
			String[] pd_week,String pd_hour,String pd_hAdd,
			Pet_Detail pd,String[] p_name,int c_num) {
		model.addAttribute("p_num", p_num);
		model.addAttribute("pd_week", pd_week);
		model.addAttribute("pd_hour", pd_hour);
		model.addAttribute("pd_hAdd", pd_hAdd);
		model.addAttribute("p_name", p_name);
		model.addAttribute("c_num", c_num);
		
		return "sitter/visit/calendal";
	}
	
	
	
	//전달 요청사항 신청폼(일반신청)
	@RequestMapping(value="complete22",method=RequestMethod.POST)
	public String reservationBtn(@RequestParam() ArrayList<Integer> p_num,Model model,
			String[] pd_week,String pd_hour,String pd_hAdd,
			Pet_Detail pd,String[] p_name,int c_num) {
	
				model.addAttribute("p_num", p_num);
				model.addAttribute("pd_week", pd_week);
				model.addAttribute("pd_hour", pd_hour);
				model.addAttribute("pd_hAdd", pd_hAdd);
				model.addAttribute("p_name", p_name);
				model.addAttribute("c_num", c_num);

		return "sitter/visit/reservation8";
	}
	
	//놀이시간표체크폼
	@RequestMapping(value="playPlan",method=RequestMethod.GET)
	public String playPlanForm() {
		return "sitter/visit/playPlan";
	}
	
	//예약 확인 및 결제정보 폼
	@RequestMapping(value="reservation10",method=RequestMethod.GET)
	public String reservation10Form(@RequestParam() ArrayList<Integer> p_num,Model model,
			String[] pd_week,String pd_hour,String pd_hAdd,
			Pet_Detail pd,String[] p_name,int c_num) {
		
		model.addAttribute("p_num", p_num);
		model.addAttribute("pd_week", pd_week);
		model.addAttribute("pd_hour", pd_hour);
		model.addAttribute("pd_hAdd", pd_hAdd);
		model.addAttribute("p_name", p_name);
		model.addAttribute("c_num", c_num);
		model.addAttribute("address", memberService.getMemberByC_num(c_num));
		return "sitter/visit/reservation10";
	}
	
	//예약 확인및 결제정보 (일반)
	@RequestMapping(value="sub",method=RequestMethod.POST)
	public String reservation10(@RequestParam() ArrayList<Integer> p_num,Model model,
			String[] pd_week,String pd_hour,String pd_hAdd,
			Pet_Detail pd,String[] p_name,int c_num) {
		
				model.addAttribute("p_num", p_num);
				model.addAttribute("pd_week", pd_week);
				model.addAttribute("pd_hour", pd_hour);
				model.addAttribute("pd_hAdd", pd_hAdd);
				model.addAttribute("p_name", p_name);
				model.addAttribute("c_num", c_num);
				model.addAttribute("address", memberService.getMemberByC_num(c_num));
				
		return "sitter/visit/reservation10";
	}
	
	//요금 세부 정보 보기 폼
	//json으로 만들어서 보내야한다..
	@RequestMapping(value="payment",method=RequestMethod.POST)
	public String paymentForm(@RequestParam() List<Integer> p_num,Model model,
			@RequestParam ArrayList<String> pd_week,String pd_hour,String[] pd_hAdd,
			Pet_Detail pd,String[] p_name,int c_num) throws JsonProcessingException {
				System.out.println("aaaaaa: "+pd_week);
				System.out.println("aaaaaa: "+p_num);
				model.addAttribute("p_num", p_num);
				model.addAttribute("pd_week", pd_week);
				model.addAttribute("pd_hour", pd_hour);
				model.addAttribute("pd_hAdd", pd_hAdd);
				model.addAttribute("p_name", p_name);
				model.addAttribute("c_num", c_num);
				
				//map에 담아보기..(p_num)
				Map<String, Object> d = new HashMap<String, Object>();
				ObjectMapper om = new ObjectMapper();
				for(int i=0;i<p_num.size();i++) {
					
					d.put("p_num"+i, p_num.get(i));	
					
				}
				String jsonStr = om.writeValueAsString(d);
				System.out.println("zzzzz: "+jsonStr);
				
				model.addAttribute("list", jsonStr);
				
				Map<String, Object> dd = new HashMap<String, Object>();
				for(int i =0;i<pd_week.size();i++) {
					dd.put("pd_week"+i, pd_week.get(i));
				}
				String jsonStr2 = om.writeValueAsString(dd);
				System.out.println("zzzzzz2: "+jsonStr2);
				
				model.addAttribute("list2", jsonStr2);
				
		return "sitter/visit/payment";
	}
	
	//payment중 p_num파싱!!
	@RequestMapping(value="test",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> test(
			@RequestParam Map<String, Object> p_num) {

		System.out.println("str-----"+p_num);

		return p_num;
	}
	//payment중 pd_week파싱!!
	@RequestMapping(value="test2",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> test2(@RequestParam Map<String, Object> pd_week){

		System.out.println("str2-----"+pd_week);

		return pd_week;
	}

}

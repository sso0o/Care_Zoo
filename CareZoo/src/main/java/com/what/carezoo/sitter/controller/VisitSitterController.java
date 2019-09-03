package com.what.carezoo.sitter.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.what.carezoo.dao.Pet_WeekListDao;
import com.what.carezoo.member.service.MemberService;
import com.what.carezoo.model.Customer;
import com.what.carezoo.model.Pet;
import com.what.carezoo.model.Pet_Detail;
import com.what.carezoo.model.Pet_Details;
import com.what.carezoo.model.Pet_WeekList;
import com.what.carezoo.pet.service.PetService;
import com.what.carezoo.pet.service.Pet_DetailService;
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
	//예약 메인(로그인, 회원가입)
	@RequestMapping("/main")
	public String showMain() {
		return "sitter/visit/Reservation1";
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
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(Customer customer,Model model) {
		if(customer.getC_address() != null & customer.getC_birth() !=null
				& customer.getC_contact() != null & customer.getC_d_address() != null 
				& customer.getC_e_address() !=null & customer.getC_email() !=null 
				& customer.getC_name()!=null & customer.getC_pass() !=null 
				& customer.getC_pass_chk() !=null	& customer.getC_sex() != null) {
			boolean result =memberService.joinMember(customer);
			//loginForm -> /member/loginForm 으로 가버리기 때문에 contextPath가 필요하다.
			if(result) {
				model.addAttribute("c_num", memberService.getMemberByEmail(customer.getC_email()).getC_num());
				return "sitter/visit/reservation2";
			}
			String msg ="비밀번호 일치 여부를 확인해 주세요";
			String url = "join";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "result";
		}
		String msg ="빈칸이 있는지 확인해 주세요";
		String url = "join";
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "result";
	}
	//로그인
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {
		return "sitter/visit/loginForm";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(HttpServletRequest request,Model model,String c_email, String c_pass) {
		System.out.println(c_email);
		System.out.println(c_pass);
		if(memberService.login(c_email,c_pass)) {
			model.addAttribute("c_num", memberService.getMemberByEmail(c_email).getC_num());
			model.addAttribute("c_name",memberService.getMemberByEmail(c_email).getC_name());
			return "sitter/visit/reservation2";
		}
		return "login";
	}
	//돌봄신청 폼(펫조인)
	@RequestMapping(value="apply",method=RequestMethod.GET)
	public String reservation3Form(Model model,int c_num) {
		model.addAttribute("c_num", c_num);
		return "sitter/visit/reservation3";
	}
	
	//펫등록
	@RequestMapping(value="petjoin", method=RequestMethod.POST)
	public String petjoin(Model model,Pet pet,HttpServletRequest request,int c_num) {
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
	//펫리스트폼
	@RequestMapping(value="petList",method=RequestMethod.GET)
	public String petList4Form(Model model,int c_num) {
		model.addAttribute("c_num", c_num);
		model.addAttribute("petList", petService.selectByC_Num(c_num));
		return "sitter/visit/petList4";
	}
	//펫리스트에서 강아지 고르기
	@RequestMapping(value="petList", method=RequestMethod.POST)
	public String petList(int p_num,Model model,HttpServletRequest request,String p_name) {
		String[] checks = request.getParameterValues("p_num");
		String[] checkss = request.getParameterValues("p_name");
		
		model.addAttribute("p_num",checks);
		model.addAttribute("p_name", checkss);
		model.addAttribute("pList", petService.selectPet(p_num));
		
		for(int i=0 ;i<checks.length;i++) {
			System.out.println(checks[i]);
		}		
		return "redirect:reservation5";
	}
	//예약 전 안내사항 폼
	@RequestMapping(value="reservation5",method=RequestMethod.GET)
	public String preReservation5Form(int[] p_num,Model model,HttpServletRequest request,String[] p_name) {	
		model.addAttribute("p_num", p_num);
		model.addAttribute("p_name", p_name);
		return "sitter/visit/reservation5";
	}
	//예약 요일,시간, 추가시간 고르기
	@RequestMapping(value="complete",method=RequestMethod.POST)
	public String reservation6Form(int[] p_num,Model model,HttpServletRequest request,String[] p_name) {	
		model.addAttribute("p_num", p_num);
		model.addAttribute("p_name", p_name);
		return "sitter/visit/reservation6";
	}
	//예약내용 확인하는 폼
	@RequestMapping(value="complete1",method=RequestMethod.POST)
	public String reservation7Form(HttpServletRequest request,Model model,Pet_Details list
			,@RequestParam() ArrayList<Integer> p_num) {
		//컨트롤러에서 리스트를 받아서 리스트 순서를 만들어야함...
		System.out.println(list);
		
//		pdService.insertPet_Detail2(list);
		System.out.println(pdService.insertPet_Detail2(list));

			//model.addAttribute("pd_List", pdService.selectByP_Num(p_num));
			return "sitter/visit/reservation7";
	}
	//사전만남 신청폼
	@RequestMapping(value="complete2",method=RequestMethod.POST)
	public String reservationBtn(@RequestParam() ArrayList<Integer> p_num,Model model,String[] pd_week,String[] pd_hour,String[] pd_hAdd,Pet_Detail pd,String[] p_name) {
	
		for(int i :p_num) {
			System.out.println(i);
			pd.setP_num(i);
			boolean result = pdService.insertPet_Detail(pd);
			System.out.println(pd);
			if (result) {
				model.addAttribute("p_num", p_num);
				model.addAttribute("week", pd_week);
				model.addAttribute("hour", pd_hour);
				model.addAttribute("hAdd", pd_hAdd);
				model.addAttribute("p_name", p_name);
			}
		}
			model.addAttribute("pd_List", pdService.selectByP_Num(p_num));
			System.out.println(pdService.selectByP_Num(p_num));
		return "sitter/visit/reservation8";
	}
	
	//펫리스트에서 선택 펫 삭제
	@RequestMapping(value="delete",method=RequestMethod.POST)
	@ResponseBody
	public boolean delete(@RequestParam("p_num") int p_num) {
		return petService.deletePet(p_num);
	}
}

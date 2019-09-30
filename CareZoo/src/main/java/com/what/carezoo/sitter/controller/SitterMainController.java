package com.what.carezoo.sitter.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.what.carezoo.customer.service.CustomerService;
import com.what.carezoo.member.service.MemberService;
import com.what.carezoo.model.Customer;
import com.what.carezoo.model.HomeSitterReservation;
import com.what.carezoo.model.Pet;
import com.what.carezoo.model.VisitSitterReservation;
import com.what.carezoo.pet.service.PetService;
import com.what.carezoo.sitter.service.HomeSitterReservationService;
import com.what.carezoo.sitter.service.SitterService;
import com.what.carezoo.sitter.service.VisitSitterReservationService;
@RequestMapping("/sitter")
@Controller
public class SitterMainController {
	
	@Autowired
	private SitterService sService;
	
	@Autowired
	private CustomerService cService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private PetService pService;
	
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
	
	@RequestMapping(value = "/myReservationVS", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getMyReservationVS(int vs_num) {
		Map<String, Object> rst = new HashMap<String, Object>();
		List<VisitSitterReservation> vsr = vsrService.getVisitSitterResByVSnum(vs_num);
		List<Customer> cList = new ArrayList<Customer>();
		System.out.println("vsr : "+vsr);
		if(vsr != null) {
			for (int i = 0; i < vsr.size(); i++) {
				Customer c = mService.getMemberByC_num(vsr.get(i).getC_num());
				cList.add(c);	
			}
			rst.put("vsrList", vsr);
			rst.put("cList", cList);
		}
		
		return rst;
	}


}

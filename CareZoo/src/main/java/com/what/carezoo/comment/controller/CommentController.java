package com.what.carezoo.comment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.what.carezoo.hotel.service.PetHotelReservationService;
import com.what.carezoo.model.HomeSitterReservation;
import com.what.carezoo.model.PetHotelComment;
import com.what.carezoo.model.PetHotelReservation;
import com.what.carezoo.model.VisitSitterReservation;
import com.what.carezoo.sitter.service.HomeSitterReservationService;
import com.what.carezoo.sitter.service.VisitSitterReservationService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired
	private HomeSitterReservationService hsrService;
	
	@Autowired
	private VisitSitterReservationService vsrService;
	
	@Autowired
	private PetHotelReservationService phrService;
	
	
	@RequestMapping("/hscList")
	public String homeSitterComment() {
		return "comment/homeSitterCommentList";
	}
	
	
	@RequestMapping("/vscList")
	public String visitSitterComment() {
		return "comment/homeSitterCommentList";
	}
	
	
	@RequestMapping("/phcList")
	public String petHotelComment() {
		return "comment/homeSitterCommentList";
	}
	
	
	//////////////////////////////////////////////////////////////////후기작성 폼
	@RequestMapping("/hsCommentForm")
	public String hsCommentForm(int hsr_num, Model m) {
		HomeSitterReservation hsr = hsrService.getHomeSitterResByHsrnum(hsr_num);
		m.addAttribute("hsr", hsr);
		return "comment/hscWriteForm";
	}
	
	@RequestMapping("/vsCommentForm")
	public String vsCommentForm(int vsr_num, Model m) {
		VisitSitterReservation vsr = vsrService.getVisitSitterResBuVsrnum(vsr_num);
		m.addAttribute("vsr", vsr);
		return "comment/vscWriteForm";
	}
	
	@RequestMapping("/phCommentForm")
	public String phCommentForm(int phr_num, Model m) {
		PetHotelReservation phr = phrService.getPetHotelResByNum(phr_num);
		m.addAttribute("phr", phr);
		return "comment/phcWriteForm";
	}
	
	
	///////////////////////////////////////////////////////////////후기작성
	@RequestMapping("/writeHSC")
	public String writeHSComment() {
		return null;
	}
	
	@RequestMapping("/writeVSC")
	public String writeVSComment() {
		return null;
	}
	
	@RequestMapping(value = "/writePHC", method = RequestMethod.POST)
	public String writePHComment(PetHotelComment phc) {
		
		return null;
	}

}

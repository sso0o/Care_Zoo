package com.what.carezoo.comment.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.what.carezoo.comment.service.CommentService;
import com.what.carezoo.hotel.service.PetHotelReservationService;
import com.what.carezoo.hotel.service.PetHotelService;
import com.what.carezoo.member.service.MemberService;
import com.what.carezoo.model.Customer;
import com.what.carezoo.model.HomeSitter;
import com.what.carezoo.model.HomeSitterComment;
import com.what.carezoo.model.HomeSitterReservation;
import com.what.carezoo.model.Pet;
import com.what.carezoo.model.PetHotel;
import com.what.carezoo.model.PetHotelComment;
import com.what.carezoo.model.PetHotelReservation;
import com.what.carezoo.model.ViSitSitterComment;
import com.what.carezoo.model.VisitSitter;
import com.what.carezoo.model.VisitSitterReservation;
import com.what.carezoo.pet.service.PetService;
import com.what.carezoo.sitter.service.HomeSitterReservationService;
import com.what.carezoo.sitter.service.HomeSitterService;
import com.what.carezoo.sitter.service.VisitSitterReservationService;
import com.what.carezoo.sitter.service.VisitSitterService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	private static final String FILE_PATH = "c:/temp/";
	
	@Autowired
	private PetService pService;
	
	@Autowired
	private HomeSitterService hsService;
	
	@Autowired
	private VisitSitterService vsService;
	
	@Autowired
	private PetHotelService phService;
	
	@Autowired
	private MemberService mService;

	@Autowired
	private HomeSitterReservationService hsrService;

	@Autowired
	private VisitSitterReservationService vsrService;

	@Autowired
	private PetHotelReservationService phrService;

//	@Autowired
//	private HomeSitterComment hscService;
//	
//	@Autowired
//	private ViSitSitterComment vscService;
//	
//	@Autowired
//	private PetHotelComment phcService;

	@Autowired
	private CommentService commentService;

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
	
	//////////////////////////////////////////////////////////////////후기작성 여부 확인
	@RequestMapping("/commentchk")
	@ResponseBody
	public boolean commentchk(String groupId, int id) {
		System.out.println("=========================================================================");
		System.out.println("groupId ==> "+groupId);
		System.out.println("id ==> "+id);
		
		if(groupId.equals("phr_num") && commentService.commentChkPHC(id)) {
			System.out.println("후기 들어있나 확인");
			return true;
		} else if(groupId.equals("hsr_num")&&commentService.commentChkHSC(id)) {
			return true;
		} else if(groupId.equals("vsr_num")&&commentService.commentChkVSC(id)) {
			return true;
		} else {
			return false;
		}

	}
	
	//////////////////////////////////////////////////////////////////모달정보 가져오기 
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
	
	@RequestMapping("/getModalPH")
	@ResponseBody
	public Map<String, Object> getModalInfoPH(int num) {
		Map<String, Object> rst = new HashMap<String, Object>();
		PetHotelReservation phr = phrService.getPetHotelResByNum(num);
		PetHotel ph = phService.getPetHotelbyNum(phr.getPh_num());
		System.out.println(ph);
		String name = ph.getPh_name();
		String contact = ph.getPh_contact();
		String fileName = phService.getFileList(ph.getPh_num()).get(0);
		String address = ph.getPh_address()+ph.getPh_d_address();
		Double star = commentService.getStarPH(ph.getPh_num());
		rst.put("star",star);
		rst.put("name",name);
		rst.put("contact",contact);
		if(fileName == null) {			

			rst.put("fileName",null);
		} else {
			rst.put("fileName",fileName);
		}
		rst.put("number",ph.getPh_num());
		rst.put("address",address);
		return rst;
	}
	
	@RequestMapping("/getModalHS")
	@ResponseBody
	public Map<String, Object> getModalInfoHS(int num) {
		Map<String, Object> rst = new HashMap<String, Object>();
		HomeSitterReservation hsr = hsrService.getHomeSitterResByHsrnum(num);
		HomeSitter hs = hsService.getHomeSitterByNum(hsr.getHs_num());
		String name = hs.getHs_name();
		String contact = hs.getHs_contact();
		String address = hs.getHs_address()+hs.getHs_d_address();
		Double star = commentService.getStarHS(hs.getHs_num());
		rst.put("star",star);			
		rst.put("name",name);
		rst.put("contact",contact);
		rst.put("address",address);
		return rst;
	}
	

	@RequestMapping("/getModalVS")
	@ResponseBody
	public Map<String, Object> getModalInfoVS(int num) {
		Map<String, Object> rst = new HashMap<String, Object>();
		VisitSitterReservation vsr = vsrService.getVisitSitterResByVsrnum(num);
		VisitSitter vs = vsService.getVisitSitterByNum(vsr.getVs_num());
		String name = vs.getVs_name();
		String contact = vs.getVs_contact();
		Double star = commentService.getStarVS(vs.getVs_num());
		rst.put("star",star);			
		rst.put("name",name);
		rst.put("contact",contact);
		return rst;
	}

	
	@RequestMapping("/getModalC")
	@ResponseBody
	public Map<String, Object> getModalC(int num) {
		Customer c = mService.getMemberByC_num(num);
		String name = c.getC_name();
		String contact = c.getC_contact();
		String address = c.getC_address()+c.getC_d_address();
		List<Pet> pList	= pService.selectByC_Num(c.getC_num());
		Map<String, Object> rst = new HashMap<String, Object>();
		rst.put("name",name);
		rst.put("contact",contact);
		rst.put("address",address);
		rst.put("pList",pList);
		return rst;
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
		VisitSitterReservation vsr = vsrService.getVisitSitterResByVsrnum(vsr_num);
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
	@RequestMapping(value = "/writeHSC", method = RequestMethod.POST)
	public String writeHSComment(HomeSitterComment hsc, MultipartHttpServletRequest mtfRequest) {
		System.out.println("HomeSitterComment : " + hsc);

		List<MultipartFile> files = mtfRequest.getFiles("file");

		boolean rst = commentService.writeHSC(hsc, files);
		if (rst) {
			return "redirect:/member/myPage";
		} else {
			return "redirect:/";
		}

	}

	@RequestMapping(value = "/writeVSC", method = RequestMethod.POST)
	public String writeVSComment(ViSitSitterComment vsc, MultipartHttpServletRequest mtfRequest) {
		System.out.println("VisitSitterComment : " + vsc);

		List<MultipartFile> files = mtfRequest.getFiles("file");

		boolean rst = commentService.writeVSC(vsc, files);
		if (rst) {
			return "redirect:/member/myPage";
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/writePHC", method = RequestMethod.POST)
	public String writePHComment(PetHotelComment phc, MultipartHttpServletRequest mtfRequest) {
		System.out.println("PetHotelComment : " + phc);

		List<MultipartFile> files = mtfRequest.getFiles("file");

		boolean rst = commentService.writePHC(phc, files);
		if (rst) {
			return "redirect:/member/myPage";
		} else {
			return "redirect:/";
		}

	}

}

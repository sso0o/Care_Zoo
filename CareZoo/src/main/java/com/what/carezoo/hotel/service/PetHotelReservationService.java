package com.what.carezoo.hotel.service;


import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.PetHotelDao;
import com.what.carezoo.dao.PetHotelReservationDao;
import com.what.carezoo.model.PetHotel;
import com.what.carezoo.model.PetHotelReservation;

@Service
public class PetHotelReservationService {
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private PetHotelReservationDao petHotelResDao;
	@Autowired
	private PetHotelDao petHotelDao;
	
	public boolean addPetHotelRes(PetHotelReservation phr) {
		if(petHotelResDao.insert(phr) > 0) {
			return true;
		}
		return false;
	}
	
	public boolean modifyPetHotelRes(PetHotelReservation phr) {
		if(petHotelResDao.update(phr) > 0) {
			return true;
		}
		return false;
	}
	
	public boolean removePetHotelRes(PetHotelReservation phr) {
		if(petHotelResDao.delete(phr) > 0) {
			return true;
		}
		return false;
	}

	public boolean deleteByC_num(int c_num) {
		if(petHotelResDao.deleteByC_num(c_num)>0) {
			return true;
		}
		return false;
	}
	
	public PetHotelReservation getPetHotelResByNum(int phr_num) {
		return petHotelResDao.selectByPhrnum(phr_num);
	}
	
	public PetHotelReservation getPetHotelResByResInfo(PetHotelReservation phr) {
		return petHotelResDao.selectByResInfo(phr);
	}
	
	public List<PetHotelReservation> getPetHotelResByCnum(int c_num) {
		return petHotelResDao.selectByCnum(c_num);
	}
	public List<PetHotelReservation> getPetHotelResByPhrm_num(int phrm_num) {
		return petHotelResDao.selectByPhrm_num(phrm_num);
	}
	
	public List<PetHotelReservation> getAllPetHotelRes() {
		return petHotelResDao.selectAll();
	}
	
	public List<Map<String, Object>> getPHRInfo(int c_num){
		return petHotelResDao.getPHRInfo(c_num);
	}

	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}	

	// 회원가입 발송 이메일(인증키 발송)
	public boolean mailSendWithMemberKey(PetHotel pethotel,PetHotelReservation phr, HttpServletRequest request) {
		

		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 MS :p 맡겨쥬 입니다!</h2><br>" 
				+ "<h3>" + pethotel.getPh_name()+ "의 관리자님</h3>" +(petHotelDao.selectPhRoomByPhrm_num(phr.getPhrm_num())).getPhrm_name()+ "에 예약이 확정되었습니다."
				+"<p><label>체크인날짜:&nbsp;"+phr.getPhr_chkin()+"</label>&nbsp;&nbsp;"+"<p><label>체크아웃날짜:&nbsp;"+phr.getPhr_chkout()+"</label>"
				+"<p><label>반려견: "+phr.getPhr_numof_pet()+"마리</label>"+"<p><label>결제금액: "+phr.getPhr_price()+"원"
				+ "<p><a href='http://localhost:8081" + request.getContextPath() + "/petHotel/petHotelView?ph_num="+pethotel.getPh_num()+">예약현황 보러가기</a></p>"
				+"<p>감사합니다 (_ _)";
		try {
			mail.setSubject("예약확정메일입니다.", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(pethotel.getPh_email()));
			mailSender.send(mail);
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public int countC_num(int c_num) {
		return petHotelResDao.countC_num(c_num);
	}
	
}

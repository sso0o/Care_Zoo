package com.what.carezoo.member.service;

import java.io.PrintWriter;
import java.util.Map;
import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.what.carezoo.dao.MemberDao;
import com.what.carezoo.dao.PetHotelDao;
import com.what.carezoo.model.Customer;
import com.what.carezoo.model.HomeSitter;
import com.what.carezoo.model.HomeSitterReservation;
import com.what.carezoo.model.PetHotel;
import com.what.carezoo.model.PetHotelReservation;
import com.what.carezoo.model.VisitSitter;
import com.what.carezoo.model.VisitSitterReservation;
import com.what.carezoo.sitter.service.HomeSitterService;
import com.what.carezoo.sitter.service.VisitSitterService;

@Service
public class MemberMailSendService {
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MemberService memberService;
	@Autowired
	private VisitSitterService vsService;
	@Autowired
	private HomeSitterService hsService;
	@Autowired
	private PetHotelDao petHotelDao;
	
	// 이메일 난수 만드는 메서드
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
		public boolean mailSendWithMemberKey(String c_email,String c_name, HttpServletRequest request) {
			
			String key = getKey(false, 20);
			System.out.println("key:"+key+"c_email : "+c_email);
			System.out.println(memberDao.GetKey(c_email, key)); 
			MimeMessage mail = mailSender.createMimeMessage();
			String htmlStr = "<h2>안녕하세요 MS :p 맡겨쥬 입니다!</h2><br><br>" 
					+ "<h3>" + c_name + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
					+ "<a href='http://localhost:8081" + request.getContextPath() + "/member/key_alter?c_email="+ c_email +"&c_email_key="+key+"'>인증하기</a></p>"
					+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			try {
				mail.setSubject("[본인인증] MS :p 맡겨쥬의 인증메일입니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(c_email));
				mailSender.send(mail);
				return true;
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			return false;
		}
		// 인증 확인 메서드 (Y 값으로 바꿔주는 메서드)
		public int alter_userKey_service(String c_email, String c_email_key) {
			System.out.println("c_email_key:"+c_email_key+"c_email : "+c_email);
			int resultCnt = 0;			
			resultCnt = memberDao.alter_cKey(c_email, c_email_key);
			System.out.println("resultCnt실행?"+resultCnt);
			return resultCnt;
		}
		
		// 비밀번호 찾기
		public boolean pass(String email,String name,String user) {
			System.out.println(email);
			System.out.println(name);
			System.out.println(user);
			MimeMessage mail = mailSender.createMimeMessage();
			String htmlStr = "";
			if(user.equals("customer")) {
				htmlStr = "<h2>안녕하세요 MS :p 맡겨쥬 입니다!</h2><br><br>" 
						+"<p>"+name+"님의 비밀번호 입니다 : </p>" 
						+ "<h3>"+memberService.getMemberByEmail(email).getC_pass()+"</h3>"
						+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			}else if(user.equals("visit")) {
				htmlStr = "<h2>안녕하세요 MS :p 맡겨쥬 입니다!</h2><br><br>" 
						+"<p>"+name+"님의 비밀번호 입니다 : </p>" 
						+ "<h3>"+vsService.getVisitSitterByEmail(email).getVs_pass()+"</h3>"
						+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			}else if(user.equals("home")) {
				htmlStr = "<h2>안녕하세요 MS :p 맡겨쥬 입니다!</h2><br><br>" 
						+"<p>"+name+"님의 비밀번호 입니다 : </p>" 
						+ "<h3>"+hsService.getHomeSitterByEmail(email).getHs_pass()+"</h3>"
						+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			}

			try {
				mail.setSubject("맡겨쥬의 비밀번호 입니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(email));
				mailSender.send(mail);
				return true;
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			return false;
		}

		public boolean mailSendCancelPHR(PetHotel pethotel, PetHotelReservation phr, Customer cus, HttpServletRequest request) {
			// TODO Auto-generated method stub
			MimeMessage mail = mailSender.createMimeMessage();
			String htmlStr = "<h2>안녕하세요 MS :p 맡겨쥬 입니다!</h2><br>" 
					+ "<h3>" + pethotel.getPh_name()+ "의 관리자님</h3>" +(petHotelDao.selectPhRoomByPhrm_num(phr.getPhrm_num())).getPhrm_name()+ " 예약이 <label style='color:red'>취소</label>되었습니다."
					+"<p><label>고객이름:&nbsp;"+cus.getC_name()
					+"<p><label>고객번호::&nbsp;"+cus.getC_contact()
					+"<p><label>체크인날짜:&nbsp;"+phr.getPhr_chkin()+"</label>&nbsp;&nbsp;"+"<p><label>체크아웃날짜:&nbsp;"+phr.getPhr_chkout()+"</label>"
					+"<p><label>반려견: "+phr.getPhr_numof_pet()+"마리</label>"+"<p><label>결제금액: "+phr.getPhr_price()+"원"
					+ "<p><a href='http://localhost:8081" + request.getContextPath() + "/petHotel/petHotelView?ph_num="+pethotel.getPh_num()+">예약현황 보러가기</a></p>"
					+"<p>감사합니다 (_ _)";
			try {
				mail.setSubject("예약취소메일입니다.", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(pethotel.getPh_email()));
				mailSender.send(mail);
				return true;
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			return false;
			
		}
		
		public boolean mailSendCancelVSR(VisitSitterReservation vsr, @RequestParam(required = false)VisitSitter vs, Customer c, HttpServletRequest request) {
			if(vs == null) {
				return true;
			} else {
				MimeMessage mail = mailSender.createMimeMessage();
				String htmlStr = "<h2>안녕하세요 MS :p 맡겨쥬 입니다!</h2><br>" 
						+ "<h3>" + vs.getVs_name()+ "님!</h3>" 
						+"<p><label>고객이름:&nbsp;"+c.getC_name()
						+"<p><label>체크인날짜:&nbsp;"+vsr.getVsr_chkin()
						+"</label>&nbsp;&nbsp;"
						+"<p><label>결제금액: "+vsr.getVsr_totalPrice()+"원"
						+ " 예약이 <label style='color:red'>취소</label>되었습니다."
						+"<p>감사합니다 (_ _)";
				try {
					mail.setSubject("예약취소메일입니다.", "utf-8");
					mail.setText(htmlStr, "utf-8", "html");
					mail.addRecipient(RecipientType.TO, new InternetAddress(vs.getVs_email()));
					mailSender.send(mail);
					return true;
				} catch (MessagingException e) {
					e.printStackTrace();
				}
				return false;
			}
			
			
		}
		
		public boolean mailSendCancelHSR(HomeSitterReservation hsr, HomeSitter hs, Customer c, HttpServletRequest request) {
			MimeMessage mail = mailSender.createMimeMessage();
			String htmlStr = "<h2>안녕하세요 MS :p 맡겨쥬 입니다!</h2><br>" 
			+ "<h3>" +hs.getHs_name()+ "님!</h3>" 
			+"<p><label>고객이름:&nbsp;"+c.getC_name()
			+"<p><label>체크인날짜:&nbsp;"+hsr.getHsr_chkin()
			+"<p><label>체크아웃날짜:&nbsp;"+hsr.getHsr_chkout()
			+"</label>&nbsp;&nbsp;"
			+"<p><label>결제금액: "+hsr.getHsr_totalprice()+"원"
			+ " 예약이 <label style='color:red'>취소</label>되었습니다."
			+"<p>감사합니다 (_ _)";
			try {
				mail.setSubject("예약취소메일입니다.", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(hs.getHs_email()));
				mailSender.send(mail);
				return true;
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
			return false;
		}
			
			
}


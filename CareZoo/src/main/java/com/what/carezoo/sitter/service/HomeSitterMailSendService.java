package com.what.carezoo.sitter.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.HomeSitterDao;

@Service
public class HomeSitterMailSendService {
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private HomeSitterDao hsDao;
	
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
		public boolean mailSendWithMemberKey(String hs_email,String hs_name, HttpServletRequest request) {
			
			String key = getKey(false, 20);
			System.out.println("key:"+key+"c_email : "+hs_email);
			System.out.println(hsDao.GetKey(hs_email, key)); 
			MimeMessage mail = mailSender.createMimeMessage();
			String htmlStr = "<h2>안녕하세요 MS :p 맡겨쥬 입니다!</h2><br><br>" 
					+ "<h3>" + hs_name + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
					+ "<a href='http://localhost:8081" + request.getContextPath() + "/home/key_alter?hs_email="+ hs_email +"&hs_email_key="+key+"'>인증하기</a></p>"
					+ "\n"
					+ "************************************************************************************"
					+ "\n"
					+ "홈시터 가입 후 추가 내용을 입력하셔야 게시글이 등록됩니다. 이메일 인증 후 마이페이지를 확인해주세요~!"
					+ "\n"
					+ "<a href='http://localhost:8081" + request.getContextPath() + "/member/myPage"+ "'>마이페이지 바로가기</a></p>"
					+ "************************************************************************************";
			try {
				mail.setSubject("[본인인증] MS :p 맡겨쥬의 인증메일입니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(hs_email));
				mailSender.send(mail); //메일 보내기
				return true;
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			return false;
		}
		// 인증 확인 메서드 (Y 값으로 바꿔주는 메서드)
		public int alter_userKey_service(String hs_email, String hs_email_key) {
			System.out.println("hs_email_key:"+hs_email_key+"hs_email : "+hs_email);
			int resultCnt = 0;			
			resultCnt = hsDao.alterHsKey(hs_email, hs_email_key);
			System.out.println("resultCnt실행?"+resultCnt);
			return resultCnt;
		}
		
		// 회원탈퇴 발송 이메일
		public boolean mailSendWithMember(String hs_email,String hs_name, HttpServletRequest request) {
			
			MimeMessage mail = mailSender.createMimeMessage();
			String htmlStr = "<h2>안녕하세요 MS :p 맡겨쥬 입니다!</h2><br><br>" 
					+ "<h3>" + hs_name + "님</h3>" + "<br>부적절한 홈페이지 활동으로 인하여 본 홈페이지에서 <span style='color:red; font-size:15;'>강제탈퇴</span> 되었음을 알려드립니다." 
					+ "<br>(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			try {
				mail.setSubject("[본인인증] MS :p 맡겨쥬의 탈퇴 메일입니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(hs_email));
				mailSender.send(mail);
				return true;
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			return false;
		}
}

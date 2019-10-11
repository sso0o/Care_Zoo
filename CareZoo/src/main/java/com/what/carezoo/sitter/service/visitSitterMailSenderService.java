package com.what.carezoo.sitter.service;

import java.io.PrintWriter;
import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.MemberDao;
import com.what.carezoo.dao.VisitSitterDao;
import com.what.carezoo.model.Customer;
import com.what.carezoo.sitter.service.HomeSitterService;
import com.what.carezoo.sitter.service.VisitSitterService;

@Service
public class visitSitterMailSenderService {
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private VisitSitterService vsService;
	@Autowired
	private VisitSitterDao vsDao;
	
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
		public boolean mailSendWithMemberKey(String vs_email,String vs_name, HttpServletRequest request) {
			
			String key = getKey(false, 20);
			System.out.println("key:"+key+"vs_email : "+vs_email);
			System.out.println(vsDao.GetKey(vs_email, key)); 
			MimeMessage mail = mailSender.createMimeMessage();
			String htmlStr = "<h2>안녕하세요 MS :p 맡겨쥬 입니다!</h2><br><br>" 
					+ "<h3>" + vs_name + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
					+ "<a href='http://localhost:8081" + request.getContextPath() + "/visit/key_alter?vs_email="+ vs_email +"&vs_email_key="+key+"'>인증하기</a></p>"
					+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			try {
				mail.setSubject("[본인인증] MS :p 맡겨쥬의 인증메일입니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(vs_email));
				mailSender.send(mail);
				return true;
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			return false;
		}
		// 인증 확인 메서드 (Y 값으로 바꿔주는 메서드)
		public int alter_userKey_service(String vs_email, String vs_email_key) {
			System.out.println("vs_email_key:"+vs_email_key+"vs_email : "+vs_email);
			int resultCnt = 0;			
			resultCnt = vsDao.alter_cKey(vs_email, vs_email_key);
			System.out.println("resultCnt실행?"+resultCnt);
			return resultCnt;
		}

}

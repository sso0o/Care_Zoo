package com.what.carezoo.admin.service;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


public class MailAuth extends Authenticator{
	
	PasswordAuthentication pa;
	    
	public MailAuth() {
	    String MAIL_ID = "carezooteam.noreply@gmail.com";
	    String MAIL_PW = "ajdajd2*";
	    
	    pa = new PasswordAuthentication(MAIL_ID, MAIL_PW);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
	    return pa;
	}

}

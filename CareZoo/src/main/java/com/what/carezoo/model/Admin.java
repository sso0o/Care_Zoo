package com.what.carezoo.model;

public class Admin {
	
	private String adm_email;
	private String adm_pass;
	public String getAdm_email() {
		return adm_email;
	}
	public void setAdm_email(String adm_email) {
		this.adm_email = adm_email;
	}
	public String getAdm_pass() {
		return adm_pass;
	}
	public void setAdm_pass(String adm_pass) {
		this.adm_pass = adm_pass;
	}
	@Override
	public String toString() {
		return "Admin [adm_email=" + adm_email + ", adm_pass=" + adm_pass + "]";
	}
	
}

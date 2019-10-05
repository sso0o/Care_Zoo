package com.what.carezoo.model;


public class HomeSitter {

	private int hs_num;
	private String hs_name;
	private String hs_sex;
	private String hs_birth;
	private int hs_contact;
	private String hs_address;
	private String hs_d_address;
	private String hs_email;
	private String hs_pass;
	private String hs_pass_chk;
	private String hs_regi_date;
	private String hs_email_key;
	public int getHs_num() {
		return hs_num;
	}
	public void setHs_num(int hs_num) {
		this.hs_num = hs_num;
	}
	public String getHs_name() {
		return hs_name;
	}
	public void setHs_name(String hs_name) {
		this.hs_name = hs_name;
	}
	public String getHs_sex() {
		return hs_sex;
	}
	public void setHs_sex(String hs_sex) {
		this.hs_sex = hs_sex;
	}
	public String getHs_birth() {
		return hs_birth;
	}
	public void setHs_birth(String hs_birth) {
		this.hs_birth = hs_birth;
	}
	public int getHs_contact() {
		return hs_contact;
	}
	public void setHs_contact(int hs_contact) {
		this.hs_contact = hs_contact;
	}
	public String getHs_address() {
		return hs_address;
	}
	public void setHs_address(String hs_address) {
		this.hs_address = hs_address;
	}
	public String getHs_d_address() {
		return hs_d_address;
	}
	public void setHs_d_address(String hs_d_address) {
		this.hs_d_address = hs_d_address;
	}
	public String getHs_email() {
		return hs_email;
	}
	public void setHs_email(String hs_email) {
		this.hs_email = hs_email;
	}
	public String getHs_pass() {
		return hs_pass;
	}
	public void setHs_pass(String hs_pass) {
		this.hs_pass = hs_pass;
	}
	public String getHs_pass_chk() {
		return hs_pass_chk;
	}
	public void setHs_pass_chk(String hs_pass_chk) {
		this.hs_pass_chk = hs_pass_chk;
	}
	public String getHs_regi_date() {
		return hs_regi_date;
	}
	public void setHs_regi_date(String hs_regi_date) {
		this.hs_regi_date = hs_regi_date;
	}
	public String getHs_email_key() {
		return hs_email_key;
	}
	public void setHs_email_key(String hs_email_key) {
		this.hs_email_key = hs_email_key;
	}
	@Override
	public String toString() {
		return "HomeSitter [hs_num=" + hs_num + ", hs_name=" + hs_name + ", hs_sex=" + hs_sex + ", hs_birth=" + hs_birth
				+ ", hs_contact=" + hs_contact + ", hs_address=" + hs_address + ", hs_d_address=" + hs_d_address
				+ ", hs_email=" + hs_email + ", hs_pass=" + hs_pass + ", hs_pass_chk=" + hs_pass_chk + ", hs_regi_date="
				+ hs_regi_date + ", hs_email_key=" + hs_email_key + "]";
	}
	
}

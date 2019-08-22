package com.what.carezoo.model;

import java.sql.Date;

public class HomeSitter {

	private int hs_num;
	private int hsr_num;
	private String hs_name;
	private String hs_sex;
	private Date hs_birth;
	private int hs_contact;
	private String hs_address;
	private String hs_d_address;
	private double hs_star;
	private String hs_job;
	private String hs_img;
	private String hs_latitude;
	private String hs_longitude;
	private int hs_p_count;
	private String hs_email;
	private String hs_e_address;
	private String hs_pass;
	
	public int getHs_num() {
		return hs_num;
	}
	public void setHs_num(int hs_num) {
		this.hs_num = hs_num;
	}
	public int getHsr_num() {
		return hsr_num;
	}
	public void setHsr_num(int hsr_num) {
		this.hsr_num = hsr_num;
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
	public Date getHs_birth() {
		return hs_birth;
	}
	public void setHs_birth(Date hs_birth) {
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
	public double getHs_star() {
		return hs_star;
	}
	public void setHs_star(double hs_star) {
		this.hs_star = hs_star;
	}
	public String getHs_job() {
		return hs_job;
	}
	public void setHs_job(String hs_job) {
		this.hs_job = hs_job;
	}
	public String getHs_img() {
		return hs_img;
	}
	public void setHs_img(String hs_img) {
		this.hs_img = hs_img;
	}
	public String getHs_latitude() {
		return hs_latitude;
	}
	public void setHs_latitude(String hs_latitude) {
		this.hs_latitude = hs_latitude;
	}
	public String getHs_longitude() {
		return hs_longitude;
	}
	public void setHs_longitude(String hs_longitude) {
		this.hs_longitude = hs_longitude;
	}
	public int getHs_p_count() {
		return hs_p_count;
	}
	public void setHs_p_count(int hs_p_count) {
		this.hs_p_count = hs_p_count;
	}
	public String getHs_email() {
		return hs_email;
	}
	public void setHs_email(String hs_email) {
		this.hs_email = hs_email;
	}
	public String getHs_e_address() {
		return hs_e_address;
	}
	public void setHs_e_address(String hs_e_address) {
		this.hs_e_address = hs_e_address;
	}
	public String getHs_pass() {
		return hs_pass;
	}
	public void setHs_pass(String hs_pass) {
		this.hs_pass = hs_pass;
	}
	@Override
	public String toString() {
		return "HomeSitter [hs_num=" + hs_num + ", hsr_num=" + hsr_num + ", hs_name=" + hs_name + ", hs_sex=" + hs_sex
				+ ", hs_birth=" + hs_birth + ", hs_contact=" + hs_contact + ", hs_address=" + hs_address
				+ ", hs_d_address=" + hs_d_address + ", hs_star=" + hs_star + ", hs_job=" + hs_job + ", hs_img="
				+ hs_img + ", hs_latitude=" + hs_latitude + ", hs_longitude=" + hs_longitude + ", hs_p_count="
				+ hs_p_count + ", hs_email=" + hs_email + ", hs_e_address=" + hs_e_address + ", hs_pass=" + hs_pass
				+ "]";
	}
	
}

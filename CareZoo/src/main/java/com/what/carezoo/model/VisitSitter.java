package com.what.carezoo.model;

import java.sql.Date;

public class VisitSitter {

	private int vs_num;
	private int vsr_num;
	private String vs_name;
	private String vs_sex;
	private String vs_birth;
	private String vs_contact;
	private String vs_address;
	private String vs_job;
	private double vs_star;
	private String vs_comment;
	private String vs_img;
	private String vs_email;
	private String vs_e_address;
	private String vs_pass;
	public int getVs_num() {
		return vs_num;
	}
	public void setVs_num(int vs_num) {
		this.vs_num = vs_num;
	}
	public int getVsr_num() {
		return vsr_num;
	}
	public void setVsr_num(int vsr_num) {
		this.vsr_num = vsr_num;
	}
	public String getVs_name() {
		return vs_name;
	}
	public void setVs_name(String vs_name) {
		this.vs_name = vs_name;
	}
	public String getVs_sex() {
		return vs_sex;
	}
	public void setVs_sex(String vs_sex) {
		this.vs_sex = vs_sex;
	}
	public String getVs_birth() {
		return vs_birth;
	}
	public void setVs_birth(String vs_birth) {
		this.vs_birth = vs_birth;
	}
	public String getVs_contact() {
		return vs_contact;
	}
	public void setVs_contact(String vs_contact) {
		this.vs_contact = vs_contact;
	}
	public String getVs_address() {
		return vs_address;
	}
	public void setVs_address(String vs_address) {
		this.vs_address = vs_address;
	}
	public String getVs_job() {
		return vs_job;
	}
	public void setVs_job(String vs_job) {
		this.vs_job = vs_job;
	}
	public double getVs_star() {
		return vs_star;
	}
	public void setVs_star(double vs_star) {
		this.vs_star = vs_star;
	}
	public String getVs_comment() {
		return vs_comment;
	}
	public void setVs_comment(String vs_comment) {
		this.vs_comment = vs_comment;
	}
	public String getVs_img() {
		return vs_img;
	}
	public void setVs_img(String vs_img) {
		this.vs_img = vs_img;
	}
	public String getVs_email() {
		return vs_email;
	}
	public void setVs_email(String vs_email) {
		this.vs_email = vs_email;
	}
	public String getVs_e_address() {
		return vs_e_address;
	}
	public void setVs_e_address(String vs_e_address) {
		this.vs_e_address = vs_e_address;
	}
	public String getVs_pass() {
		return vs_pass;
	}
	public void setVs_pass(String vs_pass) {
		this.vs_pass = vs_pass;
	}
	@Override
	public String toString() {
		return "VisitSitter [vs_num=" + vs_num + ", vsr_num=" + vsr_num + ", vs_name=" + vs_name + ", vs_sex=" + vs_sex
				+ ", vs_birth=" + vs_birth + ", vs_contact=" + vs_contact + ", vs_address=" + vs_address + ", vs_job="
				+ vs_job + ", vs_star=" + vs_star + ", vs_comment=" + vs_comment + ", vs_img=" + vs_img + ", vs_email="
				+ vs_email + ", vs_e_address=" + vs_e_address + ", vs_pass=" + vs_pass + "]";
	}
	
}

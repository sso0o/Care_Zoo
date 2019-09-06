package com.what.carezoo.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Customer {
	private int c_num;
	private String c_name;
	private String c_email;
	private String c_pass;
	private String c_address;
	private String c_d_address;
	private String c_sex;
//	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String c_birth;
	private String c_contact;

	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_email() {
		return c_email;
	}
	public void setC_email(String c_email) {
		this.c_email = c_email;
	}
	public String getC_pass() {
		return c_pass;
	}
	public void setC_pass(String c_pass) {
		this.c_pass = c_pass;
	}
	public String getC_address() {
		return c_address;
	}
	public void setC_address(String c_address) {
		this.c_address = c_address;
	}
	public String getC_d_address() {
		return c_d_address;
	}
	public void setC_d_address(String c_d_address) {
		this.c_d_address = c_d_address;
	}
	public String getC_sex() {
		return c_sex;
	}
	public void setC_sex(String c_sex) {
		this.c_sex = c_sex;
	}
	public String getC_birth() {
		return c_birth;
	}
	public void setC_birth(String c_birth) {
		this.c_birth = c_birth;
	}
	public String getC_contact() {
		return c_contact;
	}
	public void setC_contact(String c_contact) {
		this.c_contact = c_contact;
	}
	@Override
	public String toString() {
		return "Customer [c_num=" + c_num + ", c_name=" + c_name + ", c_email=" + c_email + ", c_pass=" + c_pass
				+ ", c_address=" + c_address + ", c_d_address=" + c_d_address + ", c_sex=" + c_sex + ", c_birth="
				+ c_birth + ", c_contact=" + c_contact + "]";
	}

	

}

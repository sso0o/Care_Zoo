package com.what.carezoo.model;

import java.util.Date;

public class PetHotelComment {
	@Override
	public String toString() {
		return "PetHotelComment [phc_num=" + phc_num + ", phr_num=" + phr_num + ", ph_num=" + ph_num + ", c_num=" + c_num + ", phc_star=" + phc_star + ", phc_comment=" + phc_comment + ", phc_write_date=" + phc_write_date + ", c_name="
				+ c_name + "]";
	}
	private int phc_num;
	private int phr_num;
	private int ph_num;
	private int c_num;
	private double phc_star;
	private String phc_comment;
	private Date phc_write_date;
	private String c_name;

	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public int getPhc_num() {
		return phc_num;
	}
	public void setPhc_num(int phc_num) {
		this.phc_num = phc_num;
	}
	public int getPhr_num() {
		return phr_num;
	}
	public void setPhr_num(int phr_num) {
		this.phr_num = phr_num;
	}
	public int getPh_num() {
		return ph_num;
	}
	public void setPh_num(int ph_num) {
		this.ph_num = ph_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public double getPhc_star() {
		return phc_star;
	}
	public void setPhc_star(double phc_star) {
		this.phc_star = phc_star;
	}
	public String getPhc_comment() {
		return phc_comment;
	}
	public void setPhc_comment(String phc_comment) {
		this.phc_comment = phc_comment;
	}
	public Date getPhc_write_date() {
		return phc_write_date;
	}
	public void setPhc_write_date(Date phc_write_date) {
		this.phc_write_date = phc_write_date;
	}

	
}                  

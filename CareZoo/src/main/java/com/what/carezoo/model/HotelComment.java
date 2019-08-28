package com.what.carezoo.model;

import java.util.Date;

public class HotelComment {
	private int hc_num;
	private int hr_num;
	private int h_num;
	private int c_num;
	private String hc_comment;
	private double hc_star;
	private Date hc_write_date;
	private String hc_fileName;
	public String getHc_fileName() {
		return hc_fileName;
	}
	public void setHc_fileName(String hc_fileName) {
		this.hc_fileName = hc_fileName;
	}
	public int getHc_num() {
		return hc_num;
	}
	public void setHc_num(int hc_num) {
		this.hc_num = hc_num;
	}
	public int getHr_num() {
		return hr_num;
	}
	public void setHr_num(int hr_num) {
		this.hr_num = hr_num;
	}
	public int getH_num() {
		return h_num;
	}
	public void setH_num(int h_num) {
		this.h_num = h_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getHc_comment() {
		return hc_comment;
	}
	public void setHc_comment(String hc_comment) {
		this.hc_comment = hc_comment;
	}
	public double getHc_star() {
		return hc_star;
	}
	public void setHc_star(double hc_star) {
		this.hc_star = hc_star;
	}
	public Date getHc_write_date() {
		return hc_write_date;
	}
	public void setHc_write_date(Date hc_write_date) {
		this.hc_write_date = hc_write_date;
	}


	
}

package com.what.carezoo.model;

import java.sql.Date;

public class HomeSitterComment {

	private int hsc_num;
	private int hsr_num;
	private int hs_num;
	private int c_num;
	private String hsc_comment;
	private double hsc_star;
	private Date hsc_write_date;
	private String hsc_img;
	public int getHsc_num() {
		return hsc_num;
	}
	public void setHsc_num(int hsc_num) {
		this.hsc_num = hsc_num;
	}
	public int getHsr_num() {
		return hsr_num;
	}
	public void setHsr_num(int hsr_num) {
		this.hsr_num = hsr_num;
	}
	public int getHs_num() {
		return hs_num;
	}
	public void setHs_num(int hs_num) {
		this.hs_num = hs_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getHsc_comment() {
		return hsc_comment;
	}
	public void setHsc_comment(String hsc_comment) {
		this.hsc_comment = hsc_comment;
	}
	public double getHsc_star() {
		return hsc_star;
	}
	public void setHsc_star(double hsc_star) {
		this.hsc_star = hsc_star;
	}
	public Date getHsc_write_date() {
		return hsc_write_date;
	}
	public void setHsc_write_date(Date hsc_write_date) {
		this.hsc_write_date = hsc_write_date;
	}
	public String getHsc_img() {
		return hsc_img;
	}
	public void setHsc_img(String hsc_img) {
		this.hsc_img = hsc_img;
	}
	@Override
	public String toString() {
		return "HomeSitterComment [hsc_num=" + hsc_num + ", hsr_num=" + hsr_num + ", hs_num=" + hs_num + ", c_num="
				+ c_num + ", hsc_comment=" + hsc_comment + ", hsc_star=" + hsc_star + ", hsc_write_date="
				+ hsc_write_date + ", hsc_img=" + hsc_img + "]";
	}
	
}
package com.what.carezoo.model;

import java.sql.Date;

public class ViSitSitterComment {

	private int vsc_num;
	private int vsr_num;
	private int vs_num;
	private int c_num;
	private String vsc_comment;
	private double vsc_star;
	private Date vsc_write_date;
	private String vsc_img;
	public int getVsc_num() {
		return vsc_num;
	}
	public void setVsc_num(int vsc_num) {
		this.vsc_num = vsc_num;
	}
	public int getVsr_num() {
		return vsr_num;
	}
	public void setVsr_num(int vsr_num) {
		this.vsr_num = vsr_num;
	}
	public int getVs_num() {
		return vs_num;
	}
	public void setVs_num(int vs_num) {
		this.vs_num = vs_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getVsc_comment() {
		return vsc_comment;
	}
	public void setVsc_comment(String vsc_comment) {
		this.vsc_comment = vsc_comment;
	}
	public double getVsc_star() {
		return vsc_star;
	}
	public void setVsc_star(double vsc_star) {
		this.vsc_star = vsc_star;
	}
	public Date getVsc_write_date() {
		return vsc_write_date;
	}
	public void setVsc_write_date(Date vsc_write_date) {
		this.vsc_write_date = vsc_write_date;
	}
	public String getVsc_img() {
		return vsc_img;
	}
	public void setVsc_img(String vsc_img) {
		this.vsc_img = vsc_img;
	}
	
	@Override
	public String toString() {
		return "ViSitSitterComment [vsc_num=" + vsc_num + ", vsr_num=" + vsr_num + ", vs_num=" + vs_num + ", c_num=" + c_num + ", vsc_comment=" + vsc_comment + ", vsc_star=" + vsc_star + ", vsc_write_date=" + vsc_write_date + ", vsc_img="
				+ vsc_img + "]";
	}
	
	
	
}

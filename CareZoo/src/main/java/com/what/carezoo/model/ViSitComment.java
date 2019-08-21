package com.what.carezoo.model;

import java.sql.Date;

public class ViSitComment {

	private int vc_num;
	private int vsr_num;
	private int vs_num;
	private int c_num;
	private String vc_comment;
	private double vc_star;
	private Date vc_write_date;
	private String vc_img;
	public int getVc_num() {
		return vc_num;
	}
	public void setVc_num(int vc_num) {
		this.vc_num = vc_num;
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
	public String getVc_comment() {
		return vc_comment;
	}
	public void setVc_comment(String vc_comment) {
		this.vc_comment = vc_comment;
	}
	public double getVc_star() {
		return vc_star;
	}
	public void setVc_star(double vc_star) {
		this.vc_star = vc_star;
	}
	public Date getVc_write_date() {
		return vc_write_date;
	}
	public void setVc_write_date(Date vc_write_date) {
		this.vc_write_date = vc_write_date;
	}
	public String getVc_img() {
		return vc_img;
	}
	public void setVc_img(String vc_img) {
		this.vc_img = vc_img;
	}
	@Override
	public String toString() {
		return "ViSitComment [vc_num=" + vc_num + ", vsr_num=" + vsr_num + ", vs_num=" + vs_num + ", c_num=" + c_num
				+ ", vc_comment=" + vc_comment + ", vc_star=" + vc_star + ", vc_write_date=" + vc_write_date
				+ ", vc_img=" + vc_img + "]";
	}
	
}

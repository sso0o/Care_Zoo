package com.what.carezoo.model;

import java.sql.Date;

public class HomeSitterList {

	private int hsl_num;
	private int hs_num;
	private String hsl_title;
	private String comment;
	private int hsl_weight;
	private String hsl_size;
	private Date hsl_chkin;
	private Date hsl_chkout;
	private String hsl_care_place;
	private String hsl_subway;
	private String hsl_yard;
	private String hsl_baby;
	private String hsl_family;
	private String hsl_img;
	public int getHsl_num() {
		return hsl_num;
	}
	public void setHsl_num(int hsl_num) {
		this.hsl_num = hsl_num;
	}
	public int getHs_num() {
		return hs_num;
	}
	public void setHs_num(int hs_num) {
		this.hs_num = hs_num;
	}
	public String getHsl_title() {
		return hsl_title;
	}
	public void setHsl_title(String hsl_title) {
		this.hsl_title = hsl_title;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getHsl_weight() {
		return hsl_weight;
	}
	public void setHsl_weight(int hsl_weight) {
		this.hsl_weight = hsl_weight;
	}
	public String getHsl_size() {
		return hsl_size;
	}
	public void setHsl_size(String hsl_size) {
		this.hsl_size = hsl_size;
	}
	public Date getHsl_chkin() {
		return hsl_chkin;
	}
	public void setHsl_chkin(Date hsl_chkin) {
		this.hsl_chkin = hsl_chkin;
	}
	public Date getHsl_chkout() {
		return hsl_chkout;
	}
	public void setHsl_chkout(Date hsl_chkout) {
		this.hsl_chkout = hsl_chkout;
	}
	public String getHsl_care_place() {
		return hsl_care_place;
	}
	public void setHsl_care_place(String hsl_care_place) {
		this.hsl_care_place = hsl_care_place;
	}
	public String getHsl_subway() {
		return hsl_subway;
	}
	public void setHsl_subway(String hsl_subway) {
		this.hsl_subway = hsl_subway;
	}
	public String getHsl_yard() {
		return hsl_yard;
	}
	public void setHsl_yard(String hsl_yard) {
		this.hsl_yard = hsl_yard;
	}
	public String getHsl_baby() {
		return hsl_baby;
	}
	public void setHsl_baby(String hsl_baby) {
		this.hsl_baby = hsl_baby;
	}
	public String getHsl_family() {
		return hsl_family;
	}
	public void setHsl_family(String hsl_family) {
		this.hsl_family = hsl_family;
	}
	public String getHsl_img() {
		return hsl_img;
	}
	public void setHsl_img(String hsl_img) {
		this.hsl_img = hsl_img;
	}
	@Override
	public String toString() {
		return "HomeSitterList [hsl_num=" + hsl_num + ", hs_num=" + hs_num + ", hsl_title=" + hsl_title + ", comment="
				+ comment + ", hsl_weight=" + hsl_weight + ", hsl_size=" + hsl_size + ", hsl_chkin=" + hsl_chkin
				+ ", hsl_chkout=" + hsl_chkout + ", hsl_care_place=" + hsl_care_place + ", hsl_subway=" + hsl_subway
				+ ", hsl_yard=" + hsl_yard + ", hsl_baby=" + hsl_baby + ", hsl_family=" + hsl_family + ", hsl_img="
				+ hsl_img + "]";
	}
	
}

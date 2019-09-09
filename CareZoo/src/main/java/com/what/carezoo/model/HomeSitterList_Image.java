package com.what.carezoo.model;

public class HomeSitterList_Image {
	private int hsl_img_num;
	private int hsl_num;
	private String hsl_filename;
	private String hsl_write_date;
	public int getHsl_img_num() {
		return hsl_img_num;
	}
	public void setHsl_img_num(int hsl_img_num) {
		this.hsl_img_num = hsl_img_num;
	}
	public int getHsl_num() {
		return hsl_num;
	}
	public void setHsl_num(int hsl_num) {
		this.hsl_num = hsl_num;
	}
	public String getHsl_filename() {
		return hsl_filename;
	}
	public void setHsl_filename(String hsl_filename) {
		this.hsl_filename = hsl_filename;
	}
	public String getHsl_write_date() {
		return hsl_write_date;
	}
	public void setHsl_write_date(String hsl_write_date) {
		this.hsl_write_date = hsl_write_date;
	}
	@Override
	public String toString() {
		return "HomeSitterList_Image [hsl_img_num=" + hsl_img_num + ", hsl_num=" + hsl_num + ", hsl_filename="
				+ hsl_filename + ", hsl_write_date=" + hsl_write_date + "]";
	}
}

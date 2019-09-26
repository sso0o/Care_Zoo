package com.what.carezoo.model;

public class Customer_image {
	
	private int c_img_num;
	private int c_num;
	private String c_filename;
	private String c_write_date;
	public int getC_img_num() {
		return c_img_num;
	}
	public void setC_img_num(int c_img_num) {
		this.c_img_num = c_img_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getC_filename() {
		return c_filename;
	}
	public void setC_filename(String c_filename) {
		this.c_filename = c_filename;
	}
	public String getC_write_date() {
		return c_write_date;
	}
	public void setC_write_date(String c_write_date) {
		this.c_write_date = c_write_date;
	}
	@Override
	public String toString() {
		return "Customer_image [c_img_num=" + c_img_num + ", c_num=" + c_num + ", c_filename=" + c_filename + ", c_write_date=" + c_write_date + "]";
	}
	
	
	

}

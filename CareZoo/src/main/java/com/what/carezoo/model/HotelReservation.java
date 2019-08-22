package com.what.carezoo.model;

import java.util.Date;

public class HotelReservation {
	private int hr_num;
	private int c_num;
	private int h_num;
	private int hr_child;
	private int hr_adult;
	private String hr_chkin;
	private String hr_chkout;
	private String hr_status;
	public int getHr_num() {
		return hr_num;
	}
	public void setHr_num(int hr_num) {
		this.hr_num = hr_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getH_num() {
		return h_num;
	}
	public void setH_num(int h_num) {
		this.h_num = h_num;
	}
	public int getHr_child() {
		return hr_child;
	}
	public void setHr_child(int hr_child) {
		this.hr_child = hr_child;
	}
	public int getHr_adult() {
		return hr_adult;
	}
	public void setHr_adult(int hr_adult) {
		this.hr_adult = hr_adult;
	}
	public String getHr_chkin() {
		return hr_chkin;
	}
	public void setHr_chkin(String hr_chkin) {
		this.hr_chkin = hr_chkin;
	}
	public String getHr_chkout() {
		return hr_chkout;
	}
	public void setHr_chkout(String hr_chkout) {
		this.hr_chkout = hr_chkout;
	}
	public String getHr_status() {
		return hr_status;
	}
	public void setHr_status(String hr_status) {
		this.hr_status = hr_status;
	}
	
}

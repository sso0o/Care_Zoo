package com.what.carezoo.model;

import java.util.Date;

public class PetHotelReservation {
    private int phr_num;
	private int c_num;
	private int ph_num;
	private Date phr_chkin;
	private Date phr_chkout;
	private String phr_status;
	public int getPhr_num() {
		return phr_num;
	}
	public void setPhr_num(int phr_num) {
		this.phr_num = phr_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getPh_num() {
		return ph_num;
	}
	public void setPh_num(int ph_num) {
		this.ph_num = ph_num;
	}
	public Date getPhr_chkin() {
		return phr_chkin;
	}
	public void setPhr_chkin(Date phr_chkin) {
		this.phr_chkin = phr_chkin;
	}
	public Date getPhr_chkout() {
		return phr_chkout;
	}
	public void setPhr_chkout(Date phr_chkout) {
		this.phr_chkout = phr_chkout;
	}
	public String getPhr_status() {
		return phr_status;
	}
	public void setPhr_status(String phr_status) {
		this.phr_status = phr_status;
	}

	
}

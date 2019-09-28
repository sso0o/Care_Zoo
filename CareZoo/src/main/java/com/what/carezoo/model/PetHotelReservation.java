package com.what.carezoo.model;

public class PetHotelReservation {
	private int phr_num;
	private int c_num;
	private int p_num;
	private int ph_num;
	private int phrm_num;
	private int p_count;
	private String phr_chkin;
	private String phr_chkout;
	private String phr_status;
	public int getP_count() {
		return p_count;
	}
	public void setP_count(int p_count) {
		this.p_count = p_count;
	}
	public int getPhr_num() {
		return phr_num;
	}
	public void setPhrm_num(int phrm_num) {
		this.phrm_num = phrm_num;
	}
	
	public int getPhrm_num() {
		return phrm_num;
	}
	public void setPhr_num(int phrm_num) {
		this.phrm_num = phrm_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public int getPh_num() {
		return ph_num;
	}
	public void setPh_num(int ph_num) {
		this.ph_num = ph_num;
	}
	public String getPhr_chkin() {
		return phr_chkin;
	}
	public void setPhr_chkin(String phr_chkin) {
		this.phr_chkin = phr_chkin;
	}
	public String getPhr_chkout() {
		return phr_chkout;
	}
	public void setPhr_chkout(String phr_chkout) {
		this.phr_chkout = phr_chkout;
	}
	public String getPhr_status() {
		return phr_status;
	}
	public void setPhr_status(String phr_status) {
		this.phr_status = phr_status;
	}
	@Override
	public String toString() {
		return "PetHotelReservation [phr_num=" + phr_num + ", c_num=" + c_num + ", p_num=" + p_num + ", ph_num="
				+ ph_num + ", phrm_num=" + phrm_num + ", p_count=" + p_count + ", phr_chkin=" + phr_chkin
				+ ", phr_chkout=" + phr_chkout + ", phr_status=" + phr_status + "]";
	}
	
}

package com.what.carezoo.model;


public class HomeSitterReservation {
	private int hsr_num;
	private int c_num;
	private int hs_num;
	private String hsr_chkin;
	private String hsr_chkout;
	private String hsr_hour;
	private String hsr_status;
	private int hsr_numof_pet;
	private int p_num;
	private int hsr_totalprice;
	public int getHsr_num() {
		return hsr_num;
	}
	public void setHsr_num(int hsr_num) {
		this.hsr_num = hsr_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getHs_num() {
		return hs_num;
	}
	public void setHs_num(int hs_num) {
		this.hs_num = hs_num;
	}
	public String getHsr_chkin() {
		return hsr_chkin;
	}
	public void setHsr_chkin(String hsr_chkin) {
		this.hsr_chkin = hsr_chkin;
	}
	public String getHsr_chkout() {
		return hsr_chkout;
	}
	public void setHsr_chkout(String hsr_chkout) {
		this.hsr_chkout = hsr_chkout;
	}
	public String getHsr_hour() {
		return hsr_hour;
	}
	public void setHsr_hour(String hsr_hour) {
		this.hsr_hour = hsr_hour;
	}
	public String getHsr_status() {
		return hsr_status;
	}
	public void setHsr_status(String hsr_status) {
		this.hsr_status = hsr_status;
	}

	public int getHsr_numof_pet() {
		return hsr_numof_pet;
	}
	public void setHsr_numof_pet(int hsr_numof_pet) {
		this.hsr_numof_pet = hsr_numof_pet;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public int getHsr_totalprice() {
		return hsr_totalprice;
	}
	public void setHsr_totalprice(int hsr_totalprice) {
		this.hsr_totalprice = hsr_totalprice;
	}
	@Override
	public String toString() {

		return "HomeSitterReservation [hsr_num=" + hsr_num + ", c_num=" + c_num + ", hs_num=" + hs_num + ", hsr_chkin="
				+ hsr_chkin + ", hsr_chkout=" + hsr_chkout + ", hsr_hour=" + hsr_hour + ", hsr_status=" + hsr_status
				+ ", hsr_numof_pet=" + hsr_numof_pet + ", p_num=" + p_num + ", hsr_totalprice=" + hsr_totalprice + "]";
	}
}

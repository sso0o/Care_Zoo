package com.what.carezoo.model;

public class PetHotelReservation {
	private int phr_num;
	private int c_num;
	private String c_name;
	private String ph_name;
	private String phrm_name;
	private int p_num;
	private int ph_num;
	private int phrm_num;
	private int p_count;
	private String phr_chkin;
	private String phr_chkout;
	private String phr_status;
	private String phr_message;
	private int phr_price;
	private int phr_totalDays;
	private String phr_purpose;
	private String phr_imp_uid;
	private String phr_merchant_uid;
	private int phr_numof_pet;
	
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getPh_name() {
		return ph_name;
	}
	public void setPh_name(String ph_name) {
		this.ph_name = ph_name;
	}
	public String getPhrm_name() {
		return phrm_name;
	}
	public void setPhrm_name(String phrm_name) {
		this.phrm_name = phrm_name;
	}
	public int getPhr_numof_pet() {
		return phr_numof_pet;
	}
	public void setPhr_numof_pet(int phr_numof_pet) {
		this.phr_numof_pet = phr_numof_pet;
	}
	public String getPhr_merchant_uid() {
		return phr_merchant_uid;
	}
	public void setPhr_merchant_uid(String phr_merchant_uid) {
		this.phr_merchant_uid = phr_merchant_uid;
	}
	public String getPhr_imp_uid() {
		return phr_imp_uid;
	}
	public void setPhr_imp_uid(String phr_imp_uid) {
		this.phr_imp_uid = phr_imp_uid;
	}
	public String getPhr_purpose() {
		return phr_purpose;
	}
	public void setPhr_purpose(String phr_purpose) {
		this.phr_purpose = phr_purpose;
	}
	public String getPhr_message() {
		return phr_message;
	}
	public void setPhr_message(String phr_message) {
		this.phr_message = phr_message;
	}
	public int getPhr_price() {
		return phr_price;
	}
	public void setPhr_price(int phr_price) {
		this.phr_price = phr_price;
	}
	public int getPhr_totalDays() {
		return phr_totalDays;
	}
	public void setPhr_totalDays(int phr_totalDays) {
		this.phr_totalDays = phr_totalDays;
	}
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
	public int getPhrm_num() {
		return phrm_num;
	}
	public void setPhrm_num(int phrm_num) {
		this.phrm_num = phrm_num;
	}
	public int getP_count() {
		return p_count;
	}
	public void setP_count(int p_count) {
		this.p_count = p_count;
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
		return "PetHotelReservation [phr_num=" + phr_num + ", c_num=" + c_num + ", c_name=" + c_name + ", ph_name="
				+ ph_name + ", phrm_name=" + phrm_name + ", p_num=" + p_num + ", ph_num=" + ph_num + ", phrm_num="
				+ phrm_num + ", p_count=" + p_count + ", phr_chkin=" + phr_chkin + ", phr_chkout=" + phr_chkout
				+ ", phr_status=" + phr_status + ", phr_message=" + phr_message + ", phr_price=" + phr_price
				+ ", phr_totalDays=" + phr_totalDays + ", phr_purpose=" + phr_purpose + ", phr_imp_uid=" + phr_imp_uid
				+ ", phr_merchant_uid=" + phr_merchant_uid + ", phr_numof_pet=" + phr_numof_pet + "]";
	}
	
	
}

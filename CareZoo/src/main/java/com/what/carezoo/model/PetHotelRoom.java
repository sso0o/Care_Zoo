package com.what.carezoo.model;

public class PetHotelRoom {
	private int ph_num;
	private int phrm_num;
	private String phrm_name;
	private int phrm_price;
	private int phrm_m_price;
	private int phrm_l_price;
	private int phrm_p_count;
	private int phmr_day_price;
	private String phrm_pet_size;
	
	public int getPhrm_m_price() {
		return phrm_m_price;
	}
	public void setPhrm_m_price(int phrm_m_price) {
		this.phrm_m_price = phrm_m_price;
	}
	public int getPhrm_l_price() {
		return phrm_l_price;
	}
	public void setPhrm_l_price(int phrm_l_price) {
		this.phrm_l_price = phrm_l_price;
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
	public String getPhrm_name() {
		return phrm_name;
	}
	public void setPhrm_name(String phrm_name) {
		this.phrm_name = phrm_name;
	}
	public int getPhrm_price() {
		return phrm_price;
	}
	public void setPhrm_price(int phrm_price) {
		this.phrm_price = phrm_price;
	}
	public int getPhrm_p_count() {
		return phrm_p_count;
	}
	public void setPhrm_p_count(int phrm_p_count) {
		this.phrm_p_count = phrm_p_count;
	}
	public int getPhmr_day_price() {
		return phmr_day_price;
	}
	public void setPhmr_day_price(int phmr_day_price) {
		this.phmr_day_price = phmr_day_price;
	}
	public String getPhrm_pet_size() {
		return phrm_pet_size;
	}
	public void setPhrm_pet_size(String phrm_pet_size) {
		this.phrm_pet_size = phrm_pet_size;
	}
	@Override
	public String toString() {
		return "PetHotelRoom [ph_num=" + ph_num + ", phrm_num=" + phrm_num + ", phrm_name=" + phrm_name
				+ ", phrm_price=" + phrm_price + ", phrm_m_price=" + phrm_m_price + ", phrm_l_price=" + phrm_l_price
				+ ", phrm_p_count=" + phrm_p_count + ", phmr_day_price=" + phmr_day_price + ", phrm_pet_size="
				+ phrm_pet_size + "]";
	}

	
	
}

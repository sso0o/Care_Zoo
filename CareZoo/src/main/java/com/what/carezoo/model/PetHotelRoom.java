package com.what.carezoo.model;

public class PetHotelRoom {
	private int ph_num;
	private int phr_num;
	private String phr_name;
	private int phr_price;
	private int phr_p_count;
	private int phr_day_price;
	private String phr_pet_size;
	public int getPh_num() {
		return ph_num;
	}
	public void setPh_num(int ph_num) {
		this.ph_num = ph_num;
	}
	public int getPhr_num() {
		return phr_num;
	}
	public void setPhr_num(int phr_num) {
		this.phr_num = phr_num;
	}
	public String getPhr_name() {
		return phr_name;
	}
	public void setPhr_name(String phr_name) {
		this.phr_name = phr_name;
	}
	public int getPhr_price() {
		return phr_price;
	}
	public void setPhr_price(int phr_price) {
		this.phr_price = phr_price;
	}
	public int getPhr_p_count() {
		return phr_p_count;
	}
	public void setPhr_p_count(int phr_p_count) {
		this.phr_p_count = phr_p_count;
	}
	public int getPhr_day_price() {
		return phr_day_price;
	}
	public void setPhr_day_price(int phr_day_price) {
		this.phr_day_price = phr_day_price;
	}
	public String getPhr_pet_size() {
		return phr_pet_size;
	}
	public void setPhr_pet_size(String phr_pet_size) {
		this.phr_pet_size = phr_pet_size;
	}
	@Override
	public String toString() {
		return "PetHotelRoom [ph_num=" + ph_num + ", phr_num=" + phr_num + ", phr_name=" + phr_name + ", phr_price="
				+ phr_price + ", phr_p_count=" + phr_p_count + ", phr_day_price=" + phr_day_price + ", phr_pet_size="
				+ phr_pet_size + "]";
	}
	
}

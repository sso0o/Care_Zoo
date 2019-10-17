package com.what.carezoo.model;

import java.util.ArrayList;
import java.util.List;

public class PetHotelRoom {
	private int ph_num;
	private int phrm_num;
	private String phrm_name;
	private int phrm_price;
	private int phrm_m_price;
	private int phrm_l_price;
	private int phrm_p_count;
	private String phrm_pet_size;
	private int rcount;
	private int phrm_p_max;
	private int remaining_room;
	private String phrm_option;
	private List<String> phrm_options = new ArrayList<String>();
	
	public void addPhrmOption(String option) {
		phrm_options.add(option);
	}
	public List<String> getPhrm_options() {
		return phrm_options;
	}
	public void setPhrm_options(List<String> phrm_options) {
		this.phrm_options = phrm_options;
	}
	public String getPhrm_option() {
		return phrm_option;
	}
	public void setPhrm_option(String phrm_option) {
		this.phrm_option = phrm_option;
	}
	public int getRemaining_room() {
		return remaining_room;
	}
	public void setRemaining_room(int remaining_room) {
		this.remaining_room = remaining_room;
	}
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

	public String getPhrm_pet_size() {
		return phrm_pet_size;
	}
	public void setPhrm_pet_size(String phrm_pet_size) {
		this.phrm_pet_size = phrm_pet_size;
	}
	public int getRcount() {
		return rcount;
	}
	public void setRcount(int rcount) {
		this.rcount = rcount;
	}
	public int getPhrm_p_max() {
		return phrm_p_max;
	}
	public void setPhrm_p_max(int phrm_p_max) {
		this.phrm_p_max = phrm_p_max;
	}
	@Override
	public String toString() {
		return "PetHotelRoom [ph_num=" + ph_num + ", phrm_num=" + phrm_num + ", phrm_name=" + phrm_name
				+ ", phrm_price=" + phrm_price + ", phrm_m_price=" + phrm_m_price + ", phrm_l_price=" + phrm_l_price
				+ ", phrm_p_count=" + phrm_p_count + ", phrm_pet_size=" + phrm_pet_size + ", rcount=" + rcount
				+ ", phrm_p_max=" + phrm_p_max + ", remaining_room=" + remaining_room + ", phrm_option=" + phrm_option
				+ "]";
	}
	
}

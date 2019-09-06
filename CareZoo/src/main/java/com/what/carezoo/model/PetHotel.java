package com.what.carezoo.model;

import java.util.List;

public class PetHotel {
	private int ph_num;
	private String ph_name;
	private String ph_address;
	private String ph_d_address;
	private int ph_p_count;
	private String ph_latitude;
	private String ph_longitude;
	private String ph_fileName;
	private List<String> ph_filesName;
	private int ph_c_count;
	private double ph_avgStar;
	private int ph_maxPrice;
	private int ph_minPrice;

	public void setPh_fileName(String ph_fileName) {
		this.ph_fileName = ph_fileName;
	}
	public List<String> getPh_filesName() {
		return ph_filesName;
	}

	public void setPh_filesName(List<String> ph_filesName) {
		this.ph_filesName = ph_filesName;
	}

	public int getPh_c_count() {
		return ph_c_count;
	}

	public void setPh_c_count(int ph_c_count) {
		this.ph_c_count = ph_c_count;
	}

	public double getPh_avgStar() {
		return ph_avgStar;
	}

	public void setPh_avgStar(double ph_avgStar) {
		this.ph_avgStar = ph_avgStar;
	}

	public int getPh_maxPrice() {
		return ph_maxPrice;
	}

	public void setPh_maxPrice(int ph_maxPrice) {
		this.ph_maxPrice = ph_maxPrice;
	}

	public int getPh_minPrice() {
		return ph_minPrice;
	}

	public void setPh_minPrice(int ph_minPrice) {
		this.ph_minPrice = ph_minPrice;
	}

	public int getPh_num() {
		return ph_num;
	}

	public void setPh_num(int ph_num) {
		this.ph_num = ph_num;
	}

	public String getPh_name() {
		return ph_name;
	}

	public void setPh_name(String ph_name) {
		this.ph_name = ph_name;
	}

	public String getPh_address() {
		return ph_address;
	}

	public void setPh_address(String ph_address) {
		this.ph_address = ph_address;
	}

	public String getPh_d_address() {
		return ph_d_address;
	}

	public void setPh_d_address(String ph_d_address) {
		this.ph_d_address = ph_d_address;
	}

	public int getPh_p_count() {
		return ph_p_count;
	}

	public void setPh_p_count(int ph_p_count) {
		this.ph_p_count = ph_p_count;
	}

	public String getPh_latitude() {
		return ph_latitude;
	}

	public void setPh_latitude(String ph_latitude) {
		this.ph_latitude = ph_latitude;
	}

	public String getPh_longitude() {
		return ph_longitude;
	}

	public void setPh_longitude(String ph_longitude) {
		this.ph_longitude = ph_longitude;
	}


	public String getPh_fileName() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String toString() {
		return "PetHotel [ph_num=" + ph_num + ", ph_name=" + ph_name + ", ph_address=" + ph_address + ", ph_d_address="
				+ ph_d_address + ", ph_p_count=" + ph_p_count + ", ph_latitude=" + ph_latitude + ", ph_longitude="
				+ ph_longitude + ", ph_fileName=" + ph_fileName + ", ph_filesName=" + ph_filesName + ", ph_c_count="
				+ ph_c_count + ", ph_avgStar=" + ph_avgStar + ", ph_maxPrice=" + ph_maxPrice + ", ph_minPrice="
				+ ph_minPrice + "]";
	}
	
	

}

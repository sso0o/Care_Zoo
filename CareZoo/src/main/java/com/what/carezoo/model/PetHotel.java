package com.what.carezoo.model;

public class PetHotel {
	private int ph_num;	   
	private String ph_name;		
	private String ph_address;		
	private String ph_d_address;		
	private double ph_star;		
	private int ph_price;		
	private int ph_p_count;		
	private String ph_fileName;		
	private String ph_latitude;		
	private String ph_longitude;
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
	public double getPh_star() {
		return ph_star;
	}
	public void setPh_star(double ph_star) {
		this.ph_star = ph_star;
	}
	public int getPh_price() {
		return ph_price;
	}
	public void setPh_price(int ph_price) {
		this.ph_price = ph_price;
	}
	public int getPh_p_count() {
		return ph_p_count;
	}
	public void setPh_p_count(int ph_p_count) {
		this.ph_p_count = ph_p_count;
	}
	public String getPh_fileName() {
		return ph_fileName;
	}
	public void setPh_fileName(String ph_fileName) {
		this.ph_fileName = ph_fileName;
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
	@Override
	public String toString() {
		return "PetHotel [ph_num=" + ph_num + ", ph_name=" + ph_name + ", ph_address=" + ph_address + ", ph_d_address="
				+ ph_d_address + ", ph_star=" + ph_star + ", ph_price=" + ph_price + ", ph_p_count=" + ph_p_count
				+ ", ph_fileName=" + ph_fileName + ", ph_latitude=" + ph_latitude + ", ph_longitude=" + ph_longitude
				+ "]";
	}


}

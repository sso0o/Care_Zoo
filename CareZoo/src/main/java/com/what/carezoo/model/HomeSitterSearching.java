package com.what.carezoo.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class HomeSitterSearching {
	public int hss_num;
	public String hss_address;
	public String hss_d_address;
	public String hss_service_type;
	public String hss_start_date;
	public String hss_end_date;
	public int hss_pet_age;
	public String hss_pet_size;
	public int getHss_num() {
		return hss_num;
	}
	public void setHss_num(int hss_num) {
		this.hss_num = hss_num;
	}
	public String getHss_address() {
		return hss_address;
	}
	public void setHss_address(String hss_address) {
		this.hss_address = hss_address;
	}
	public String getHss_d_address() {
		return hss_d_address;
	}
	public void setHss_d_address(String hss_d_address) {
		this.hss_d_address = hss_d_address;
	}
	public String getHss_service_type() {
		return hss_service_type;
	}
	public void setHss_service_type(String hss_service_type) {
		this.hss_service_type = hss_service_type;
	}
	public String getHss_start_date() {
		return hss_start_date;
	}
	public void setHss_start_date(String hss_start_date) {
		this.hss_start_date = hss_start_date;
	}
	public String getHss_end_date() {
		return hss_end_date;
	}
	public void setHss_end_date(String hss_end_date) {
		this.hss_end_date = hss_end_date;
	}
	public int getHss_pet_age() {
		return hss_pet_age;
	}
	public void setHss_pet_age(int hss_pet_age) {
		this.hss_pet_age = hss_pet_age;
	}
	public String getHss_pet_size() {
		return hss_pet_size;
	}
	public void setHss_pet_size(String hss_pet_size) {
		this.hss_pet_size = hss_pet_size;
	}
	@Override
	public String toString() {
		return "HomeSitterSearching [hss_num=" + hss_num + ", hss_address=" + hss_address + ", hss_d_address="
				+ hss_d_address + ", hss_service_type=" + hss_service_type + ", hss_start_date=" + hss_start_date
				+ ", hss_end_date=" + hss_end_date + ", hss_pet_age=" + hss_pet_age + ", hss_pet_size=" + hss_pet_size
				+ "]";
	}	
}

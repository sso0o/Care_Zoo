package com.what.carezoo.model;

public class Pet_WeekList {

	private int pd_num;
	private String pd_week;
	private String pd_hour;
	private String pd_hadd;
	private String pd_date;
	public int getPd_num() {
		return pd_num;
	}
	public void setPd_num(int pd_num) {
		this.pd_num = pd_num;
	}
	public String getPd_week() {
		return pd_week;
	}
	public void setPd_week(String pd_week) {
		this.pd_week = pd_week;
	}
	public String getPd_hour() {
		return pd_hour;
	}
	public void setPd_hour(String pd_hour) {
		this.pd_hour = pd_hour;
	}
	public String getPd_hadd() {
		return pd_hadd;
	}
	public void setPd_hadd(String pd_hadd) {
		this.pd_hadd = pd_hadd;
	}
	public String getPd_date() {
		return pd_date;
	}
	public void setPd_date(String pd_date) {
		this.pd_date = pd_date;
	}
	@Override
	public String toString() {
		return "Pet_WeekList [pd_num=" + pd_num + ", pd_week=" + pd_week + ", pd_hour=" + pd_hour + ", pd_hadd="
				+ pd_hadd + ", pd_date=" + pd_date + "]";
	}
	
}

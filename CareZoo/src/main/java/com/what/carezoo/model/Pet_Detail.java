package com.what.carezoo.model;

public class Pet_Detail {

	private int pd_num;
	private int p_num;
	private String pd_week;
	private String pd_hour;
	private String pd_hAdd;
	public int getPd_num() {
		return pd_num;
	}
	public void setPd_num(int pd_num) {
		this.pd_num = pd_num;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
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
	public String getPd_hAdd() {
		return pd_hAdd;
	}
	public void setPd_hAdd(String pd_hAdd) {
		this.pd_hAdd = pd_hAdd;
	}
	@Override
	public String toString() {
		return "Pet_Detail [pd_num=" + pd_num + ", p_num=" + p_num + ", pd_week=" + pd_week + ", pd_hour=" + pd_hour
				+ ", pd_hAdd=" + pd_hAdd + "]";
	}
}

package com.what.carezoo.model;

import java.util.ArrayList;
import java.util.List;

public class Pet_Details {
	
	private int pd_num;
	private List<Integer> p_num;
	private List<String> pd_week;
	private String pd_hour;
	private String pd_hAdd;
	private String pd_date;
	private ArrayList<String> p_name;
	private int c_num;
	
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getPd_num() {
		return pd_num;
	}
	public void setPd_num(int pd_num) {
		this.pd_num = pd_num;
	}
	
	
	public List<Integer> getP_num() {
		return p_num;
	}
	public void setP_num(List<Integer> p_num) {
		this.p_num = p_num;
	}
	public List<String> getPd_week() {
		return pd_week;
	}
	public void setPd_week(List<String> pd_week) {
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
	public String getPd_date() {
		return pd_date;
	}
	public void setPd_date(String pd_date) {
		this.pd_date = pd_date;
	}
	
public ArrayList<String> getP_name() {
		return p_name;
	}
	public void setP_name(ArrayList<String> p_name2) {
		this.p_name = p_name2;
	}
	@Override
	public String toString() {
		return "Pet_Details [pd_num=" + pd_num + ", p_num=" + p_num + ", pd_week=" + pd_week + ", pd_hour=" + pd_hour
				+ ", pd_hAdd=" + pd_hAdd + ", pd_date=" + pd_date + ", p_name=" + p_name + ", c_num=" + c_num + "]";
	}
	
	
	
	
}

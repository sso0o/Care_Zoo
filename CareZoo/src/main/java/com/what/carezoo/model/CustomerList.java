package com.what.carezoo.model;

import java.util.Date;

public class CustomerList {
	private int cl_num;
	private int c_num;
	private String cl_p_name;
	private int cl_p_weight;
	private String cl_p_size;
	private Date cl_chkin;
	private Date cl_chkout;
	private Date cl_hour;
	private String cl_problem;
	public int getCl_num() {
		return cl_num;
	}
	public void setCl_num(int cl_num) {
		this.cl_num = cl_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getCl_p_name() {
		return cl_p_name;
	}
	public void setCl_p_name(String cl_p_name) {
		this.cl_p_name = cl_p_name;
	}
	public int getCl_p_weight() {
		return cl_p_weight;
	}
	public void setCl_p_weight(int cl_p_weight) {
		this.cl_p_weight = cl_p_weight;
	}
	public String getCl_p_size() {
		return cl_p_size;
	}
	public void setCl_p_size(String cl_p_size) {
		this.cl_p_size = cl_p_size;
	}
	public Date getCl_chkin() {
		return cl_chkin;
	}
	public void setCl_chkin(Date cl_chkin) {
		this.cl_chkin = cl_chkin;
	}
	public Date getCl_chkout() {
		return cl_chkout;
	}
	public void setCl_chkout(Date cl_chkout) {
		this.cl_chkout = cl_chkout;
	}
	public Date getCl_hour() {
		return cl_hour;
	}
	public void setCl_hour(Date cl_hour) {
		this.cl_hour = cl_hour;
	}
	public String getCl_problem() {
		return cl_problem;
	}
	public void setCl_problem(String cl_problem) {
		this.cl_problem = cl_problem;
	}
	@Override
	public String toString() {
		return "CustomerList [cl_num=" + cl_num + ", c_num=" + c_num + ", cl_p_name=" + cl_p_name + ", cl_p_weight="
				+ cl_p_weight + ", cl_p_size=" + cl_p_size + ", cl_chkin=" + cl_chkin + ", cl_chkout=" + cl_chkout
				+ ", cl_hour=" + cl_hour + ", cl_problem=" + cl_problem + "]";
	}
	
}

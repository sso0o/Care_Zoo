package com.what.carezoo.model;

import java.sql.Date;

public class Pet {

	private int p_num;
	private int c_num;
	private String p_kind;
	private String p_name;
	private String p_sex;
	private Date p_birth;
	private int p_weight;
	private String p_none_sex;
	private String p_img;
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getP_kind() {
		return p_kind;
	}
	public void setP_kind(String p_kind) {
		this.p_kind = p_kind;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_sex() {
		return p_sex;
	}
	public void setP_sex(String p_sex) {
		this.p_sex = p_sex;
	}
	public Date getP_birth() {
		return p_birth;
	}
	public void setP_birth(Date p_birth) {
		this.p_birth = p_birth;
	}
	public int getP_weight() {
		return p_weight;
	}
	public void setP_weight(int p_weight) {
		this.p_weight = p_weight;
	}
	public String getP_none_sex() {
		return p_none_sex;
	}
	public void setP_none_sex(String p_none_sex) {
		this.p_none_sex = p_none_sex;
	}
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	
	@Override
	public String toString() {
		return "Pet [p_num=" + p_num + ", c_num=" + c_num + ", p_kind=" + p_kind + ", p_name=" + p_name + ", p_sex="
				+ p_sex + ", p_birth=" + p_birth + ", p_weight=" + p_weight + ", p_none_sex=" + p_none_sex + ", p_img="
				+ p_img + "]";
	}
	
}
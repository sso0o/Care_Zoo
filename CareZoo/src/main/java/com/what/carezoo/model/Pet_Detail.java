package com.what.carezoo.model;

public class Pet_Detail {

	private int vsr_num;
	private int p_num;
	private int c_num;
	
	
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getVsr_num() {
		return vsr_num;
	}
	public void setVsr_num(int vsr_num) {
		this.vsr_num = vsr_num;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	@Override
	public String toString() {
		return "Pet_Detail [vsr_num=" + vsr_num + ", p_num=" + p_num + ", c_num=" + c_num + "]";
	}

}

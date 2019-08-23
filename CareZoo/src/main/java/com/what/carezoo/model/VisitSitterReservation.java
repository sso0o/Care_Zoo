package com.what.carezoo.model;

import java.sql.Date;

public class VisitSitterReservation {

	private int vsr_num;
	private int c_num;
	private int vs_num;
	private String vsr_chkin;
	private String vsr_hour;
	private String vsr_status;
	public int getVsr_num() {
		return vsr_num;
	}
	public void setVsr_num(int vsr_num) {
		this.vsr_num = vsr_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getVs_num() {
		return vs_num;
	}
	public void setVs_num(int vs_num) {
		this.vs_num = vs_num;
	}
	public String getVsr_chkin() {
		return vsr_chkin;
	}
	public void setVsr_chkin(String vsr_chkin) {
		this.vsr_chkin = vsr_chkin;
	}
	public String getVsr_hour() {
		return vsr_hour;
	}
	public void setVsr_hour(String vsr_hour) {
		this.vsr_hour = vsr_hour;
	}
	public String getVsr_status() {
		return vsr_status;
	}
	public void setVsr_status(String vsr_status) {
		this.vsr_status = vsr_status;
	}
	@Override
	public String toString() {
		return "VisitSitterReservation [vsr_num=" + vsr_num + ", c_num=" + c_num + ", vs_num=" + vs_num + ", vsr_chkin="
				+ vsr_chkin + ", vsr_hour=" + vsr_hour + ", vsr_status=" + vsr_status + "]";
	}
	
}

package com.what.carezoo.model;

public class HomeSitterDisabledate {
	private int hsd_num;
	private int hs_num;
	private String hsd_disabledate;
	public int getHsd_num() {
		return hsd_num;
	}
	public void setHsd_num(int hsd_num) {
		this.hsd_num = hsd_num;
	}
	public int getHs_num() {
		return hs_num;
	}
	public void setHs_num(int hs_num) {
		this.hs_num = hs_num;
	}
	public String getHsd_disabledate() {
		return hsd_disabledate;
	}
	public void setHsd_disabledate(String hsd_disabledate) {
		this.hsd_disabledate = hsd_disabledate;
	}
	@Override
	public String toString() {
		return "HomeSitterDisabledate [hsd_num=" + hsd_num + ", hs_num=" + hs_num + ", hsd_disabledate="
				+ hsd_disabledate + "]";
	}
	
}

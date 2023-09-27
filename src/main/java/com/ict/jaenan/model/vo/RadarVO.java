package com.ict.jaenan.model.vo;

public class RadarVO {
	private String rdr_img, last_img;

	
	
	public String getLast_img() {
		return last_img;
	}

	public void setLast_img(String last_img) {
		this.last_img = last_img;
	}

	public String getRdr_img() {
		return rdr_img;
	}

	public void setRdr_img(String rdr_img) {
		this.rdr_img = rdr_img;
	}

	public RadarVO(String rdr_img) {
		super();
		this.rdr_img = rdr_img;
	}
	
	public RadarVO() {
		// TODO Auto-generated constructor stub
	}
}

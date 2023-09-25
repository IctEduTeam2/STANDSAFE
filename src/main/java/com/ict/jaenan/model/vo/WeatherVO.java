package com.ict.jaenan.model.vo;

public class WeatherVO {
	 private String baseDate,baseTime,category,nx,ny,fcstValue,fcstDate,fcstTime; //api에서필요한 저장공간
	 private String gridX ,gridY ;  //좌표확인하기 위해서 
	 private String lgt, pty, rn1 , sky, t1h, reh, uuu, vvv, vec, wsd; //카테고리별로 저장하기위해서 

	 
	 
	 
	 
	public String getLgt() {
		return lgt;
	}

	public void setLgt(String lgt) {
		this.lgt = lgt;
	}

	public String getPty() {
		return pty;
	}

	public void setPty(String pty) {
		this.pty = pty;
	}

	public String getRn1() {
		return rn1;
	}

	public void setRn1(String rn1) {
		this.rn1 = rn1;
	}

	public String getSky() {
		return sky;
	}

	public void setSky(String sky) {
		this.sky = sky;
	}

	public String getT1h() {
		return t1h;
	}

	public void setT1h(String t1h) {
		this.t1h = t1h;
	}

	public String getReh() {
		return reh;
	}

	public void setReh(String reh) {
		this.reh = reh;
	}

	public String getUuu() {
		return uuu;
	}

	public void setUuu(String uuu) {
		this.uuu = uuu;
	}

	public String getVvv() {
		return vvv;
	}

	public void setVvv(String vvv) {
		this.vvv = vvv;
	}

	public String getVec() {
		return vec;
	}

	public void setVec(String vec) {
		this.vec = vec;
	}

	public String getWsd() {
		return wsd;
	}

	public void setWsd(String wsd) {
		this.wsd = wsd;
	}

	public String getFcstValue() {
		return fcstValue;
	}

	public void setFcstValue(String fcstValue) {
		this.fcstValue = fcstValue;
	}

	public String getFcstDate() {
		return fcstDate;
	}

	public void setFcstDate(String fcstDate) {
		this.fcstDate = fcstDate;
	}

	public String getFcstTime() {
		return fcstTime;
	}

	public void setFcstTime(String fcstTime) {
		this.fcstTime = fcstTime;
	}

	public String getGridX() {
		return gridX;
	}

	public void setGridX(String gridX) {
		this.gridX = gridX;
	}

	public String getGridY() {
		return gridY;
	}

	public void setGridY(String gridY) {
		this.gridY = gridY;
	}

	public String getBaseDate() {
		return baseDate;
	}

	public void setBaseDate(String baseDate) {
		this.baseDate = baseDate;
	}

	public String getBaseTime() {
		return baseTime;
	}

	public void setBaseTime(String baseTime) {
		this.baseTime = baseTime;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getNx() {
		return nx;
	}

	public void setNx(String nx) {
		this.nx = nx;
	}

	public String getNy() {
		return ny;
	}

	public void setNy(String ny) {
		this.ny = ny;
	}



	public WeatherVO( String category,  String fcstValue,
			String fcstDate, String fcstTime) { 

	
		this.category = category;
		this.fcstValue = fcstValue;
		this.fcstDate = fcstDate;
		this.fcstTime = fcstTime;
	}
	
	
	
	

	public WeatherVO(String baseDate, String baseTime, String category, String fcstValue, String fcstDate,
			String fcstTime) {
		super();
		this.baseDate = baseDate;
		this.baseTime = baseTime;
		this.category = category;
		this.fcstValue = fcstValue;
		this.fcstDate = fcstDate;
		this.fcstTime = fcstTime;
	}

	public WeatherVO() {
		// TODO Auto-generated constructor stub
	}


	
	 
}

package com.ict.jaenan.model.vo;

public class WeatherVO {
	 private String baseDate,baseTime,category,nx,ny,obsrValue,fcstDate,fcstTime;
	 private String gridX ,gridY ;

	 
	 
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

	public String getObsrValue() {
		return obsrValue;
	}

	public void setObsrValue(String obsrValue) {
		this.obsrValue = obsrValue;
	}

	public WeatherVO(String baseDate, String baseTime, String category, String nx, String ny, String obsrValue,
			String fcstDate, String fcstTime) {

		this.baseDate = baseDate;
		this.baseTime = baseTime;
		this.category = category;
		this.nx = nx;
		this.ny = ny;
		this.obsrValue = obsrValue;
		this.fcstDate = fcstDate;
		this.fcstTime = fcstTime;
	}

	public WeatherVO() {
		// TODO Auto-generated constructor stub
	}


	
	 
}

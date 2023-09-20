package com.ict.jaenan.model.vo;

public class JaenanRainVO {
	
	
	private String local, ta, desc, icon,rn_hr1; //지역, 온도, 아이콘 , 상태, 강수량
	private String city, tmEf, wf, tmn,tmx,rnSt; //지역, 시간(자정 또는 정오), 상태, 최저, 최고, 강수확률
	
	private String category,nx,ny,obsrValue;
	
	
	
	
	
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


	public JaenanRainVO(String category, String nx, String ny, String obsrValue) {
		super();
		this.category = category;
		this.nx = nx;
		this.ny = ny;
		this.obsrValue = obsrValue;
	}


	public JaenanRainVO(String local, String ta, String desc, String icon, String rn_hr1) {
		super();
		this.local = local;
		this.ta = ta;
		this.desc = desc;
		this.icon = icon;
		this.rn_hr1 = rn_hr1;
	}
	
	
	public JaenanRainVO(String city, String tmEf, String wf, String tmn, String tmx, String rnSt) {
		super();
		this.city = city;
		this.tmEf = tmEf;
		this.wf = wf;
		this.tmn = tmn;
		this.tmx = tmx;
		this.rnSt = rnSt;
	}

	
	

	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public String getTa() {
		return ta;
	}
	public void setTa(String ta) {
		this.ta = ta;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getRn_hr1() {
		return rn_hr1;
	}
	public void setRn_hr1(String rn_hr1) {
		this.rn_hr1 = rn_hr1;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getTmEf() {
		return tmEf;
	}
	public void setTmEf(String tmEf) {
		this.tmEf = tmEf;
	}
	public String getWf() {
		return wf;
	}
	public void setWf(String wf) {
		this.wf = wf;
	}
	public String getTmn() {
		return tmn;
	}
	public void setTmn(String tmn) {
		this.tmn = tmn;
	}
	public String getTmx() {
		return tmx;
	}
	public void setTmx(String tmx) {
		this.tmx = tmx;
	}
	public String getRnSt() {
		return rnSt;
	}
	public void setRnSt(String rnSt) {
		this.rnSt = rnSt;
	}
	
	
	
}

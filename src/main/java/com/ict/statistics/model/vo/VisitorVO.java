package com.ict.statistics.model.vo;

import java.util.Date;

public class VisitorVO {
	private int CHKNUM;
	private String ID;
	private Date VISIT_DATE;
	private int VISIT_COUNT;
	
	public int getCHKNUM() {
		return CHKNUM;
	}


	public void setCHKNUM(int cHKNUM) {
		CHKNUM = cHKNUM;
	}


	public String getID() {
		return ID;
	}


	public void setID(String iD) {
		ID = iD;
	}


	public Date getVISIT_DATE() {
		return VISIT_DATE;
	}


	public void setVISIT_DATE(Date vISIT_DATE) {
		VISIT_DATE = vISIT_DATE;
	}


	public int getVISIT_COUNT() {
		return VISIT_COUNT;
	}


	public void setVISITCOUNT(int vISIT_COUNT) {
		VISIT_COUNT = vISIT_COUNT;
	}


	@Override
	public String toString() {
	    return "VisitorVO [CHKNUM=" + CHKNUM + ", ID=" + ID + ", VISIT_DATE=" + VISIT_DATE + ", VISIT_COUNT=" + VISIT_COUNT + "]";
	}


}

package com.ict.statistics.model.vo;

import java.util.Date;

public class PostVO{
	private int ID; // 게시글의 ID
	private String TYPE; // 게시글의 내용
    private String SUBJECT; // 게시글의 제목
    private Date DATE; // 게시글 작성일
    
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
	public String getSUBJECT() {
		return SUBJECT;
	}
	public void setSUBJECT(String sUBJECT) {
		SUBJECT = sUBJECT;
	}
	public Date getDATE() {
		return DATE;
	}
	public void setDATE(Date dATE) {
		DATE = dATE;
	}
    
    
}

package com.ict.bbs.model.vo;

import org.springframework.web.multipart.MultipartFile;

	public class EV_BBS_VO {
	private String EVENT_NUM, EVENT_SUBJECT, EVENT_WRITER, EVENT_CONTENT, EVENT_FILE,
	EVENT_HIT, EVENT_DATE, EVENT_UPDATE, EVENT_ST, ADMIN_NUM, EVENT_TYPE;
	
	private MultipartFile file;
	
	

	public String getEVENT_NUM() {
		return EVENT_NUM;
	}

	public void setEVENT_NUM(String eVENT_NUM) {
		EVENT_NUM = eVENT_NUM;
	}

	public String getEVENT_SUBJECT() {
		return EVENT_SUBJECT;
	}

	public void setEVENT_SUBJECT(String eVENT_SUBJECT) {
		EVENT_SUBJECT = eVENT_SUBJECT;
	}

	public String getEVENT_WRITER() {
		return EVENT_WRITER;
	}

	public void setEVENT_WRITER(String eVENT_WRITER) {
		EVENT_WRITER = eVENT_WRITER;
	}

	public String getEVENT_CONTENT() {
		return EVENT_CONTENT;
	}

	public void setEVENT_CONTENT(String eVENT_CONTENT) {
		EVENT_CONTENT = eVENT_CONTENT;
	}

	public String getEVENT_FILE() {
		return EVENT_FILE;
	}

	public void setEVENT_FILE(String eVENT_FILE) {
		EVENT_FILE = eVENT_FILE;
	}

	public String getEVENT_HIT() {
		return EVENT_HIT;
	}

	public void setEVENT_HIT(String eVENT_HIT) {
		EVENT_HIT = eVENT_HIT;
	}

	public String getEVENT_DATE() {
		return EVENT_DATE;
	}

	public void setEVENT_DATE(String eVENT_DATE) {
		EVENT_DATE = eVENT_DATE;
	}

	public String getEVENT_UPDATE() {
		return EVENT_UPDATE;
	}

	public void setEVENT_UPDATE(String eVENT_UPDATE) {
		EVENT_UPDATE = eVENT_UPDATE;
	}

	public String getEVENT_ST() {
		return EVENT_ST;
	}

	public void setEVENT_ST(String eVENT_ST) {
		EVENT_ST = eVENT_ST;
	}

	public String getADMIN_NUM() {
		return ADMIN_NUM;
	}

	public void setADMIN_NUM(String aDMIN_NUM) {
		ADMIN_NUM = aDMIN_NUM;
	}

	public String getEVENT_TYPE() {
		return EVENT_TYPE;
	}

	public void setEVENT_TYPE(String eVENT_TYPE) {
		EVENT_TYPE = eVENT_TYPE;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	

}

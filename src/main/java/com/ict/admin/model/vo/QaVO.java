package com.ict.admin.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class QaVO {
	
	private String BOARD_NUM,BOARD_TYPE,BOARD_SUBJECT,BOARD_WRITER,BOARD_CONTENT,BOARD_FILE,BOARD_ST,BOARD_LOCK,
	BOARD_DATE,BOARD_UPDATE,PROD_NUM,CLIENT_NUM,BOARD_GROUPS,BOARD_STEP,BOARD_LEV,old_f_name, ADMIN_NUM;
	
	public String getOld_f_name() {
		return old_f_name;
	}

	public void setOld_f_name(String old_f_name) {
		this.old_f_name = old_f_name;
	}
	
	public String getADMIN_NUM() {
		return ADMIN_NUM;
	}

	public void setADMIN_NUM(String aDMIN_NUM) {
		ADMIN_NUM = aDMIN_NUM;
	}


	private MultipartFile file;

	public String getBOARD_NUM() {
		return BOARD_NUM;
	}

	public void setBOARD_NUM(String bOARD_NUM) {
		BOARD_NUM = bOARD_NUM;
	}

	public String getBOARD_TYPE() {
		return BOARD_TYPE;
	}

	public void setBOARD_TYPE(String bOARD_TYPE) {
		BOARD_TYPE = bOARD_TYPE;
	}

	public String getBOARD_SUBJECT() {
		return BOARD_SUBJECT;
	}

	public void setBOARD_SUBJECT(String bOARD_SUBJECT) {
		BOARD_SUBJECT = bOARD_SUBJECT;
	}

	public String getBOARD_WRITER() {
		return BOARD_WRITER;
	}

	public void setBOARD_WRITER(String bOARD_WRITER) {
		BOARD_WRITER = bOARD_WRITER;
	}

	public String getBOARD_CONTENT() {
		return BOARD_CONTENT;
	}

	public void setBOARD_CONTENT(String bOARD_CONTENT) {
		BOARD_CONTENT = bOARD_CONTENT;
	}

	public String getBOARD_FILE() {
		return BOARD_FILE;
	}

	public void setBOARD_FILE(String bOARD_FILE) {
		BOARD_FILE = bOARD_FILE;
	}

	public String getBOARD_ST() {
		return BOARD_ST;
	}

	public void setBOARD_ST(String bOARD_ST) {
		BOARD_ST = bOARD_ST;
	}

	public String getBOARD_LOCK() {
		return BOARD_LOCK;
	}

	public void setBOARD_LOCK(String bOARD_LOCK) {
		BOARD_LOCK = bOARD_LOCK;
	}

	public String getBOARD_DATE() {
		return BOARD_DATE;
	}

	public void setBOARD_DATE(String bOARD_DATE) {
		BOARD_DATE = bOARD_DATE;
	}

	public String getBOARD_UPDATE() {
		return BOARD_UPDATE;
	}

	public void setBOARD_UPDATE(String bOARD_UPDATE) {
		BOARD_UPDATE = bOARD_UPDATE;
	}

	public String getPROD_NUM() {
		return PROD_NUM;
	}

	public void setPROD_NUM(String pROD_NUM) {
		PROD_NUM = pROD_NUM;
	}

	public String getCLIENT_NUM() {
		return CLIENT_NUM;
	}

	public void setCLIENT_NUM(String cLIENT_NUM) {
		CLIENT_NUM = cLIENT_NUM;
	}

	public String getBOARD_GROUPS() {
		return BOARD_GROUPS;
	}

	public void setBOARD_GROUPS(String bOARD_GROUPS) {
		BOARD_GROUPS = bOARD_GROUPS;
	}

	public String getBOARD_STEP() {
		return BOARD_STEP;
	}

	public void setBOARD_STEP(String bOARD_STEP) {
		BOARD_STEP = bOARD_STEP;
	}

	public String getBOARD_LEV() {
		return BOARD_LEV;
	}

	public void setBOARD_LEV(String bOARD_LEV) {
		BOARD_LEV = bOARD_LEV;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	

}

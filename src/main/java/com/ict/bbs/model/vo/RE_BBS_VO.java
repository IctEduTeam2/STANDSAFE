package com.ict.bbs.model.vo;

import org.springframework.web.multipart.MultipartFile;

	public class RE_BBS_VO {
	private String RE_NUM, RE_SUBJECT, RE_WRITER, RE_CONTENT, RE_FILE,
	RE_TYPE, RE_HIT, RE_DATE, RE_UPDATE, RE_ST, RE_LOCK, PROD_NUM, CLIENT_NUM,
	old_f_name, PROD_NAME;
	private String RE_GROUPS, RE_STEP, RE_LEV;
	private MultipartFile file;

	
	
	
	
	public String getRE_GROUPS() {
		return RE_GROUPS;
	}

	public void setRE_GROUPS(String rE_GROUPS) {
		RE_GROUPS = rE_GROUPS;
	}

	public String getRE_STEP() {
		return RE_STEP;
	}

	public void setRE_STEP(String rE_STEP) {
		RE_STEP = rE_STEP;
	}

	public String getRE_LEV() {
		return RE_LEV;
	}

	public void setRE_LEV(String rE_LEV) {
		RE_LEV = rE_LEV;
	}

	public String getPROD_NAME() {
		return PROD_NAME;
	}

	public void setPROD_NAME(String pROD_NAME) {
		PROD_NAME = pROD_NAME;
	}

	public String getRE_NUM() {
		return RE_NUM;
	}

	public void setRE_NUM(String rE_NUM) {
		RE_NUM = rE_NUM;
	}

	public String getRE_SUBJECT() {
		return RE_SUBJECT;
	}

	public void setRE_SUBJECT(String rE_SUBJECT) {
		RE_SUBJECT = rE_SUBJECT;
	}

	public String getRE_WRITER() {
		return RE_WRITER;
	}

	public void setRE_WRITER(String rE_WRITER) {
		RE_WRITER = rE_WRITER;
	}

	public String getRE_CONTENT() {
		return RE_CONTENT;
	}

	public void setRE_CONTENT(String rE_CONTENT) {
		RE_CONTENT = rE_CONTENT;
	}

	public String getRE_FILE() {
		return RE_FILE;
	}

	public void setRE_FILE(String rE_FILE) {
		RE_FILE = rE_FILE;
	}

	public String getRE_TYPE() {
		return RE_TYPE;
	}

	public void setRE_TYPE(String rE_TYPE) {
		RE_TYPE = rE_TYPE;
	}

	public String getRE_HIT() {
		return RE_HIT;
	}

	public void setRE_HIT(String rE_HIT) {
		RE_HIT = rE_HIT;
	}

	public String getRE_DATE() {
		return RE_DATE;
	}

	public void setRE_DATE(String rE_DATE) {
		RE_DATE = rE_DATE;
	}

	public String getRE_UPDATE() {
		return RE_UPDATE;
	}

	public void setRE_UPDATE(String rE_UPDATE) {
		RE_UPDATE = rE_UPDATE;
	}

	public String getRE_ST() {
		return RE_ST;
	}

	public void setRE_ST(String rE_ST) {
		RE_ST = rE_ST;
	}

	public String getRE_LOCK() {
		return RE_LOCK;
	}

	public void setRE_LOCK(String rE_LOCK) {
		RE_LOCK = rE_LOCK;
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

	public String getOld_f_name() {
		return old_f_name;
	}

	public void setOld_f_name(String old_f_name) {
		this.old_f_name = old_f_name;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
	
}

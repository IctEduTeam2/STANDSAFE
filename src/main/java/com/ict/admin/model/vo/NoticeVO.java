package com.ict.admin.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {

	private String NOTICE_NUM, NOTICE_SUBJECT, NOTICE_TYPE, NOTICE_WRITER, NOTICE_CONTENT, NOTICE_HIT,
					NOTICE_DATE, NOTICE_UPDATE, NOTICE_ST, NOTICE_FILE, ADMIN_NUM, ADMIN_NAME, old_f_name;
	
	

	private MultipartFile file;

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	
	
	public String getADMIN_NAME() {
		return ADMIN_NAME;
	}

	public void setADMIN_NAME(String aDMIN_NAME) {
		ADMIN_NAME = aDMIN_NAME;
	}

	public String getOld_f_name() {
		return old_f_name;
	}

	public void setOld_f_name(String old_f_name) {
		this.old_f_name = old_f_name;
	}

	public String getNOTICE_NUM() {
		return NOTICE_NUM;
	}

	public void setNOTICE_NUM(String nOTICE_NUM) {
		NOTICE_NUM = nOTICE_NUM;
	}

	public String getNOTICE_SUBJECT() {
		return NOTICE_SUBJECT;
	}

	public void setNOTICE_SUBJECT(String nOTICE_SUBJECT) {
		NOTICE_SUBJECT = nOTICE_SUBJECT;
	}

	public String getNOTICE_TYPE() {
		return NOTICE_TYPE;
	}

	public void setNOTICE_TYPE(String nOTICE_TYPE) {
		NOTICE_TYPE = nOTICE_TYPE;
	}

	public String getNOTICE_WRITER() {
		return NOTICE_WRITER;
	}

	public void setNOTICE_WRITER(String nOTICE_WRITER) {
		NOTICE_WRITER = nOTICE_WRITER;
	}

	public String getNOTICE_CONTENT() {
		return NOTICE_CONTENT;
	}

	public void setNOTICE_CONTENT(String nOTICE_CONTENT) {
		NOTICE_CONTENT = nOTICE_CONTENT;
	}

	public String getNOTICE_HIT() {
		return NOTICE_HIT;
	}

	public void setNOTICE_HIT(String nOTICE_HIT) {
		NOTICE_HIT = nOTICE_HIT;
	}

	public String getNOTICE_DATE() {
		return NOTICE_DATE;
	}

	public void setNOTICE_DATE(String nOTICE_DATE) {
		NOTICE_DATE = nOTICE_DATE;
	}

	public String getNOTICE_UPDATE() {
		return NOTICE_UPDATE;
	}

	public void setNOTICE_UPDATE(String nOTICE_UPDATE) {
		NOTICE_UPDATE = nOTICE_UPDATE;
	}

	public String getNOTICE_ST() {
		return NOTICE_ST;
	}

	public void setNOTICE_ST(String nOTICE_ST) {
		NOTICE_ST = nOTICE_ST;
	}

	public String getNOTICE_FILE() {
		return NOTICE_FILE;
	}

	public void setNOTICE_FILE(String nOTICE_FILE) {
		NOTICE_FILE = nOTICE_FILE;
	}

	public String getADMIN_NUM() {
		return ADMIN_NUM;
	}

	public void setADMIN_NUM(String aDMIN_NUM) {
		ADMIN_NUM = aDMIN_NUM;
	}


		
}

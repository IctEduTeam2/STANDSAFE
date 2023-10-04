package com.ict.admin.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class PopUpSVO {
	private String POPUP_NUM, POPUP_IMG, POPUP_CHK, POPUP_ADDR, POPUP_ST,ADMIN_NUM,
	POPUP_FILE, POPUP_WRITER;
	
	public String getPOPUP_WRITER() {
		return POPUP_WRITER;
	}

	public void setPOPUP_WRITER(String pOPUP_WRITER) {
		POPUP_WRITER = pOPUP_WRITER;
	}

	private MultipartFile file;

	public String getPOPUP_NUM() {
		return POPUP_NUM;
	}

	public void setPOPUP_NUM(String pOPUP_NUM) {
		POPUP_NUM = pOPUP_NUM;
	}

	public String getPOPUP_IMG() {
		return POPUP_IMG;
	}

	public void setPOPUP_IMG(String pOPUP_IMG) {
		POPUP_IMG = pOPUP_IMG;
	}

	public String getPOPUP_CHK() {
		return POPUP_CHK;
	}

	public void setPOPUP_CHK(String pOPUP_CHK) {
		POPUP_CHK = pOPUP_CHK;
	}

	public String getPOPUP_ADDR() {
		return POPUP_ADDR;
	}

	public void setPOPUP_ADDR(String pOPUP_ADDR) {
		POPUP_ADDR = pOPUP_ADDR;
	}

	public String getPOPUP_ST() {
		return POPUP_ST;
	}

	public void setPOPUP_ST(String pOPUP_ST) {
		POPUP_ST = pOPUP_ST;
	}

	public String getADMIN_NUM() {
		return ADMIN_NUM;
	}

	public void setADMIN_NUM(String aDMIN_NUM) {
		ADMIN_NUM = aDMIN_NUM;
	}

	public String getPOPUP_FILE() {
		return POPUP_FILE;
	}

	public void setPOPUP_FILE(String pOPUP_FILE) {
		POPUP_FILE = pOPUP_FILE;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}


	
}

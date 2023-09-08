package com.ict.admin.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class ExchangeVO {
	private String PB_NUM, PB_CONTENT, PB_DP, PB_FILE, PB_DATE, PB_ST, CLIENT_NUM, PAY_NUM;
	
	private MultipartFile file;

	public String getPB_NUM() {
		return PB_NUM;
	}

	public void setPB_NUM(String pB_NUM) {
		PB_NUM = pB_NUM;
	}

	public String getPB_CONTENT() {
		return PB_CONTENT;
	}

	public void setPB_CONTENT(String pB_CONTENT) {
		PB_CONTENT = pB_CONTENT;
	}

	public String getPB_DP() {
		return PB_DP;
	}

	public void setPB_DP(String pB_DP) {
		PB_DP = pB_DP;
	}

	public String getPB_FILE() {
		return PB_FILE;
	}

	public void setPB_FILE(String pB_FILE) {
		PB_FILE = pB_FILE;
	}

	public String getPB_DATE() {
		return PB_DATE;
	}

	public void setPB_DATE(String pB_DATE) {
		PB_DATE = pB_DATE;
	}

	public String getPB_ST() {
		return PB_ST;
	}

	public void setPB_ST(String pB_ST) {
		PB_ST = pB_ST;
	}

	public String getCLIENT_NUM() {
		return CLIENT_NUM;
	}

	public void setCLIENT_NUM(String cLIENT_NUM) {
		CLIENT_NUM = cLIENT_NUM;
	}

	public String getPAY_NUM() {
		return PAY_NUM;
	}

	public void setPAY_NUM(String pAY_NUM) {
		PAY_NUM = pAY_NUM;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
}

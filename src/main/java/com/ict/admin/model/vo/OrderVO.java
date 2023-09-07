package com.ict.admin.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class OrderVO {
	private String PAY_NUM, TAKE_PEO, TAKE_ADDR, TAKE_PHONE, TAKE_MEMO, PAY_TYPE, 
	PAY_CARD, PAY_OK, PAY_OKNUM, PAY_ST, CART_NUM, CLIENT_NUM;
	
	private MultipartFile file;

	public String getPAY_NUM() {
		return PAY_NUM;
	}

	public void setPAY_NUM(String pAY_NUM) {
		PAY_NUM = pAY_NUM;
	}

	public String getTAKE_PEO() {
		return TAKE_PEO;
	}

	public void setTAKE_PEO(String tAKE_PEO) {
		TAKE_PEO = tAKE_PEO;
	}

	public String getTAKE_ADDR() {
		return TAKE_ADDR;
	}

	public void setTAKE_ADDR(String tAKE_ADDR) {
		TAKE_ADDR = tAKE_ADDR;
	}

	public String getTAKE_PHONE() {
		return TAKE_PHONE;
	}

	public void setTAKE_PHONE(String tAKE_PHONE) {
		TAKE_PHONE = tAKE_PHONE;
	}

	public String getTAKE_MEMO() {
		return TAKE_MEMO;
	}

	public void setTAKE_MEMO(String tAKE_MEMO) {
		TAKE_MEMO = tAKE_MEMO;
	}

	public String getPAY_TYPE() {
		return PAY_TYPE;
	}

	public void setPAY_TYPE(String pAY_TYPE) {
		PAY_TYPE = pAY_TYPE;
	}

	public String getPAY_CARD() {
		return PAY_CARD;
	}

	public void setPAY_CARD(String pAY_CARD) {
		PAY_CARD = pAY_CARD;
	}

	public String getPAY_OK() {
		return PAY_OK;
	}

	public void setPAY_OK(String pAY_OK) {
		PAY_OK = pAY_OK;
	}

	public String getPAY_OKNUM() {
		return PAY_OKNUM;
	}

	public void setPAY_OKNUM(String pAY_OKNUM) {
		PAY_OKNUM = pAY_OKNUM;
	}

	public String getPAY_ST() {
		return PAY_ST;
	}

	public void setPAY_ST(String pAY_ST) {
		PAY_ST = pAY_ST;
	}

	public String getCART_NUM() {
		return CART_NUM;
	}

	public void setCART_NUM(String cART_NUM) {
		CART_NUM = cART_NUM;
	}

	public String getCLIENT_NUM() {
		return CLIENT_NUM;
	}

	public void setCLIENT_NUM(String cLIENT_NUM) {
		CLIENT_NUM = cLIENT_NUM;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
}

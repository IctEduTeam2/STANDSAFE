package com.ict.admin.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class InventoryVO {
	private String PROD_NUM, PROD_NAME, PROD_IMG, PROD_DETAIL, PROD_AMOUNT, 
	PROD_PRICE, PROD_SALE, PROD_HIGH, PROD_LOW, PROD_REGDATE, PROD_ST, PROD_MODIFYDATE;
	
	private MultipartFile file;
	
	public String getPROD_MODIFYDATE() {
		return PROD_MODIFYDATE;
	}

	public void setPROD_MODIFYDATE(String pROD_MODIFYDATE) {
		PROD_MODIFYDATE = pROD_MODIFYDATE;
	}

	public String getPROD_NUM() {
		return PROD_NUM;
	}

	public void setPROD_NUM(String pROD_NUM) {
		PROD_NUM = pROD_NUM;
	}

	public String getPROD_NAME() {
		return PROD_NAME;
	}

	public void setPROD_NAME(String pROD_NAME) {
		PROD_NAME = pROD_NAME;
	}

	public String getPROD_IMG() {
		return PROD_IMG;
	}

	public void setPROD_IMG(String pROD_IMG) {
		PROD_IMG = pROD_IMG;
	}

	public String getPROD_DETAIL() {
		return PROD_DETAIL;
	}

	public void setPROD_DETAIL(String pROD_DETAIL) {
		PROD_DETAIL = pROD_DETAIL;
	}

	public String getPROD_AMOUNT() {
		return PROD_AMOUNT;
	}

	public void setPROD_AMOUNT(String pROD_AMOUNT) {
		PROD_AMOUNT = pROD_AMOUNT;
	}

	public String getPROD_PRICE() {
		return PROD_PRICE;
	}

	public void setPROD_PRICE(String pROD_PRICE) {
		PROD_PRICE = pROD_PRICE;
	}

	public String getPROD_SALE() {
		return PROD_SALE;
	}

	public void setPROD_SALE(String pROD_SALE) {
		PROD_SALE = pROD_SALE;
	}

	public String getPROD_HIGH() {
		return PROD_HIGH;
	}

	public void setPROD_HIGH(String pROD_HIGH) {
		PROD_HIGH = pROD_HIGH;
	}

	public String getPROD_LOW() {
		return PROD_LOW;
	}

	public void setPROD_LOW(String pROD_LOW) {
		PROD_LOW = pROD_LOW;
	}

	public String getPROD_REGDATE() {
		return PROD_REGDATE;
	}

	public void setPROD_REGDATE(String pROD_REGDATE) {
		PROD_REGDATE = pROD_REGDATE;
	}

	public String getPROD_ST() {
		return PROD_ST;
	}

	public void setPROD_ST(String pROD_ST) {
		PROD_ST = pROD_ST;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
}

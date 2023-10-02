package com.ict.admin.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class ExchangeVO {
	private String PB_NUM, PB_CONTENT, PB_DP, PB_FILE, PB_DATE, PB_ST, CLIENT_NUM, PAY_NUM, PAY_OKNUM, CONFIRM_ID, PB_TITLE, PROD_NUM, PAY_MONEY;
	private OrderVO orderVo;
	private ProductVO productVO;
	
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

	public String getPAY_OKNUM() {
		return PAY_OKNUM;
	}

	public void setPAY_OKNUM(String pAY_OKNUM) {
		PAY_OKNUM = pAY_OKNUM;
	}

	public String getCONFIRM_ID() {
		return CONFIRM_ID;
	}

	public void setCONFIRM_ID(String cONFIRM_ID) {
		CONFIRM_ID = cONFIRM_ID;
	}

	public String getPB_TITLE() {
		return PB_TITLE;
	}

	public void setPB_TITLE(String pB_TITLE) {
		PB_TITLE = pB_TITLE;
	}

	public String getPROD_NUM() {
		return PROD_NUM;
	}

	public void setPROD_NUM(String pROD_NUM) {
		PROD_NUM = pROD_NUM;
	}

	public String getPAY_MONEY() {
		return PAY_MONEY;
	}

	public void setPAY_MONEY(String pAY_MONEY) {
		PAY_MONEY = pAY_MONEY;
	}

	public OrderVO getOrderVo() {
		return orderVo;
	}

	public void setOrderVo(OrderVO orderVo) {
		this.orderVo = orderVo;
	}

	public ProductVO getProductVO() {
		return productVO;
	}

	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	
	
}

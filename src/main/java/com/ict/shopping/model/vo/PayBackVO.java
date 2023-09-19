package com.ict.shopping.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class PayBackVO {
	String pb_num, pb_title, pb_content, pb_dp, pb_file, pb_date, pb_st, client_num, pay_oknum, prod_num;
	MultipartFile file;
	
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getPb_title() {
		return pb_title;
	}

	public void setPb_title(String pb_title) {
		this.pb_title = pb_title;
	}

	public String getProd_num() {
		return prod_num;
	}

	public void setProd_num(String prod_num) {
		this.prod_num = prod_num;
	}

	public String getPb_num() {
		return pb_num;
	}

	public void setPb_num(String pb_num) {
		this.pb_num = pb_num;
	}

	public String getPb_content() {
		return pb_content;
	}

	public void setPb_content(String pb_content) {
		this.pb_content = pb_content;
	}

	public String getPb_dp() {
		return pb_dp;
	}

	public void setPb_dp(String pb_dp) {
		this.pb_dp = pb_dp;
	}

	public String getPb_file() {
		return pb_file;
	}

	public void setPb_file(String pb_file) {
		this.pb_file = pb_file;
	}

	public String getPb_date() {
		return pb_date;
	}

	public void setPb_date(String pb_date) {
		this.pb_date = pb_date;
	}

	public String getPb_st() {
		return pb_st;
	}

	public void setPb_st(String pb_st) {
		this.pb_st = pb_st;
	}

	public String getClient_num() {
		return client_num;
	}

	public void setClient_num(String client_num) {
		this.client_num = client_num;
	}

	public String getPay_oknum() {
		return pay_oknum;
	}

	public void setPay_oknum(String pay_oknum) {
		this.pay_oknum = pay_oknum;
	}
}

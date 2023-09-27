package com.ict.shopping.model.vo;

public class PayVO {
	private String pay_method, pay_card_type, pay_num, take_peo, take_addr, take_phone, take_memo, pay_type, pay_card, pay_ok, prod_img, pay_oknum, pay_st, cart_num, client_num, paymentKey;
	private int pay_money, limit, offset;
	private long pay_installmentPlanMonths;
	
	
	public String getPay_method() {
		return pay_method;
	}

	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

	public String getPay_card_type() {
		return pay_card_type;
	}

	public void setPay_card_type(String pay_card_type) {
		this.pay_card_type = pay_card_type;
	}


	public long getPay_installmentPlanMonths() {
		return pay_installmentPlanMonths;
	}

	public void setPay_installmentPlanMonths(long pay_installmentPlanMonths) {
		this.pay_installmentPlanMonths = pay_installmentPlanMonths;
	}

	public int getPay_money() {
		return pay_money;
	}

	public void setPay_money(int pay_money) {
		this.pay_money = pay_money;
	}

	public String getPay_num() {
		return pay_num;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public String getProd_img() {
		return prod_img;
	}

	public void setProd_img(String prod_img) {
		this.prod_img = prod_img;
	}

	public String getPaymentKey() {
		return paymentKey;
	}

	public void setPaymentKey(String paymentKey) {
		this.paymentKey = paymentKey;
	}

	public void setPay_num(String pay_num) {
		this.pay_num = pay_num;
	}

	public String getTake_peo() {
		return take_peo;
	}

	public void setTake_peo(String take_peo) {
		this.take_peo = take_peo;
	}

	public String getTake_addr() {
		return take_addr;
	}

	public void setTake_addr(String take_addr) {
		this.take_addr = take_addr;
	}

	public String getTake_phone() {
		return take_phone;
	}

	public void setTake_phone(String take_phone) {
		this.take_phone = take_phone;
	}

	public String getTake_memo() {
		return take_memo;
	}

	public void setTake_memo(String take_memo) {
		this.take_memo = take_memo;
	}

	public String getPay_type() {
		return pay_type;
	}

	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}

	public String getPay_card() {
		return pay_card;
	}

	public void setPay_card(String pay_card) {
		this.pay_card = pay_card;
	}

	public String getPay_ok() {
		return pay_ok;
	}

	public void setPay_ok(String pay_ok) {
		this.pay_ok = pay_ok;
	}

	public String getPay_oknum() {
		return pay_oknum;
	}

	public void setPay_oknum(String pay_oknum) {
		this.pay_oknum = pay_oknum;
	}

	public String getPay_st() {
		return pay_st;
	}

	public void setPay_st(String pay_st) {
		this.pay_st = pay_st;
	}

	public String getCart_num() {
		return cart_num;
	}

	public void setCart_num(String cart_num) {
		this.cart_num = cart_num;
	}

	public String getClient_num() {
		return client_num;
	}

	public void setClient_num(String client_num) {
		this.client_num = client_num;
	}
	
}

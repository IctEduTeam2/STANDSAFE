package com.ict.statistics.model.vo;

import java.math.BigDecimal;
import java.util.Date;

public class SalesSummaryVO {
    private Date report_date; // 일자
    private int order_count;  // 주문수
    private int total_revenue; // 매출액
    private int visitor_count; // 방문자
    private int join_count;  // 가입자
    private int inquiry_count; // 문의
    private int review_count;  // 후기
    
    private String PROD_IMG; // 섬네일
    private String PROD_NAME; // 상품 이름
    private int REVENUE; // 매출액
    
    private Date salesDate;
    private Integer productCategory;
    private BigDecimal dailyRevenue;
    
    
	public Date getSalesDate() {
		return salesDate;
	}
	public void setSalesDate(Date salesDate) {
		this.salesDate = salesDate;
	}
	public Integer getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(Integer productCategory) {
		this.productCategory = productCategory;
	}
	public BigDecimal getDailyRevenue() {
		return dailyRevenue;
	}
	public void setDailyRevenue(BigDecimal dailyRevenue) {
		this.dailyRevenue = dailyRevenue;
	}
	public Date getReport_date() {
		return report_date;
	}
	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
	public int getOrder_count() {
		return order_count;
	}
	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}
	public int getTotal_revenue() {
		return total_revenue;
	}
	public void setTotal_revenue(int total_revenue) {
		this.total_revenue = total_revenue;
	}
	public int getVisitor_count() {
		return visitor_count;
	}
	public void setVisitor_count(int visitor_count) {
		this.visitor_count = visitor_count;
	}
	public int getJoin_count() {
		return join_count;
	}
	public void setJoin_count(int join_count) {
		this.join_count = join_count;
	}
	public int getInquiry_count() {
		return inquiry_count;
	}
	public void setInquiry_count(int inquiry_count) {
		this.inquiry_count = inquiry_count;
	}
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	public String getPROD_IMG() {
		return PROD_IMG;
	}
	public void setPROD_IMG(String pROD_IMG) {
		PROD_IMG = pROD_IMG;
	}
	public String getPROD_NAME() {
		return PROD_NAME;
	}
	public void setPROD_NAME(String pROD_NAME) {
		PROD_NAME = pROD_NAME;
	}
	public int getREVENUE() {
		return REVENUE;
	}
	public void setREVENUE(int rEVENUE) {
		REVENUE = rEVENUE;
	}
    
	
    
    
}
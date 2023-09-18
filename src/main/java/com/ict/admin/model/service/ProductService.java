package com.ict.admin.model.service;

import java.util.List;

import com.ict.admin.model.vo.ExchangeVO;
import com.ict.admin.model.vo.InventoryVO;
import com.ict.admin.model.vo.OrderVO;
import com.ict.admin.model.vo.ProductVO;
import com.ict.admin.model.vo.ReturnVO;

public interface ProductService {
	// 상품리스트
	public List<ProductVO> getProductList();
	// 재고 리스트
	public List<InventoryVO> getInventoryList();
	// 교환 리스트
	public List<ExchangeVO> getExchangeList();
	// 교환 상세페이지
	ExchangeVO getExchangeOneList(String pb_num);
	// 반품 리스트
	public List<ReturnVO> getReturnList();
	// 반품 상세페이지
	ReturnVO getReturnOneList(String pb_num);
	// 주문 리스트
	public List<OrderVO> getOrderList();
	// 주문 상세페이지
	public List<OrderVO> getOrderDetaileList(String client_num);
	// 상품 등록
	int getProductInsert(ProductVO provo);
	//상품 홈페이지 등록
	int productUpdate(String select);
	
}

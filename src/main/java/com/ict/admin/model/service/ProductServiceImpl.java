package com.ict.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.admin.model.dao.ProductDAO;
import com.ict.admin.model.vo.ExchangeVO;
import com.ict.admin.model.vo.InventoryVO;
import com.ict.admin.model.vo.OrderVO;
import com.ict.admin.model.vo.ProductVO;
import com.ict.admin.model.vo.ReturnVO;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	 ProductDAO productDAO;
	// 상품리스트
	@Override
	public List<ProductVO> getProductList() {		
		return productDAO.getProductList();
	}
	// 교환리스트
	@Override
	public List<ExchangeVO> getExchangeList() {	
		return productDAO.getExchangeList();
	}
	// 교환상세보기
	@Override
	public ExchangeVO getExchangeOneList(String pb_num) {
		return productDAO.getExchangeOneList(pb_num);	
	}
	// 재고리스트
	@Override
	public List<InventoryVO> getInventoryList() {
		return productDAO.getInventoryList();
	}
	// 반품 리스트
	@Override
	public List<ReturnVO> getReturnList() {
		return productDAO.getReturnList();
	}
	// 반품 상세보기
	@Override
	public ReturnVO getReturnOneList(String pb_num) {
		return productDAO.getReturnOneList(pb_num);
	}
	// 주문 리스트
	@Override
	public List<OrderVO> getOrderList() {
		return productDAO.getOrderList();
	}
	// 주문 상세보기
	@Override
	public List<OrderVO> getOrderDetaileList(String client_num) {
		return productDAO.getOrderDetaileList(client_num);
	}
	// 상품등록
	@Override
	public int getProductInsert(ProductVO provo) {
		return productDAO.getgetProductInsert(provo);
	}
	
}

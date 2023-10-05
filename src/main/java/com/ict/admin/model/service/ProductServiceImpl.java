package com.ict.admin.model.service;

import java.util.List;
import java.util.Map;

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
	// 검색 리스트 총 갯수 
	@Override
	public int getTotalCountSearchList(Map<String, Object> map) {
		return productDAO.getTotalCountSearchList(map);
	}


	// 상품 리스트 검색 
	@Override
    public List<ProductVO> getProductSearchList(Map<String, Object> map, int offset, int limit) {
        return productDAO.getProductSearchList(map, offset, limit);
    }
	
	// 교환/반품 리스트
	@Override
	public List<ExchangeVO> getExchangeList(int offset, int limit) {	
		return productDAO.getExchangeList(offset, limit);
	}
	// 교환/반품 총 게시글 수 
	@Override
	public int getTotalExchangeCount() {
		return productDAO.getTotalExchangeCount();
	}	
	
	// 교환/ 반품 총 게시글 수 -검색 
	@Override
	public int getTotalExchangeCountSearchList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return productDAO.getTotalExchangeCountSearchList(map);
	}
	
	// 교환상세보기
	@Override
	public ExchangeVO getExchangeOneList(String payOkNum) {
		return productDAO.getExchangeOneList(payOkNum);	
	}

	// 교환 / 반품 상태 업데이트 
	@Override
	public int getExchangeUpdate(ExchangeVO evo) {
		return productDAO.exchangeStateUpdate(evo);
	}
	// 재고리스트
	@Override
	public List<InventoryVO> getInventoryList() {
		return productDAO.getInventoryList();
	}
	
	// 재고관리 리스트 - 검색 리스트 총 수 
	@Override
	public int getTotalInventorySearchCount(Map<String, Object> map) {
		return productDAO.getTotalInventorySearchCount(map);
	}
		
	// 재고관리 리스트 - 검색 
	@Override
	public List<InventoryVO> getInventorySearchList(Map<String, Object> map, int offset, int limit) {
		return productDAO.getInventorySearchList(map, offset, limit);
	}
	
	// 재고수정 페이지 
	@Override
	public InventoryVO getInventoryOneList(String prod_num) {
		return productDAO.getInventoryOneList(prod_num);
	}
	
	// 재고 수정 
	@Override
	public int inventoryUpdate(InventoryVO invo) {
		return productDAO.inventoryUpdate(invo);
	}
	
	// 재고 삭제 
	@Override
	public int deleteSelectProduct(String prod_num) {
		return productDAO.deleteSelectProduct(prod_num);
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
	public List<OrderVO> getOrderDetaileList(String pay_oknum) {
		return productDAO.getOrderDetaileList(pay_oknum);
	}
	@Override
	public int getDeliupdate(String payOkNum, String msg) {
		return productDAO.getDeliupdate(payOkNum,msg);
	}
	// 상품등록
	@Override
	public int getProductInsert(ProductVO provo) {
		return productDAO.getProductInsert(provo);
	}
	
	// 상품 사용자 홈페이지 반영 
	@Override
	public int productUpdate(String select) {
		return productDAO.productUpdate(select);
	}
	
	// 상품삭제 
	@Override
	public int productDelete(String select) {
		return productDAO.productDelete(select);
	}
	
	// 반품 상태 업데이트 
	@Override
	public int getReturnStateUpdate(ReturnVO rvo) {
		return productDAO.returnStateUpdate(rvo);
	}
	@Override
	public ProductVO getProductByProdNum(String prod_num) {
		  return productDAO.getProductByProdNum(prod_num);
	}
	@Override
	public void updateProduct(ProductVO provo) {
		productDAO.updateProduct(provo);
		
	}
	@Override
	public int getTotalProductCount() {
		return productDAO.getTotalProductCount();
	}
	@Override
	public List<ProductVO> getProductList(int offset, int limit) {
		return productDAO.getProductList(offset, limit );
	}
	@Override
	public int getTotalInventoryCount() {
		return productDAO.getTotalInventoryCount(); 
	}
	@Override
	public List<InventoryVO> getInventoryManagement(int offset, int limit) {
		return productDAO.getInventoryManagement(offset, limit );
	}
	@Override
	public int getTotalOrderCount() {
		return productDAO.getTotalOrderCount(); 
	}
	@Override
	public List<OrderVO> getOrderList(int offset, int limit) {
		return productDAO.getOrderList(offset, limit );
	}
	@Override
	public int getTotalOrderSearchCount(Map<String, Object> map) {
		
		return productDAO.getTotalOrderSearchCount(map);
	}
	@Override
	public List<OrderVO> getOrderSearchList(Map<String, Object> map, int offset, int limit) {
		return productDAO.getOrderSearchList(map,offset,limit);
	}
	@Override
	public int getOrderUpdate(OrderVO ovo) {
		return productDAO.getOrderUpdate(ovo);
	}
	// 교환/반품 검색 게시글 
	@Override
	public List<ExchangeVO> getExchangeSearchList(Map<String, Object> map, int offset, int limit) {
		return productDAO.getExchangeSearchList(map, offset, limit);
	}
	
}

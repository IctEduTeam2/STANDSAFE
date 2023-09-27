package com.ict.admin.model.service;

import java.util.List;
import java.util.Map;

import com.ict.admin.model.vo.ExchangeVO;
import com.ict.admin.model.vo.InventoryVO;
import com.ict.admin.model.vo.OrderVO;
import com.ict.admin.model.vo.ProductVO;
import com.ict.admin.model.vo.ReturnVO;
import com.ict.bbs.model.vo.NO_BBS_VO;

public interface ProductService {
	// 상품리스트
	public List<ProductVO> getProductList();
	//페이징을 위한 전체게시물 구하기
	public int getTotalProductCount();
	//시작과 끝 블럭 구하기
	public List<ProductVO> getProductList(int offset, int limit);
	// 재고 리스트
	public List<InventoryVO> getInventoryList();
	//페이징을 위한 전체게시물 구하기
	public int getTotalInventoryCount();
	//시작과 끝 블럭 구하기
	public List<InventoryVO> getInventoryManagement(int offset, int limit);
	
	// 상품 검색 리스트 수 
	public int getTotalCountSearchList(Map<String, Object> map);
	
	// 상품 검색 리스트 
	public List<ProductVO> getProductSearchList(Map<String, Object> map, int offset, int limit);
	
    
	ProductVO getProductByProdNum(String prod_num);
    
    // 재고 물품 상세보기 
    InventoryVO getInventoryOneList(String prod_num);
    
    // 재고 물품 검색 리스트 수 
    public int getTotalInventorySearchCount(Map<String, Object> map);
    
    public List<InventoryVO> getInventorySearchList(Map<String, Object> map, int offset, int limit);
    
    // 재고 수정 
    int inventoryUpdate(InventoryVO invo);
    
    // 재고 삭제  
    int deleteSelectProduct(String prod_num);
    
    void updateProduct(ProductVO provo);
	
	// 교환 리스트
	public List<ExchangeVO> getExchangeList();
	// 교환 상세페이지
	ExchangeVO getExchangeOneList(String client_num);
	// 교환 상태 업데이트 
	int getExchangeUpdate(ExchangeVO evo);
	// 반품 리스트
	public List<ReturnVO> getReturnList();
	// 반품 상세페이지
	ReturnVO getReturnOneList(String pb_num);
	// 주문 리스트
	public List<OrderVO> getOrderList();
	// 주문 검색
	public int getTotalOrderSearchCount(Map<String, Object> map);
	    
	public List<OrderVO> getOrderSearchList(Map<String, Object> map, int offset, int limit);
	//페이징을 위한 전체게시물 구하기
	public int getTotalOrderCount();
	//시작과 끝 블럭 구하기
	public List<OrderVO> getOrderList(int offset, int limit);
	// 주문 상세페이지
	public List<OrderVO> getOrderDetaileList(String pay_num);
	// 주문 상태 업데트
	int getOrderUpdate(OrderVO ovo);
	// 상품 등록
	int getProductInsert(ProductVO provo);
	//상품 홈페이지 등록
	int productUpdate(String select);
	//상품 삭제 
	int productDelete(String select);
	// 반품 상태 업데이트 
	int getReturnStateUpdate(ReturnVO rvo);

	
}

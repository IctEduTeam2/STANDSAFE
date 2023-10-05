package com.ict.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.admin.model.vo.ExchangeVO;
import com.ict.admin.model.vo.InventoryVO;
import com.ict.admin.model.vo.OrderVO;
import com.ict.admin.model.vo.ProductVO;
import com.ict.admin.model.vo.ReturnVO;

@Repository
public class ProductDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 상품리스트
	public List<ProductVO> getProductList() {
		return sqlSessionTemplate.selectList("mag.productlist");
	}

	public int getTotalProductCount() {
		return sqlSessionTemplate.selectOne("mag.productcount");
	}

	public List<ProductVO> getProductList(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("mag.productlist", map);

	}

	// 상품리스트 검색
	public int getTotalCountSearchList(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("mag.getTotalCountSearchList", map);
	}

	public List<ProductVO> getProductSearchList(Map<String, Object> map, int offset, int limit) {
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("mag.getProductSearchList", map);
	}

	// 교환리스트
	public List<ExchangeVO> getExchangeList(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("mag.exchangelist", map);
	}

	// 재고리스트
	public List<InventoryVO> getInventoryList() {
		return sqlSessionTemplate.selectList("mag.inventorylist");
	}

	public int getTotalInventoryCount() {
		return sqlSessionTemplate.selectOne("mag.inventorycount");
	}

	public List<InventoryVO> getInventoryManagement(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("mag.inventorymanagement", map);

	}

	// 재고관리 리스트 - 검색 리스트 총 수
	public int getTotalInventorySearchCount(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("mag.getTotalInventorySearchCount", map);
	}

	// 재고관리 리스트 - 검색
	public List<InventoryVO> getInventorySearchList(Map<String, Object> map, int offset, int limit) {
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("mag.getInventorySearchList", map);
	}

	// 재고 수정 페이지
	public InventoryVO getInventoryOneList(String prod_num) {
		return sqlSessionTemplate.selectOne("mag.getInventoryOneList", prod_num);
	}

	// 재고 수정
	public int inventoryUpdate(InventoryVO invo) {
		return sqlSessionTemplate.update("mag.inventoryUpdate", invo);
	}

	// 재고 삭제
	public int deleteSelectProduct(String prod_num) {
		return sqlSessionTemplate.update("mag.deleteSelectProduct", prod_num);
	}

	// 상품 번호를 기반으로 상품 정보를 가져오는 메서드
	public ProductVO getProductByProdNum(String prod_num) {
		return sqlSessionTemplate.selectOne("mag.getProductByProdNum", prod_num);
	}

	// 상품 정보를 업데이트하는 메서드
	public void updateProduct(ProductVO provo) {
		sqlSessionTemplate.update("mag.updateProduct", provo);
	}

	// 교환/반품 게시글 총 수 구하기 
	public int getTotalExchangeCount() {
		return sqlSessionTemplate.selectOne("mag.getTotalExchangeCount");
	}
	
	// 교환 / 반품 게시글 총 수 - 검색 
	public int getTotalExchangeCountSearchList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("mag.getTotalExchangeCountSearchList", map);
	}
	
	// 교환상세보기
	public ExchangeVO getExchangeOneList(String payOkNum) {
		ExchangeVO evo2 = sqlSessionTemplate.selectOne("mag.exchangeonelist", payOkNum);
		return evo2;
	}

	// 교환 / 반품 상태 업데이트
	public int exchangeStateUpdate(ExchangeVO evo) {
		return sqlSessionTemplate.update("mag.exchangestateupdate", evo);
	}

	// 반품리스트
	public List<ReturnVO> getReturnList() {
		return sqlSessionTemplate.selectList("mag.returnlist");
	}

	// 반품상세보기
	public ReturnVO getReturnOneList(String pb_num) {
		ReturnVO rvo2 = sqlSessionTemplate.selectOne("mag.returnonelist", pb_num);
		return rvo2;
	}

	// 주문리스트
	public List<OrderVO> getOrderList() {
		return sqlSessionTemplate.selectList("mag.orderlist");
	}

	public int getTotalOrderCount() {
		return sqlSessionTemplate.selectOne("mag.ordercount");
	}

	public List<OrderVO> getOrderList(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("mag.orderlist", map);

	}

	// 주문관리 리스트 - 검색 리스트 총 수
	public int getTotalOrderSearchCount(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("mag.getTotalOrederSearchCount", map);
	}

	// 주문관리 리스트 - 검색
	public List<OrderVO> getOrderSearchList(Map<String, Object> map, int offset, int limit) {
		map.put("limit", limit);
		map.put("offset", offset);
		System.out.println("stDate :::" + map.get("stDate"));
		System.out.println("endDate :::" + map.get("endDate"));
		return sqlSessionTemplate.selectList("mag.getOrederSearchList", map);
	}

	// 주문 상세보기
	public List<OrderVO> getOrderDetaileList(String pay_oknum) {
		return sqlSessionTemplate.selectList("mag.orderonelist", pay_oknum);
	}
	public int getOrderUpdate(OrderVO ovo) {
		return sqlSessionTemplate.update("mag.orderupdate", ovo);
	}
	public int getDeliupdate(String payOkNum,String msg) {
		Map<String, String>params = new HashMap<String, String>();
		params.put("payOkNum", payOkNum);
		params.put("msg", msg);
		return sqlSessionTemplate.update("mag.deliup", params);
	}

	public int getProductInsert(ProductVO provo) {
		return sqlSessionTemplate.insert("mag.productinsert", provo);
	}

	public int productUpdate(String select) {
		return sqlSessionTemplate.update("mag.productupdate", select);
	}

	public int productDelete(String select) {
		return sqlSessionTemplate.update("mag.productdelete", select);
	}

	public int returnStateUpdate(ReturnVO rvo) {
		return sqlSessionTemplate.update("mag.returnstateupdate", rvo);
	}
	
	// 교환 / 반품 검색 게시글 리스트  
	public List<ExchangeVO> getExchangeSearchList(Map<String, Object> map, int offset, int limit) {
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("mag.getExchangeSearchList", map);
	}
}

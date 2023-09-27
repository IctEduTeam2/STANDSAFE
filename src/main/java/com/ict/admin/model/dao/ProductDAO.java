package com.ict.admin.model.dao;

import java.util.List;

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
	// 교환리스트
	public List<ExchangeVO> getExchangeList() {
		return sqlSessionTemplate.selectList("mag.exchangelist");
	}
	// 재고리스트
	public List<InventoryVO> getInventoryList() {
		return sqlSessionTemplate.selectList("mag.inventorylist");
	}
	// 교환상세보기
	public ExchangeVO getExchangeOneList(String pb_num) {
		ExchangeVO evo2 = sqlSessionTemplate.selectOne("mag.exchangeonelist", pb_num);
		return evo2;
	}
	// 반품리스트
	public List<ReturnVO> getReturnList(){
		return sqlSessionTemplate.selectList("mag.returnlist");
	}
	// 반품상세보기
	public ReturnVO getReturnOneList(String pb_num) {
		ReturnVO rvo2 = sqlSessionTemplate.selectOne("mag.returnonelist", pb_num);
		return rvo2;
	}
	// 주문리스트
	public List<OrderVO> getOrderList(){
		return sqlSessionTemplate.selectList("mag.orderlist");
	} 
	 // 주문 상세보기
	public List<OrderVO> getOrderDetaileList(String client_num) {
		return sqlSessionTemplate.selectList("mag.orderonelist", client_num);
	}
	public int getProductInsert(ProductVO provo) {
		return sqlSessionTemplate.insert("mag.productinsert", provo);
	}
	
	
	public int productUpdate(String select) {
		return sqlSessionTemplate.update("mag.productupdate",select);
	}
}

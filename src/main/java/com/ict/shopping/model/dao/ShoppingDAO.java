package com.ict.shopping.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.shopping.model.vo.PopUpVO;
import com.ict.shopping.model.vo.ProductVO;

@Repository
public class ShoppingDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<PopUpVO> getPopupList() {
		return sqlSessionTemplate.selectList("shopping.popupList");
	}

	// 베스트 상품 리스트
	public List<ProductVO> getProductBestList() {
		return sqlSessionTemplate.selectList("shopping.productBestList");
	}

	// 새 상품 리스트
	public List<ProductVO> getProductNewList() {
		return sqlSessionTemplate.selectList("shopping.productNewList");
	}
}

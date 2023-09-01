package com.ict.shopping.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.shopping.model.dao.ShoppingDAO;
import com.ict.shopping.model.vo.PopUpVO;
import com.ict.shopping.model.vo.ProductVO;

@Service
public class ShoppingService {
	@Autowired
	private ShoppingDAO shoppingDAO;

	// 메인 팝업리스트
	public List<PopUpVO> getPopupList() {
		return shoppingDAO.getPopupList();
	}

	// 상품리스트
	public List<ProductVO> getProductBestList() {
		return shoppingDAO.getProductBestList();
	}

	// 새 상품 리스트
	public List<ProductVO> getProductNewList() {
		return shoppingDAO.getProductNewList();
	}
}

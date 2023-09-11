package com.ict.shopping.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.shopping.model.dao.ShoppingDAO;
import com.ict.shopping.model.vo.BasketVO;
import com.ict.shopping.model.vo.PayVO;
import com.ict.shopping.model.vo.PopUpVO;
import com.ict.shopping.model.vo.ProductVO;
import com.ict.shopping.model.vo.WishVO;
import com.ict.user.model.vo.PointVO;
import com.ict.user.model.vo.UserVO;

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
	
	// 상품 한개
	public ProductVO getProductOne(String prod_num) {
		return shoppingDAO.getProductOne(prod_num);
	}
	
	// 장바구니 상품 추가
	public String getBasket(BasketVO bvo) {
		return shoppingDAO.getBasket(bvo);
	}
	
	// 주문시 유저정보 가져오기
	public UserVO getUserInfo(String client_num) {
		return shoppingDAO.getUserInfo(client_num);
	}
	
	// 위시리스트 추가
	public void getWishAdd(WishVO wvo) {
		shoppingDAO.getWishAdd(wvo);
	}

	// 위시리스트 조회
	public WishVO getWishSelect(WishVO wvo) {
		return shoppingDAO.getWishSelect(wvo);
	}
	
	// 장바구니 확인
	public BasketVO getBasketSelect(BasketVO bvo) {
		return shoppingDAO.getBasketSelect(bvo);
	}
	
	// 장바구니 상품 수량 변경
	public void getBasketUpdate(BasketVO bvo) {
		shoppingDAO.getBasketUpdate(bvo);
	}
	
	// 장바구니 상품 수량 변경
	public void getBasketUpdate2(BasketVO bvo) {
		shoppingDAO.getBasketUpdate2(bvo);
	}
	
	// 장바구니 리스트
	public List<BasketVO> getBasketList(String client_num) {
		return shoppingDAO.getBasketList(client_num);
	}
	
	// 장바구니 삭제
	public void getBasketProductDel(BasketVO bvo) {
		shoppingDAO.getBasketProductDel(bvo);
	}
	
	//포인트 조회
	public PointVO getPoint(String client_num) {
		return shoppingDAO.getPoint(client_num);
	}
	
	// 결제
	public void getPayInsert(PayVO payvo) {
		shoppingDAO.getPayInsert(payvo);
	}
	
	//결제 후 포인트 차감
	public void getPointSub(PointVO pointvo) {
		shoppingDAO.getPointSub(pointvo);
	}
}

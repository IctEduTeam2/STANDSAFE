package com.ict.shopping.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.shopping.model.dao.ShoppingDAO;
import com.ict.shopping.model.vo.BasketVO;
import com.ict.shopping.model.vo.DeliveryVO;
import com.ict.shopping.model.vo.PayBackVO;
import com.ict.shopping.model.vo.PayVO;
import com.ict.shopping.model.vo.PopUpVO;
import com.ict.shopping.model.vo.ProductVO;
import com.ict.shopping.model.vo.ReviewVO;
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
	
	// 위시리스트 추가
	public void getWishAdd2(WishVO wvo) {
		shoppingDAO.getWishAdd2(wvo);
	}
	
	// 위시리스트 삭제
	public void getWishDelete(WishVO wvo) {
		shoppingDAO.getWishDelete(wvo);
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
	
	// 결제 후 상품재고량 수정
	public void getProductSub(BasketVO bvo) {
		shoppingDAO.getProductSub(bvo);
	}
	
	// 상품리스트
	public List<ProductVO> getProductList(ProductVO pvo) {
		return shoppingDAO.getProductList(pvo);
	}
	
	// 위시리스트
	public List<WishVO> getWishList(String client_num) {
		return shoppingDAO.getWishList(client_num);
	}
	
	// 주문리스트
	public List<PayVO> getPayList(String client_num) {
		return shoppingDAO.getPayList(client_num);
	}
	// 주문리스트
	public List<PayVO> getPayList(PayVO pvo) {
		return shoppingDAO.getPayList(pvo);
	}
	
	// 주문상세내역
	public List<PayVO> getOrderOneList(String pay_oknum) {
		return shoppingDAO.getOrderOneList(pay_oknum);
	}
	
	// 장바구니 조회
	public BasketVO getCartInfo(String cart_num) {
		return shoppingDAO.getCartInfo(cart_num);
	}
	
	// 배송 추가
	public void getDeliveryAdd(String pay_oknum) {
		shoppingDAO.getDeliveryAdd(pay_oknum);
	}

	// 배송 조회
	public DeliveryVO getDeliverySelect(String pay_oknum) {
		return shoppingDAO.getDeliverySelect(pay_oknum);
	}
	
	// 결제 후 결제취소 - pay_t
	public void getPayUpdateST(String pay_oknum) {
		shoppingDAO.getPayUpdateST(pay_oknum);
	}
	
	// 결제 후 결제취소 - payback_t
	public void getPayBackInsert(PayBackVO pbvo) {
		shoppingDAO.getPayBackInsert(pbvo);
	}
	
	// 결제취소 후 상품재고량 증가
	public void getProductPlus(String pay_oknum) {
		shoppingDAO.getProductPlus(pay_oknum);
	}

	//결제취소 후 포인트 증가
	public void getPointPlus(PointVO pointvo) {
		shoppingDAO.getPointPlus(pointvo);
	}
	
	// 구매확정
	public void getDeliveryComfirm(String pay_oknum) {
		shoppingDAO.getDeliveryComfirm(pay_oknum);
	}
	
	// 주문 조회
	public List<PayVO> getPaySelect(PayVO pvo) {
		return shoppingDAO.getPaySelect(pvo);
	}
	
	// 페이백 조회
	public List<PayBackVO> getPayBackSelect(String pay_oknum) {
		return shoppingDAO.getPayBackSelect(pay_oknum);
	}

	// 교환 환불
	public void getPayBackCancleReturn(PayBackVO pbvo) {
		shoppingDAO.getPayBackCancleReturn(pbvo);
	}

	// 교환 환불 취소
	public void getPayBackCancleReturnIsCancle(PayBackVO pbvo) {
		shoppingDAO.getPayBackCancleReturnIsCancle(pbvo);
	}

	// 상품리뷰 조회
	public List<ReviewVO> getReviewList(ReviewVO rvo) {
		return shoppingDAO.getReviewList(rvo);
	}
	
	// 상품리뷰 몇개?
	public int getTotalReviewCount(ReviewVO rvo) {
		return shoppingDAO.getTotalReviewCount(rvo);
	}
	
	// 주문개수
	public int getTotalOrderCount(String client_num) {
		return shoppingDAO.getTotalOrderCount(client_num);
	}
}

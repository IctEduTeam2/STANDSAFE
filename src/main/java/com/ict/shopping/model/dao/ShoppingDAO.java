package com.ict.shopping.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.shopping.model.vo.BasketVO;
import com.ict.shopping.model.vo.PayVO;
import com.ict.shopping.model.vo.PopUpVO;
import com.ict.shopping.model.vo.ProductVO;
import com.ict.shopping.model.vo.WishVO;
import com.ict.user.model.vo.PointVO;
import com.ict.user.model.vo.UserVO;

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

	// 상품 한개
	public ProductVO getProductOne(String prod_num) {
		return sqlSessionTemplate.selectOne("shopping.productOne", prod_num);
	}

	// 장바구니 상품 추가
	public String getBasket(BasketVO bvo) {
		sqlSessionTemplate.insert("shopping.basket", bvo);
		return bvo.getCart_num();
	}

	// 유저정보
	public UserVO getUserInfo(String client_num) {
		return sqlSessionTemplate.selectOne("shopping.userinfo", client_num);
	}

	// 위시추가
	public void getWishAdd(WishVO wvo) {
		sqlSessionTemplate.insert("shopping.wishadd", wvo);
	}

	// 위시추가
	public void getWishAdd2(WishVO wvo) {
		sqlSessionTemplate.update("shopping.wishadd2", wvo);
	}

	// 위시리스트 삭제
	public void getWishDelete(WishVO wvo) {
		sqlSessionTemplate.update("shopping.wishdelete", wvo);
	}

	// 위시리스트 조회
	public WishVO getWishSelect(WishVO wvo) {
		return sqlSessionTemplate.selectOne("shopping.wishselect", wvo);
	}

	// 장바구니 확인
	public BasketVO getBasketSelect(BasketVO bvo) {
		return sqlSessionTemplate.selectOne("shopping.basketselect", bvo);
	}

	// 장바구니 상품 수량 변경
	public void getBasketUpdate(BasketVO bvo) {
		sqlSessionTemplate.update("shopping.basketupdate", bvo);
	}

	// 장바구니 상품 수량 변경
	public void getBasketUpdate2(BasketVO bvo) {
		sqlSessionTemplate.update("shopping.basketupdate2", bvo);
	}

	// 장바구니 리스트
	public List<BasketVO> getBasketList(String client_num) {
		return sqlSessionTemplate.selectList("shopping.basketlist", client_num);
	}

	// 장바구니 삭제
	public void getBasketProductDel(BasketVO bvo) {
		sqlSessionTemplate.update("shopping.basketproductdel", bvo);
	}

	// 포인트 조회
	public PointVO getPoint(String client_num) {
		return sqlSessionTemplate.selectOne("shopping.point", client_num);
	}

	// 결제
	public void getPayInsert(PayVO payvo) {
		sqlSessionTemplate.insert("shopping.payinsert", payvo);
	}

	// 결제 후 포인트 차감
	public void getPointSub(PointVO pointvo) {
		sqlSessionTemplate.insert("shopping.pointsub", pointvo);
	}

	// 상품리스트
	public List<ProductVO> getProductList(ProductVO pvo) {
		return sqlSessionTemplate.selectList("shopping.productlist", pvo);
	}

	// 위시리스트
	public List<WishVO> getWishList(String client_num) {
		return sqlSessionTemplate.selectList("shopping.wishlist", client_num);
	}	
	
	// 주문리스트
	public List<PayVO> getPayList(String client_num) {
		return sqlSessionTemplate.selectList("shopping.paylist", client_num);
	}
}

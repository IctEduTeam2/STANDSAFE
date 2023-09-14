package com.ict.shopping.controller;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.checkerframework.checker.units.qual.g;
import org.checkerframework.framework.qual.RequiresQualifier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.shopping.model.service.ShoppingService;
import com.ict.shopping.model.vo.BasketVO;
import com.ict.shopping.model.vo.PayVO;
import com.ict.shopping.model.vo.PopUpVO;
import com.ict.shopping.model.vo.ProductVO;
import com.ict.shopping.model.vo.WishVO;
import com.ict.user.model.service.PointService;
import com.ict.user.model.vo.PointVO;
import com.ict.user.model.vo.UserVO;

@Controller
public class ShoppingController {
	@Autowired
	private ShoppingService shoppingService;
	@Autowired
	private PointService pointService;

	@GetMapping("/")
	public ModelAndView getMain() {
		ModelAndView mv = new ModelAndView("index");
		// 슬라이드
		List<PopUpVO> popupList = shoppingService.getPopupList();
		mv.addObject("popuplist", popupList);
		// 베스트 상품 리스트
		List<ProductVO> productBestList = shoppingService.getProductBestList();
		mv.addObject("productBestList", productBestList);

		// 새 상품 리스트
		List<ProductVO> productNewList = shoppingService.getProductNewList();

		mv.addObject("productNewList", productNewList);
		return mv;
	}

	// 상품 한개
	@GetMapping("/productOneListform.do")
	public ModelAndView getProductOneListForm(@RequestParam("prod_num") String prod_num) {
		ModelAndView mv = new ModelAndView("shopping/product_onelist");
		try {
			ProductVO pvo = shoppingService.getProductOne(prod_num);
			mv.addObject("pvo", pvo);
		} catch (Exception e) {
			return new ModelAndView("shopping/error");
		}
		return mv;
	}

	// 메인화면 장바구니 담기
	@GetMapping("/basketAdd.do")
	public ModelAndView getBasketForm(@RequestParam("prod_num") String prod_num,
			@RequestParam("client_num") String client_num, @RequestParam("st")String st) {
		ModelAndView mv = new ModelAndView("redirect:/");
		ProductVO pvo = shoppingService.getProductOne(prod_num);
		BasketVO bvo = new BasketVO();
		bvo.setProd_num(prod_num);
		// 세일이 아닐때
		if (pvo.getProd_sale().equals("0")) {
			bvo.setCart_price(pvo.getProd_price());
		} else {
			bvo.setCart_price(pvo.getProd_sale());
		}
		bvo.setCart_amount("1");
		bvo.setCart_st("0");
		bvo.setClient_num(client_num);
		try {
			BasketVO bvo2 = shoppingService.getBasketSelect(bvo);
			if (bvo2.getCart_num() != null) { // 장바구니에 상품이 존재 할 때
				shoppingService.getBasketUpdate(bvo);
			}
		} catch (Exception e) { // 장바구니에 상품이 존재하지 않을때
			shoppingService.getBasket(bvo);
		}
		if(st.equals("0")) {
			return mv;
		} else if(st.equals("1")){
			return new ModelAndView("redirect:/basketform.do?client_num=" + client_num);
		}
		return mv;
	}

	// 상품리스트에서 장바구니 담은 후 제자리
	@GetMapping("/basketAdd2.do")
	public ModelAndView getBasketForm2(@RequestParam("prod_num") String prod_num,
			@RequestParam("client_num") String client_num, @RequestParam("prod_high")String prod_high, @RequestParam("prod_low")String prod_low) {
		ModelAndView mv = new ModelAndView("redirect:/productsform.do?prod_high=" + prod_high + "&prod_low=" + prod_low + "&sort=1");
		ProductVO pvo = shoppingService.getProductOne(prod_num);
		BasketVO bvo = new BasketVO();
		bvo.setProd_num(prod_num);
		// 세일이 아닐때
		if (pvo.getProd_sale().equals("0")) {
			bvo.setCart_price(pvo.getProd_price());
		} else {
			bvo.setCart_price(pvo.getProd_sale());
		}
		bvo.setCart_amount("1");
		bvo.setCart_st("0");
		bvo.setClient_num(client_num);
		try {
			BasketVO bvo2 = shoppingService.getBasketSelect(bvo);
			if (bvo2.getCart_num() != null) { // 장바구니에 상품이 존재 할 때
				shoppingService.getBasketUpdate(bvo);
			}
		} catch (Exception e) { // 장바구니에 상품이 존재하지 않을때
			shoppingService.getBasket(bvo);
		}
		return mv;
	}
	// 바로구매
	@PostMapping("/justbuy.do")
	public ModelAndView getJustBuy(@RequestParam("prod_num") String prod_num,
			@RequestParam("client_num") String client_num, @RequestParam("quantity") String quantity) {
		ModelAndView mv = new ModelAndView("shopping/order");
		ProductVO pvo = shoppingService.getProductOne(prod_num);
		UserVO uvo = shoppingService.getUserInfo(client_num);
		BasketVO bvo = new BasketVO();
		bvo.setCart_amount(quantity);
		String order_num = "";
		String possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		for (var i = 0; i < 15; i++) {
			order_num += possible.charAt((int) Math.floor(Math.random() * possible.length()));
		}
		PointVO pointVO = shoppingService.getPoint(client_num);
		int price = 0;
		if (pvo.getProd_sale().equals("0")) {
			price = Integer.parseInt(pvo.getProd_price()) * Integer.parseInt(quantity);
		} else {
			price = Integer.parseInt(pvo.getProd_sale()) * Integer.parseInt(quantity);
		}
		mv.addObject("price", price);
		mv.addObject("pointvo", pointVO);
		mv.addObject("bvo", bvo);
		mv.addObject("uvo", uvo);
		mv.addObject("pvo", pvo);
		mv.addObject("order_num", order_num);
		return mv;
	}

	// 상품상세 장바구니 담기
	@RequestMapping("/cartadd.do")
	public ModelAndView getCartAdd(@RequestParam("prod_num") String prod_num,
			@RequestParam("client_num") String client_num, @RequestParam("quantity") String quantity,
			@RequestParam("st") String st) {
		ProductVO pvo = shoppingService.getProductOne(prod_num);
		BasketVO bvo = new BasketVO();
		bvo.setProd_num(prod_num);
		// 세일이 아닐때
		if (pvo.getProd_sale().equals("0")) {
			bvo.setCart_price(pvo.getProd_price());
		} else {
			bvo.setCart_price(pvo.getProd_sale());
		}
		bvo.setCart_st("0");
		bvo.setClient_num(client_num);
		bvo.setCart_amount(quantity);
		try {
			BasketVO bvo2 = shoppingService.getBasketSelect(bvo);
			if (bvo2.getCart_num() != null) { // 장바구니에 상품이 존재 할 때
				shoppingService.getBasketUpdate(bvo);
			}
		} catch (Exception e) { // 장바구니에 상품이 존재하지 않을때
			shoppingService.getBasket(bvo);
		}
		if (st.equals("0")) {
			return new ModelAndView("redirect:/productOneListform.do?prod_num=" + prod_num);
		} else if (st.equals("1")) {
			return new ModelAndView("redirect:/basketform.do?client_num=" + client_num);
		} else if (st.equals("2")) {
			return new ModelAndView("redirect:/wishlistform.do?client_num=" + client_num);
		} else {
			return new ModelAndView("shopping/error");
		}
	}

	// 위시리스트 담기
	@PostMapping("/wishadd.do")
	public ModelAndView getWishAdd(@RequestParam("prod_num") String prod_num,
			@RequestParam("client_num") String client_num) {
		ModelAndView mv = new ModelAndView("shopping/product_onelist");
		String alertMessage = null;
		try {
			WishVO wvo = new WishVO();
			wvo.setProd_num(prod_num);
			wvo.setWish_st("0");
			wvo.setClient_num(client_num);
			WishVO wvochk = shoppingService.getWishSelect(wvo);
			ProductVO pvo = shoppingService.getProductOne(prod_num);
			mv.addObject("pvo", pvo);

			if (wvochk == null) {
				// 처음 담는경우
				shoppingService.getWishAdd(wvo);
				alertMessage = "위시리스트에 담았습니다.";
			} else if (wvochk.getWish_st().equals("1")) {
				shoppingService.getWishAdd2(wvo);
				alertMessage = "위시리스트에 담았습니다.";
			} else if (wvochk.getWish_st().equals("0")) {
				// 다음상태
				alertMessage = "이미 위시리스트에 존재합니다.";
			} else {
				// 로그인하지 않았을경우
				alertMessage = "로그인이 필요한 기능입니다.";
			}
		} catch (Exception e) {

		}
		mv.addObject("alertMessage", alertMessage); // 알림 메시지를 ModelAndView에 추가
		return mv;
	}

	// 위시리스트
	@GetMapping("/wishlistform.do")
	public ModelAndView getWishlistForm(@RequestParam("client_num") String client_num) {
		ModelAndView mv = new ModelAndView("shopping/wishlist");
		List<WishVO> wishlist = shoppingService.getWishList(client_num);
		List<ProductVO> prodlist = new ArrayList<>();

		for (WishVO wishItem : wishlist) {
			prodlist.add(shoppingService.getProductOne(wishItem.getProd_num()));
		}

		mv.addObject("prodlist", prodlist);
		mv.addObject("wishlist", wishlist);
		return mv;
	}

	// 위시리스트 삭제
	@GetMapping("/deleteWish.do")
	public ModelAndView getWishDelete(@RequestParam("client_num") String client_num,
			@RequestParam("prod_num") String prod_num) {
		WishVO wvo = new WishVO();
		wvo.setClient_num(client_num);
		wvo.setProd_num(prod_num);
		wvo.setWish_st("1");
		shoppingService.getWishDelete(wvo);
		return new ModelAndView("redirect:/wishlistform.do?client_num=" + client_num);
	}

	// 위시리스트 선택목록 삭제
	@PostMapping("/deleteSelectedWish.do")
	@ResponseBody
	public ModelAndView deleteSelectedWish(@RequestParam("selectedProducts") String selectedProducts,
			@RequestParam("client_num") String client_num) {
		ModelAndView mv = new ModelAndView("redirect:/wishlistform.do?client_num=" + client_num);
		if (selectedProducts == null || selectedProducts.equals("")) {
		} else {
			String[] valuesArray = selectedProducts.split(",");
			WishVO wvo = new WishVO();
			for (int i = 0; i < valuesArray.length; i++) {
				wvo.setProd_num(valuesArray[i]);
				wvo.setClient_num(client_num);
				wvo.setWish_st("1");
				shoppingService.getWishDelete(wvo);
			}
		}
		return mv;
	}

	// 위시리스트 선택목록 장바구니 담기
	@PostMapping("/bsketSelectedWish.do")
	@ResponseBody
	public ModelAndView basketSelectedWish(@RequestParam("selectedProducts") String selectedProducts,
			@RequestParam("client_num") String client_num) {
		ModelAndView mv = new ModelAndView("redirect:/wishlistform.do?client_num=" + client_num);
		String[] valuesArray = selectedProducts.split(",");
		for (int i = 0; i < valuesArray.length; i++) {
			System.out.println(valuesArray[i]);
			BasketVO bvo = new BasketVO();
			bvo.setProd_num(valuesArray[i]);

			ProductVO pvo = shoppingService.getProductOne(valuesArray[i]); // 세일이 아닐때
			if (pvo.getProd_sale().equals("0")) {
				bvo.setCart_price(pvo.getProd_price());
			} else {
				bvo.setCart_price(pvo.getProd_sale());
			}

			bvo.setClient_num(client_num);
			bvo.setCart_amount("1");
			bvo.setCart_st("0");

			try {
				BasketVO bvo2 = shoppingService.getBasketSelect(bvo);
				if (bvo2.getCart_num() != null) { // 장바구니에 상품이 존재 할 때
					shoppingService.getBasketUpdate(bvo);
				}
			} catch (Exception e) { // 장바구니에 상품이 존재하지 않을때
				shoppingService.getBasket(bvo);
			}
		}
		return mv;
	}

	// 장바구니로 이동
	@RequestMapping("/basketform.do")
	public ModelAndView getBasketList(@RequestParam("client_num") String client_num) {
		ModelAndView mv = new ModelAndView("shopping/basket");
		List<BasketVO> bvolist = shoppingService.getBasketList(client_num);
		List<ProductVO> productList = new ArrayList();
		int sum = 0;
		int sale = 0;
		for (BasketVO basket : bvolist) {
			ProductVO product = shoppingService.getProductOne(basket.getProd_num());
			productList.add(product);
			sum += Integer.parseInt(product.getProd_price()) * Integer.parseInt(basket.getCart_amount());
			if (!product.getProd_sale().equals("0")) {
				sale += (Integer.parseInt(product.getProd_price()) - Integer.parseInt(product.getProd_sale()))
						* Integer.parseInt(basket.getCart_amount());
			}
		}
		mv.addObject("sale", sale);
		mv.addObject("sum", sum);
		mv.addObject("prodList", productList);
		mv.addObject("bvolist", bvolist);
		return mv;
	}

	// 장바구니 선택목록 삭제
	@PostMapping("/deleteSelectedProducts.do")
	@ResponseBody
	public ModelAndView deleteSelectedProducts(@RequestParam("selectedProducts") String selectedProducts,
			@RequestParam("client_num") String client_num) {
		ModelAndView mv = new ModelAndView("shopping/basket");
		System.out.println(selectedProducts);
		if (selectedProducts == null || selectedProducts.equals("")) {
		} else {
			String[] valuesArray = selectedProducts.split(",");
			BasketVO bvo = new BasketVO();
			for (int i = 0; i < valuesArray.length; i++) {
				bvo.setProd_num(valuesArray[i]);
				bvo.setClient_num(client_num);
				shoppingService.getBasketProductDel(bvo);
			}
		}
		List<BasketVO> bvolist = shoppingService.getBasketList(client_num);
		List<ProductVO> productList = new ArrayList();
		int sum = 0;
		int sale = 0;
		for (BasketVO basket : bvolist) {
			ProductVO product = shoppingService.getProductOne(basket.getProd_num());
			productList.add(product);
			sum += Integer.parseInt(product.getProd_price()) * Integer.parseInt(basket.getCart_amount());
			if (!product.getProd_sale().equals("0")) {
				sale += (Integer.parseInt(product.getProd_price()) - Integer.parseInt(product.getProd_sale()))
						* Integer.parseInt(basket.getCart_amount());
			}
		}
		mv.addObject("sale", sale);
		mv.addObject("sum", sum);
		mv.addObject("prodList", productList);
		mv.addObject("bvolist", bvolist);
		return mv;
	}

	// 수량증가
	@PostMapping("/updateamount.do")
	public ModelAndView getUpdateAmount(BasketVO bvo, String st) {
		System.out.println(st);
		if (st.equals("-")) {
			bvo.setCart_amount(Integer.toString(Integer.parseInt(bvo.getCart_amount()) - 1));
		} else {
			bvo.setCart_amount(Integer.toString(Integer.parseInt(bvo.getCart_amount()) + 1));
		}

		ProductVO pvo = shoppingService.getProductOne(bvo.getProd_num());
		// 세일이 아닐때
		if (pvo.getProd_sale().equals("0")) {
			bvo.setCart_price(pvo.getProd_price());
		} else {
			bvo.setCart_price(pvo.getProd_sale());
		}
		shoppingService.getBasketUpdate2(bvo);
		return new ModelAndView("redirect:/basketform.do?client_num=" + bvo.getClient_num());
	}

	// 주문페이지로 이동
	@GetMapping("/orderform.do")
	public ModelAndView getOrderForm(@RequestParam("client_num") String client_num) {
		ModelAndView mv = new ModelAndView("shopping/order2");
		UserVO uvo = shoppingService.getUserInfo(client_num);
		List<BasketVO> bvolist = shoppingService.getBasketList(client_num);
		List<ProductVO> productList = new ArrayList();
		String order_num = "";
		String possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		for (var i = 0; i < 15; i++) {
			order_num += possible.charAt((int) Math.floor(Math.random() * possible.length()));
		}
		int price_sum = 0;
		for (BasketVO basket : bvolist) {
			price_sum += Integer.parseInt(basket.getCart_price());
			ProductVO product = shoppingService.getProductOne(basket.getProd_num());
			productList.add(product);
		}

		String ordername = null;
		if (productList.size() == 0) {
			ordername = productList.get(0).getProd_name();
		} else {
			ordername = productList.get(0).getProd_name() + " 외 " + productList.size() + "건";

		}
		mv.addObject("client_num", client_num);
		mv.addObject("ordername", ordername);
		mv.addObject("price_sum", price_sum);
		mv.addObject("order_num", order_num);

		mv.addObject("pvolist", productList);
		mv.addObject("bvolist", bvolist);
		mv.addObject("uvo", uvo);
		return mv;
	}

	// 포인트 구매시
	@PostMapping("/ordercom.do")
	// String take_peo, String address, String extraAddress, String detailAddress,
	// String phone, String memo, String order_num, String prod_num, String
	// client_num
	public ModelAndView getOrderPoint(int point, String take_peo, @RequestParam("address") String address,
			@RequestParam("paytype") String paytype, String detailAddress2, String phone, String memo, String order_num,
			String client_num, String prod_num, @RequestParam("price") int price, String amount, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/");
		BasketVO bvo2 = new BasketVO();
		bvo2.setCart_price(Integer.toString(price));
		bvo2.setProd_num(prod_num);
		bvo2.setClient_num(client_num);
		bvo2.setCart_amount(amount);
		bvo2.setCart_st("1");

		// 카트키 가져오기
		String key = shoppingService.getBasket(bvo2);

		PayVO pvo = new PayVO();
		pvo.setTake_peo(take_peo);
		pvo.setTake_addr(address);
		pvo.setTake_phone(phone);
		pvo.setTake_memo(memo);
		pvo.setPay_type(paytype);
		pvo.setPay_oknum(order_num);
		pvo.setCart_num(key);
		pvo.setClient_num(client_num);
		shoppingService.getPayInsert(pvo);
		PointVO pointVO = new PointVO();
		pointVO.setPOINT_USE(price);
		pointVO.setPOINT_REM(point - price);
		pointVO.setCLIENT_NUM(Integer.parseInt(client_num));
		shoppingService.getPointSub(pointVO);
		session.removeAttribute("POINT_REM");
		session.setAttribute("POINT_REM", pointService.getPointsByUserId(Integer.parseInt(client_num)));
		return mv;
	}

	// 온라인결제시
	@GetMapping("/ordercom2.do")
	// String take_peo, String address, String extraAddress, String detailAddress,
	// String phone, String memo, String order_num, String prod_num, String
	// client_num
	public ModelAndView getOrderCard(@RequestParam Map<String, Object> map) {
		BasketVO bvo2 = new BasketVO();
		bvo2.setCart_price((String) (map.get("cart_price")));
		bvo2.setProd_num((String) (map.get("prod_num")));
		bvo2.setClient_num((String) (map.get("client_num")));
		bvo2.setCart_amount((String) (map.get("cart_amount")));
		bvo2.setCart_st("1");

		// 카트키 가져오기
		String key = shoppingService.getBasket(bvo2);

		System.out.println(key);

		PayVO pvo = new PayVO();
		pvo.setTake_peo((String) (map.get("take_peo")));
		pvo.setTake_addr((String) (map.get("take_addr")));
		pvo.setTake_phone((String) (map.get("take_phone")));
		pvo.setTake_memo((String) (map.get("take_memo")));
		pvo.setPay_type((String) (map.get("pay_type")));
		pvo.setPay_oknum((String) (map.get("pay_oknum")));
		pvo.setPaymentKey((String) (map.get("paymentKey")));
		pvo.setCart_num(key);
		pvo.setClient_num((String) (map.get("client_num")));
		shoppingService.getPayInsert(pvo);
		// 카트키 가져오기
		return null;
	}

	// 품목별 상품 리스트
	@GetMapping("/productsform.do")
	public ModelAndView getProductsForm(@RequestParam("prod_high") String prod_high,
			@RequestParam("prod_low") String prod_low, @RequestParam("sort") String sort) {
		ModelAndView mv = new ModelAndView("shopping/products");
		ProductVO pvo = new ProductVO();
		pvo.setProd_high(prod_high);
		pvo.setProd_low(prod_low);
		List<ProductVO> prodlist = shoppingService.getProductList(pvo);
		List<ProductVO> sortedList = new ArrayList<>(prodlist);

		if ("1".equals(sort)) { // 최신순
			sortedList.sort(Comparator.comparing(ProductVO::getProd_regdate).reversed());
		} else if ("2".equals(sort)) { // 가나다순
			sortedList.sort(Comparator.comparing(ProductVO::getProd_name));
		} else if ("3".equals(sort)) { // 낮은 가격순
			sortedList.sort((p1, p2) -> {
				int price1 = Integer.parseInt(p1.getProd_sale().equals("0") ? p1.getProd_price() : p1.getProd_sale());
				int price2 = Integer.parseInt(p2.getProd_sale().equals("0") ? p2.getProd_price() : p2.getProd_sale());
				return Integer.compare(price1, price2);
			});
		} else if ("4".equals(sort)) { // 인기순
			sortedList.sort(Comparator.comparing(ProductVO::getProd_amount));
		}

		// sortedList를 화면에 전달
		mv.addObject("prodlist", sortedList);
		mv.addObject("count", prodlist.size());
		mv.addObject("prod_high", prodlist.get(0).getProd_high());
		mv.addObject("prod_low", prodlist.get(0).getProd_low());
		return mv;
	}
	
}

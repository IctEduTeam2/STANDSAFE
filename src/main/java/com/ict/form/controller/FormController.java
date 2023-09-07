package com.ict.form.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FormController {
	@GetMapping("/loginform.do")
	public ModelAndView getLoginForm() {
		return new ModelAndView("user/loginform");
	}
	@GetMapping("/registerform.do")
	public ModelAndView getRegisterForm() {
		return new ModelAndView("user/joinpage");
	}
	@GetMapping("/orderlistform.do")
	public ModelAndView getOrderListForm() {
		return new ModelAndView("shopping/orderlist");
	}
	@GetMapping("/orderOneListform.do")
	public ModelAndView getOrderOneListForm() {
		return new ModelAndView("shopping/order_onelist");
	}
	@GetMapping("/wishlistform.do")
	public ModelAndView getWishlistForm() {
		return new ModelAndView("shopping/wishlist");
	}
	@GetMapping("/mypageform.do")
	public ModelAndView getMypageForm() {
		return new ModelAndView("user/mypage");
	}
	@GetMapping("/productsform.do")
	public ModelAndView getProductsForm() {
		return new ModelAndView("shopping/products");
	}
	@GetMapping("/error.do")
	public ModelAndView getError() {
		return new ModelAndView("shopping/error");
	}
}

package com.ict.form.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView getMypageForm(@RequestParam("client_num")String client_num, HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("user/mypage");
		System.out.println(client_num);
		session.setAttribute("client_num", client_num);
		return mv;
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

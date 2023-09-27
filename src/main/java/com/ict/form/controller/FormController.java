package com.ict.form.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.shopping.model.vo.ProductVO;

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
	@GetMapping("/mypageform.do")
	public ModelAndView getMypageForm(@RequestParam("client_num")String client_num, HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("user/mypage");
		System.out.println(client_num);
		session.setAttribute("client_num", client_num);
		return mv;
	}
	@GetMapping("/error.do")
	public ModelAndView getError() {
		return new ModelAndView("shopping/error");
	}
}

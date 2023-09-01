package com.ict.shopping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.shopping.model.service.ShoppingService;
import com.ict.shopping.model.vo.PopUpVO;
import com.ict.shopping.model.vo.ProductVO;

@Controller
public class ShoppingController {
	@Autowired
	private ShoppingService shoppingService;

	@GetMapping("/mainform.do")
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
}

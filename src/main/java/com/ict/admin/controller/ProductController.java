package com.ict.admin.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.admin.model.service.ProductService;
import com.ict.admin.model.vo.ExchangeVO;
import com.ict.admin.model.vo.InventoryVO;
import com.ict.admin.model.vo.OrderVO;
import com.ict.admin.model.vo.ProductVO;
import com.ict.admin.model.vo.ReturnVO;

@Controller
public class ProductController {
	@Autowired
	ProductService productService;

	// 상품리스트
	@RequestMapping("/product_list.do")
	public ModelAndView getProductList() {
		ModelAndView mv = new ModelAndView("admin_main/product_list");
		List<ProductVO> list = productService.getProductList();
		mv.addObject("list", list);
		return mv;
	}

	// 상품등록폼
	@RequestMapping("/product_insertform.do")
	public ModelAndView getProductInsertForm() {
		ModelAndView mv = new ModelAndView("admin_main/product_insert");
		return mv;
	}
	// 상품등록

	@RequestMapping("/product_insert.do")
	public ModelAndView getProductInsert(HttpServletRequest request, ProductVO provo,
		@ModelAttribute("prodst")String prodst) {
		
		ModelAndView mv = new ModelAndView();
		System.out.println("prodst : " + prodst);
		
		// String path =
		// request.getSession().getServletContext().getRealPath("/resources/images/product");
		// try {
		/*
		 * MultipartFile f_param = provo.getFile(); if (!f_param.isEmpty()) { UUID uuid
		 * = UUID.randomUUID(); String prod_img = uuid.toString() + "_" +
		 * provo.getFile().getOriginalFilename(); provo.setPROD_IMG(prod_img);
		 * 
		 * byte[] in = provo.getFile().getBytes(); File out = new File(path, prod_img);
		 * FileCopyUtils.copy(in, out); } else { provo.setPROD_IMG("adsfsdf"); }
		 */
		if(prodst.equals("1")) {
		    provo.setPROD_ST("1");
		}
		    
		 
		
		provo.setPROD_NAME(request.getParameter("prod_name"));
		provo.setPROD_HIGH(request.getParameter("prodhigh"));
		provo.setPROD_LOW(request.getParameter("prodlow"));
		provo.setPROD_PRICE(request.getParameter("regualr_price"));
		provo.setPROD_SALE(request.getParameter("sales_price"));
		provo.setPROD_AMOUNT(request.getParameter("invenq"));
		provo.setPROD_REGDATE(request.getParameter("regdate"));
		provo.setPROD_IMG("sdfsdfsdf");
		provo.setPROD_DETAIL(request.getParameter("file_upload"));

		System.out.println("!!!!! ::" + provo.getPROD_NAME());

		int res = productService.getProductInsert(provo);
		if (res > 0) {
			mv.setViewName("redirect:/product_list.do");
			return mv;
		} else {
			// 추가: 실패 응답 처리
			mv.setViewName("error/error_page"); // 여기서 "error_page"는 실제 에러 페이지의 뷰 이름이어야 합니다.
			mv.addObject("message", "Product insertion failed.");
			return null;
		}

		// } catch (Exception e) {
		// 로그 출력
		// System.err.println("Error during product insertion: " + e.getMessage());

	}

	@PostMapping("/producSelect.do")
	@ResponseBody
	public ModelAndView ProduSelect(
	        @RequestParam("selectedProducts") String selectedProducts,
	        @RequestParam("prod_num") String prod_num) {
	    
	    ModelAndView mv = new ModelAndView();
	    
	    // Parameter Validation
	    if (selectedProducts == null || selectedProducts.trim().isEmpty()) {
	        mv.setViewName("errorPage");
	        mv.addObject("message", "No products selected.");
	        return mv;
	    }
	    if (prod_num == null || prod_num.trim().isEmpty()) {
	        mv.setViewName("errorPage");
	        mv.addObject("message", "Product number is missing.");
	        return mv;
	    }

	    String[] valuesArray = selectedProducts.split(",");
	    
	    for (String product : valuesArray) {
	        // Logic to add each product to the basket, using prod_num and product
	    }

	    mv.setViewName("successPage");
	    return mv;
	}

	// 상품상세보기 미처리
	@RequestMapping("/product_detail.do")
	public ModelAndView getProductDetail() {
		ModelAndView mv = new ModelAndView("admin_main/product_detail");
		return mv;
	}

	@RequestMapping("/product_updateform.do")
	public ModelAndView getProductUpdateForm() {
		ModelAndView mv = new ModelAndView("admin_main/product_update");
		return mv;
	}

	@RequestMapping("/product_update.do")
	public ModelAndView getProductUpdate(
			@ModelAttribute("select")String select,
			@ModelAttribute("selectedProducts")String selectedProducts,
			@ModelAttribute("prod_num")String prod_num,
			@ModelAttribute("PROD_NUM")String PROD_NUM
			) {
		ModelAndView mv = new ModelAndView("admin_main/product_list");
		System.out.println("sele"+select);
		System.out.println("selectedProducts"+selectedProducts);
		System.out.println("prod_num"+prod_num);
		System.out.println("PROD_NUM"+PROD_NUM);
		
		
		int result = productService.productUpdate(select);
		
		return mv;
	}

	@RequestMapping("/product_delete.do")
	public ModelAndView getProductDelete() {
		ModelAndView mv = new ModelAndView("admin_main/product_delete");
		return mv;
	}

	// 재고 관리 리스트
	@RequestMapping("/inventory_management.do")
	public ModelAndView getInventoryManagementgo() {
		ModelAndView mv = new ModelAndView("admin_main/inventory_management");
		List<InventoryVO> list = productService.getInventoryList();
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping("/inventory_updateform.do")
	public ModelAndView getInventoryUpdateForm() {
		ModelAndView mv = new ModelAndView("admin_main/inventory_update");
		return mv;
	}

	@RequestMapping("/inventory_update.do")
	public ModelAndView getInventory_Update() {
		ModelAndView mv = new ModelAndView("admin_main/inventory_update");
		return mv;
	}

	// 반품 리스트
	@RequestMapping("/return_list.do")
	public ModelAndView getInventory_Return() {
		ModelAndView mv = new ModelAndView("admin_main/return_list");
		List<ReturnVO> list = productService.getReturnList();
		mv.addObject("list", list);
		return mv;
	}

	// 반품 상세보기
	@RequestMapping("/return_detail.do")
	public ModelAndView getInventoryDetail(@ModelAttribute("pb_num") String pb_num) {
		ModelAndView mv = new ModelAndView("admin_main/return_detail");
		ReturnVO rvo2 = productService.getReturnOneList(pb_num);
		mv.addObject("rvo2", rvo2);
		return mv;
	}

	// 교환 리스트
	@RequestMapping("/exchange_list.do")
	public ModelAndView getExchangeList() {
		ModelAndView mv = new ModelAndView("admin_main/exchange_list");
		List<ExchangeVO> list = productService.getExchangeList();
		mv.addObject("list", list);
		return mv;
	}

	// 교환 상세보기
	@RequestMapping("/exchange_detail.do")
	public ModelAndView getExchangeDetail(@ModelAttribute("pb_num") String pb_num) {
		ModelAndView mv = new ModelAndView("admin_main/exchange_detail");
		ExchangeVO evo2 = productService.getExchangeOneList(pb_num);
		mv.addObject("evo2", evo2);
		return mv;
	}

	// 주문 리스트
	@RequestMapping("/order_list.do")
	public ModelAndView getOrderList() {
		ModelAndView mv = new ModelAndView("admin_main/order_list");
		List<OrderVO> list = productService.getOrderList();
		mv.addObject("list", list);
		return mv;
	}

	// 주문 상세보기
	@RequestMapping("/order_detail.do")
	public ModelAndView getOrderDetail(@ModelAttribute("client_num") String client_num) {
		ModelAndView mv = new ModelAndView("admin_main/order_detail");
		List<OrderVO> list = productService.getOrderDetaileList(client_num);
		mv.addObject("list", list);
		return mv;
	}
}
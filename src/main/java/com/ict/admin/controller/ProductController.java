package com.ict.admin.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ict.admin.model.service.ProductService;
import com.ict.admin.model.vo.ExchangeVO;
import com.ict.admin.model.vo.InventoryVO;
import com.ict.admin.model.vo.OrderVO;
import com.ict.admin.model.vo.ProductVO;
import com.ict.admin.model.vo.ReturnVO;
import com.ict.common.Paging;

@Controller
public class ProductController {
	@Autowired
	ProductService productService;

	@Autowired
	private Paging paging;

	// 상품리스트
	@RequestMapping("/product_list.do")
	public ModelAndView getProductList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin_main/product_list");

		// 전체 게시물의 수
		int count = productService.getTotalProductCount();
		System.out.println("total count :: " + count);
		paging.setTotalRecord(count);

		// 전체 페이지의 수
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			System.out.println("getNumPerPage() ::::" + paging.getNumPerPage());

		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}
		// 현재페이지
		String cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
			System.out.println("paging null ::" + cPage);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
			System.out.println("paging not null ::" + cPage);
		}
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		System.out.println("paging.getOffset() ::" + paging.getOffset());
		System.out.println("paging.getNumPerPage() ::" + paging.getNumPerPage());
		List<ProductVO> list = productService.getProductList(paging.getOffset(), paging.getNumPerPage());

		LocalDate now = LocalDate.now();
		System.out.println("now ::" + now);

		int today_reg = 0;

		if (list != null || !list.isEmpty()) {
			for (ProductVO pro : list) {
				if (now.toString() == pro.getPROD_REGDATE()) {
					today_reg = +1;
				}
			}

		}

		mv.addObject("today_reg", today_reg);
		mv.addObject("totalCount", count);
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		return mv;
	}

	// 상품등록 검색 기능
	@RequestMapping("/productSearchList.do")
	public ModelAndView getProductSearchList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin_main/product_searchList");
		System.out.println("searchtxt ::" + request.getParameter("searchText"));
		System.out.println("stDate ::" + request.getParameter("stDate"));
		System.out.println("endDate ::" + request.getParameter("endDate"));

		Map<String, Object> map = new HashMap<>();
		map.put("PROD_NAME", request.getParameter("searchText"));
		map.put("PROD_ST", request.getParameter("searchST"));
		map.put("stDate", request.getParameter("stDate"));
		map.put("endDate", request.getParameter("endDate"));

		int allList = productService.getTotalProductCount();

		int totalCount = productService.getTotalCountSearchList(map);
		System.out.println("totalCount ::" + totalCount);
		paging.setTotalRecord(totalCount);
		// 전체 페이지의 수
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
			System.out.println("getNumPerPage() ::::" + paging.getNumPerPage());

		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}
		// 현재페이지
		String cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
			System.out.println("paging null ::" + cPage);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
			System.out.println("paging not null ::" + cPage);
		}
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		System.out.println("paging.getOffset() ::" + paging.getOffset());
		System.out.println("paging.getNumPerPage() ::" + paging.getNumPerPage());

		List<ProductVO> list = productService.getProductSearchList(map, paging.getOffset(), paging.getNumPerPage());
		LocalDate now = LocalDate.now();
		System.out.println("now ::" + now);

		int today_reg = 0;

		if (list != null || !list.isEmpty()) {
			for (ProductVO pro : list) {
				if (now.toString() == pro.getPROD_REGDATE()) {
					today_reg = +1;
				}
			}

		}

		mv.addObject("today_reg", today_reg);
		mv.addObject("totalCount", allList);

		mv.addObject("list", list);
		mv.addObject("paging", paging);
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
			@ModelAttribute("prodst") String prodst, @RequestParam("thumbnail") MultipartFile thumbnail,
			@RequestParam("detail_img") MultipartFile detail_img, RedirectAttributes redirectAttributes)
			throws IOException {

		ModelAndView mv = new ModelAndView();
		System.out.println("prodst : " + prodst);
		String thumbnailPath = null;
		String detailImagePath = null;
		thumbnailPath = saveFileWithUUID(thumbnail);
		detailImagePath = saveFileWithUUID(detail_img);
		// 파일 업로드 추가

		if (prodst.equals("1")) {
			provo.setPROD_ST("1");
		}

		provo.setPROD_NAME(request.getParameter("prod_name"));
		provo.setPROD_HIGH(request.getParameter("prodhigh"));
		provo.setPROD_LOW(request.getParameter("prodlow"));
		provo.setPROD_PRICE(request.getParameter("regualr_price"));
		provo.setPROD_SALE(request.getParameter("sales_price"));
		provo.setPROD_AMOUNT(request.getParameter("invenq"));
		provo.setPROD_REGDATE(request.getParameter("regdate"));
		provo.setPROD_IMG(thumbnailPath);
		provo.setPROD_DETAIL(detailImagePath);

		System.out.println("!!!!! ::" + provo.getPROD_NAME());
		System.out.println("thumb :: " + thumbnailPath);
		System.out.println("detailImagePath :: " + detailImagePath);

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

	// UUID+파일명 함수
	public String saveFileWithUUID(MultipartFile file) throws IOException {
		String uploadDir = "///Users/gahee/Desktop/jisoo/team2/src/main/webapp/resources/images/products/";
		String originalFilename = file.getOriginalFilename();
		String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
		String uuid = UUID.randomUUID().toString();
		String newFilename = uuid + extension;
		System.out.println("newFileNamd ::::" + newFilename);
		File uploadFile = new File(uploadDir + File.separator + newFilename);
		System.out.println("uploadFile :::" + uploadFile);
		file.transferTo(uploadFile);
		return newFilename;
	}

	@PostMapping("/producSelect.do")
	@ResponseBody
	public ModelAndView ProduSelect(@RequestParam("selectedProducts") String[] selectedProducts,
			@RequestParam("st") String st) {
		// 상태값(st)가 'add'이면 업데이트, 'del' 이면 삭

		ModelAndView mv = new ModelAndView();

		// Parameter Validation
		if (selectedProducts == null || selectedProducts.length < 0) {
			mv.setViewName("errorPage");
			mv.addObject("message", "Product number is missing.");
			return mv;
		}
		if (st.matches("add")) { // matches함수 써서 해당 문자열과 동일할 때 if문 함수 실행
			for (String product : selectedProducts) {
				// Logic to add each product to the basket, using prod_num and product
				System.out.println("update_prod ::" + product);
				productService.productUpdate(product);
			}
		} else if (st.matches("del")) {
			for (String product : selectedProducts) {
				// Logic to add each product to the basket, using prod_num and product
				System.out.println("delete_prod ::" + product);
				productService.productDelete(product);
			}

		}
		mv.setViewName("redirect:/product_list.do");
		return mv;
	}

	// 상품상세보기 미처리
	@RequestMapping("/product_detail.do")
	public ModelAndView getProductDetail() {
		ModelAndView mv = new ModelAndView("admin_main/product_detail");
		return mv;
	}

	// 재고 관리 리스트
	@RequestMapping("/inventory_management.do")
	public ModelAndView getInventoryManagement(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin_main/inventory_management");

		// 전체 게시물의 수
		int count = productService.getTotalInventoryCount();
		System.out.println("total count :: " + count);
		paging.setTotalRecord(count);

		// 전체 페이지의 수
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			System.out.println("getNumPerPage() ::::" + paging.getNumPerPage());

		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}
		// 현재페이지
		String cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
			System.out.println("paging null ::" + cPage);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
			System.out.println("paging not null ::" + cPage);
		}
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		List<InventoryVO> list = productService.getInventoryManagement(paging.getOffset(), paging.getNumPerPage());

		LocalDate now = LocalDate.now();
		System.out.println("now ::" + now);

		int today_reg = 0;

		if (list != null || !list.isEmpty()) {
			for (InventoryVO pro : list) {
				if (now.toString() == pro.getPROD_REGDATE()) {
					today_reg = +1;
				}
			}

		}

		mv.addObject("today_reg", today_reg);
		mv.addObject("totalCount", count);

		mv.addObject("list", list);
		mv.addObject("paging", paging);
		return mv;
	}

	// 재고 관리 리스트 - 검색 리스트
	@RequestMapping("/inventorySearchList.do")
	public ModelAndView getInventorySearchManagement(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin_main/inventory_searchManagement");
		System.out.println("searchtxt ::" + request.getParameter("searchText"));
		System.out.println("stDate ::" + request.getParameter("stDate"));
		System.out.println("endDate ::" + request.getParameter("endDate"));

		Map<String, Object> map = new HashMap<>();
		map.put("PROD_NAME", request.getParameter("searchText"));
		map.put("stDate", request.getParameter("stDate"));
		map.put("endDate", request.getParameter("endDate"));

		// 전체 게시물의 수
		int allList = productService.getTotalInventoryCount();

		// 전체 게시물의 수
		int count = productService.getTotalInventorySearchCount(map);
		System.out.println("total count :: " + count);
		paging.setTotalRecord(count);

		// 전체 페이지의 수
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			System.out.println("getNumPerPage() ::::" + paging.getNumPerPage());
			paging.setTotalPage(1);

		} else {
			paging.setTotalPage((paging.getTotalRecord() - 1) / (paging.getNumPerPage() + 1));
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}
		// 현재페이지
		String cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
			System.out.println("paging null ::" + cPage);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
			System.out.println("paging not null ::" + cPage);
		}
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		List<InventoryVO> list = productService.getInventorySearchList(map, paging.getOffset(), paging.getNumPerPage());

		LocalDate now = LocalDate.now();
		System.out.println("now ::" + now);

		int today_reg = 0;

		if (list != null || !list.isEmpty()) {
			for (InventoryVO pro : list) {
				if (now.toString() == pro.getPROD_REGDATE()) {
					today_reg = +1;
				}
			}

		}

		mv.addObject("today_reg", today_reg);
		mv.addObject("totalCount", allList);

		mv.addObject("list", list);
		mv.addObject("paging", paging);
		return mv;
	}

	// 재고 물품 정보 수정 폼
	@GetMapping("/inventory_updateform.do")
	public ModelAndView updateProduct(@RequestParam String prod_num) {
		ModelAndView mv = new ModelAndView("admin_main/inventory_update");
		InventoryVO invo = productService.getInventoryOneList(prod_num);
		mv.addObject("invo", invo);
		return mv;
	}

	// 재고 물품 정보 수정
	@RequestMapping("/inventory_update.do")
	public ModelAndView getProductUpdate(HttpServletRequest request, InventoryVO invo) {
		ModelAndView mv = new ModelAndView(); // inventory_update 페이지로 이동

		invo.setPROD_NAME(request.getParameter("prod_name"));
		invo.setPROD_HIGH(request.getParameter("prodhigh"));
		invo.setPROD_LOW(request.getParameter("prodlow"));
		invo.setPROD_PRICE(request.getParameter("regualr_price"));
		invo.setPROD_SALE(request.getParameter("sales_price"));
		invo.setPROD_AMOUNT(request.getParameter("invenq"));
		invo.setPROD_REGDATE(request.getParameter("regdate"));
		invo.setPROD_NUM(request.getParameter("prod_num"));
		invo.setPROD_ST(request.getParameter("prodStatus"));

		System.out.println("!!!!! ::" + request.getParameter("prod_num"));
		System.out.println("ST!! ::" + request.getParameter("prodStatus"));

		int res = productService.inventoryUpdate(invo);
		if (res > 0) {
			mv.setViewName("redirect:/inventory_management.do");
			return mv;
		} else {
			// 추가: 실패 응답 처리
			mv.setViewName("error/error_page"); // 여기서 "error_page"는 실제 에러 페이지의 뷰 이름이어야 합니다.
			mv.addObject("message", "Inventory update failed.");
			return null;
		}

	}

	// 재고 상품 삭제
	@PostMapping("/productDelete.do")
	public ModelAndView deleteSelectProduct(@RequestParam("deleteProducts") String[] deleteProducts) {
		ModelAndView mv = new ModelAndView();

		if (deleteProducts == null || deleteProducts.length < 0) {
			mv.setViewName("errorPage");
			mv.addObject("message", "Product number is missing.");
			return mv;
		} else {
			for (String prod_num : deleteProducts) {
				productService.deleteSelectProduct(prod_num);
			}
		}
		mv.setViewName("redirect:/inventory_management.do");
		return mv;
	}

//	@RequestMapping("/inventory_updateform.do")
//	public ModelAndView getInventoryUpdateForm() {
//		ModelAndView mv = new ModelAndView("admin_main/inventory_update");
//		return mv;
//	}
//
//	@RequestMapping("/inventory_update.do")
//	public ModelAndView getInventory_Update() {
//		ModelAndView mv = new ModelAndView("admin_main/inventory_update");
//		
//		return mv;
//	}

//	// 반품 리스트
//	@RequestMapping("/return_list.do")
//	public ModelAndView getReturnList() {
//		ModelAndView mv = new ModelAndView("admin_main/return_list");
//		List<ReturnVO> list = productService.getReturnList();
//		mv.addObject("list", list);
//		return mv;
//	}
//
//	// 반품 상세보기
//	@RequestMapping("/return_detail.do")
//	public ModelAndView getReturnDetail(@ModelAttribute("pb_num") String pb_num) {
//		ModelAndView mv = new ModelAndView("admin_main/return_detail");
//		ReturnVO rvo2 = productService.getReturnOneList(pb_num);
//		mv.addObject("rvo2", rvo2);
//		return mv;
//	}
//
//	// 반품 상태 업데이트
//	@RequestMapping("/return_Update.do")
//	public ModelAndView getReturnUpdate(@ModelAttribute("pb_num") String pb_num, @ModelAttribute("pb_st") String pb_st,
//			ReturnVO rvo) {
//		ModelAndView mv = new ModelAndView();
//		rvo.setPB_NUM(pb_num);
//		rvo.setPB_ST(pb_st);
//		System.out.println("return Up :::" + rvo.getPB_NUM());
//		System.out.println("return Up :::" + rvo.getPB_ST());
//		int res = productService.getReturnStateUpdate(rvo);
//		if (res > 0) {
//			mv.setViewName("redirect:/return_detail.do");
//			return mv;
//		} else {
//			// 추가: 실패 응답 처리
//			mv.setViewName("error/error_page"); // 여기서 "error_page"는 실제 에러 페이지의 뷰 이름이어야 합니다.
//			mv.addObject("message", "Product insertion failed.");
//			return null;
//		}
//
//	}

	// 교환 / 반품 리스트
	@RequestMapping("/exchange_list.do")
	public ModelAndView getExchangeList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin_main/exchange_list");

		// 전체 게시물의 수
		int count = productService.getTotalExchangeCount();
		System.out.println("total count :: " + count);
		paging.setTotalRecord(count);
	
		// 전체 페이지의 수
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
			System.out.println("getNumPerPage() ::::" + paging.getNumPerPage());

		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}
		// 현재페이지
		String cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
			System.out.println("paging null ::" + cPage);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
			System.out.println("paging not null ::" + cPage);
		}
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));
	
		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);
	
		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		List<ExchangeVO> list = productService.getExchangeList(paging.getOffset(), paging.getNumPerPage());
		LocalDate now = LocalDate.now();
		System.out.println("now ::" + now);

		int today_reg = 0;

		if (list != null || !list.isEmpty()) {
			for (ExchangeVO pro : list) {
				if (now.toString() == pro.getPB_DATE()) {
					today_reg = +1;
				}
			}

		}

		mv.addObject("TodayExchange", today_reg);
		mv.addObject("AllExchange", count);
		
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		return mv;
	}
	
	// 교환 / 반품 리스트 - 검색 
		@RequestMapping("/exchangeSearchList.do")
		public ModelAndView getExchangeSearchList(HttpServletRequest request) {
			ModelAndView mv = new ModelAndView("admin_main/exchange_searchList");

			Map<String, Object> map = new HashMap<>();
			map.put("PAY_OKNUM", request.getParameter("searchText"));
			map.put("stDate", request.getParameter("stDate"));
			map.put("endDate", request.getParameter("endDate"));

			int allList = productService.getTotalExchangeCount();

			int totalCount = productService.getTotalExchangeCountSearchList(map);
			System.out.println("totalCount ::" + totalCount);
			paging.setTotalRecord(totalCount);
			// 전체 페이지의 수
			if (paging.getTotalRecord() <= paging.getNumPerPage()) {
				paging.setTotalPage(1);
				System.out.println("getNumPerPage() ::::" + paging.getNumPerPage());

			} else {
				paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
				if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
					paging.setTotalPage(paging.getTotalPage() + 1);
				}
			}
			// 현재페이지
			String cPage = request.getParameter("cPage");
			if (cPage == null) {
				paging.setNowPage(1);
				System.out.println("paging null ::" + cPage);
			} else {
				paging.setNowPage(Integer.parseInt(cPage));
				System.out.println("paging not null ::" + cPage);
			}
			paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

			paging.setBeginBlock(
					(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
			paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

			if (paging.getEndBlock() > paging.getTotalPage()) {
				paging.setEndBlock(paging.getTotalPage());
			}
			System.out.println("paging.getOffset() ::" + paging.getOffset());
			System.out.println("paging.getNumPerPage() ::" + paging.getNumPerPage());

			List<ExchangeVO> list = productService.getExchangeSearchList(map, paging.getOffset(), paging.getNumPerPage());
			LocalDate now = LocalDate.now();
			System.out.println("now ::" + now);

			int today_order = 0;

			if (list != null || !list.isEmpty()) {
				for (ExchangeVO ord : list) {
					if (now.toString() == ord.getPB_DATE()) {
						today_order = +1;
					}
				}

			}

			mv.addObject("today_reg", today_order);
			mv.addObject("totalCount", allList);

			mv.addObject("list", list);
			mv.addObject("paging", paging);
			return mv;
		}

	// 교환 / 반품 상세보기
	@RequestMapping("/exchange_detail.do")
	public ModelAndView getExchangeDetail(@RequestParam("payOkNum") String payOkNum) {
		ModelAndView mv = new ModelAndView("admin_main/exchange_detail");
		ExchangeVO evo2 = productService.getExchangeOneList(payOkNum);
		mv.addObject("evo2", evo2);
		return mv;
	}

	// 교환 상태 업데이트
	@RequestMapping("/exchange_update.do")
	public ModelAndView getExchangeUpdate(@ModelAttribute("pb_num") String pb_num,
			@ModelAttribute("pb_st") String pb_st, @ModelAttribute("payOkNum") String payOkNum, ExchangeVO evo) {
		ModelAndView mv = new ModelAndView();
		evo.setPB_NUM(pb_num);
		evo.setPB_ST(pb_st);
		evo.setPAY_OKNUM(payOkNum);
		System.out.println("return Up :::" + evo.getPB_NUM());
		System.out.println("return Up :::" + evo.getPB_ST());
		int res = productService.getExchangeUpdate(evo);
		if (res > 0) {
			mv.setViewName("redirect:/exchange_detail.do");
			return mv;
		} else {
			// 추가: 실패 응답 처리
			mv.setViewName("error/error_page"); // 여기서 "error_page"는 실제 에러 페이지의 뷰 이름이어야 합니다.
			mv.addObject("message", "Product insertion failed.");
			return null;
		}

	}

	// 주문 리스트
	@RequestMapping("/order_list.do")
	public ModelAndView getOrderList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin_main/order_list");
		// 전체 게시물의 수
		int count = productService.getTotalOrderCount();
		System.out.println("total count :: " + count);
		paging.setTotalRecord(count);

		// 전체 페이지의 수
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			System.out.println("getNumPerPage() ::::" + paging.getNumPerPage());

		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}
		// 현재페이지
		String cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
			System.out.println("paging null ::" + cPage);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
			System.out.println("paging not null ::" + cPage);
		}
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		List<OrderVO> list = productService.getOrderList(paging.getOffset(), paging.getNumPerPage());
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		return mv;
	}

	// 주문검색 기능
	@RequestMapping("/orderSearchList.do")
	public ModelAndView getOrderSearchList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin_main/order_searchList");
		System.out.println("searchtxt ::" + request.getParameter("searchText"));
		System.out.println("stDate ::" + request.getParameter("stDate"));
		System.out.println("endDate ::" + request.getParameter("endDate"));

		Map<String, Object> map = new HashMap<>();
		map.put("PAY_OKNUM", request.getParameter("searchText"));
		map.put("stDate", request.getParameter("stDate"));
		map.put("endDate", request.getParameter("endDate"));

		int allList = productService.getTotalOrderCount();

		int totalCount = productService.getTotalCountSearchList(map);
		System.out.println("totalCount ::" + totalCount);
		paging.setTotalRecord(totalCount);
		// 전체 페이지의 수
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
			System.out.println("getNumPerPage() ::::" + paging.getNumPerPage());

		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}
		// 현재페이지
		String cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
			System.out.println("paging null ::" + cPage);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
			System.out.println("paging not null ::" + cPage);
		}
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		System.out.println("paging.getOffset() ::" + paging.getOffset());
		System.out.println("paging.getNumPerPage() ::" + paging.getNumPerPage());

		List<OrderVO> list = productService.getOrderSearchList(map, paging.getOffset(), paging.getNumPerPage());
		LocalDate now = LocalDate.now();
		System.out.println("now ::" + now);

		int today_order = 0;

		if (list != null || !list.isEmpty()) {
			for (OrderVO ord : list) {
				if (now.toString() == ord.getPAY_ORDERDATE()) {
					today_order = +1;
				}
			}

		}

		mv.addObject("today_reg", today_order);
		mv.addObject("totalCount", allList);

		mv.addObject("list", list);
		mv.addObject("paging", paging);
		return mv;
	}

	// 주문 상세보기
	@RequestMapping("/order_detail.do")
	public ModelAndView getOrderDetail(@ModelAttribute("pay_oknum") String pay_oknum) {
		ModelAndView mv = new ModelAndView("admin_main/order_detail");
		List<OrderVO> list = productService.getOrderDetaileList(pay_oknum);
		mv.addObject("list", list);
		return mv;
	}
	// 주문 상태 업데이트
		@RequestMapping("/order_update.do")
		public ModelAndView getOrderUpdate(@ModelAttribute("pay_num") String pay_num,
				@ModelAttribute("take_st") String take_st, @ModelAttribute("payOkNum") String payOkNum, OrderVO ovo) {
			ModelAndView mv = new ModelAndView();
			ovo.setPAY_NUM(pay_num);
			ovo.setTAKE_ST(take_st);
			ovo.setPAY_OKNUM(payOkNum);
			System.out.println("ovo.getPAY_NUM() :::" + ovo.getPAY_NUM());
			System.out.println("ovo.getTAKE_ST() :::" + ovo.getTAKE_ST());
			System.out.println("ovo.getTAKE_ST() :::" + ovo.getPAY_OKNUM());
			int res = productService.getOrderUpdate(ovo);
			if (res > 0) {
				mv.setViewName("redirect:/order_detail.do?pay_oknum="+ovo.getPAY_OKNUM());
				return mv;
			} else {
				// 추가: 실패 응답 처리
				mv.setViewName("error/error_page"); // 여기서 "error_page"는 실제 에러 페이지의 뷰 이름이어야 합니다.
				mv.addObject("message", "Product insertion failed.");
				return null;
			}

		}
}
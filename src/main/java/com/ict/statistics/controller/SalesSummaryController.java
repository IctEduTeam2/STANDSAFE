package com.ict.statistics.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.statistics.model.service.SalesSummaryService;
import com.ict.statistics.model.vo.SalesSummaryVO;

@Controller
public class SalesSummaryController {
	private static final Logger logger = LoggerFactory.getLogger(SalesSummaryController.class);
	@Autowired
	private SalesSummaryService salesSummaryService;
	
//	@RequestMapping("/salesSummary")
//	public String getSalesSummary(Model model) {
//	    List<SalesSummaryVO> salesSummaryList = salesSummaryService.getSalesSummary();
//	    model.addAttribute("salesSummaryList", salesSummaryList);
//	    return "admin_main/index";
//	}
	 @GetMapping("/salesSummaryData")
	    public ResponseEntity<List<SalesSummaryVO>> getSalesSummaryData() {
	        List<SalesSummaryVO> salesSummaryList = salesSummaryService.getSalesSummary();
	        return ResponseEntity.ok(salesSummaryList);
	    }
	 //==========================================================
	 @GetMapping("/top5")
	 public ResponseEntity<List<SalesSummaryVO>> getTop5Products() {
	     List<SalesSummaryVO> top5ProductsList = salesSummaryService.getTop5Products();
	     return ResponseEntity.ok(top5ProductsList);
	 }
	 
	 @GetMapping("/getProductCategorySales")
	 public ResponseEntity<Map<String, Object>> getProductCategorySales() {
	     Map<String, Object> resultMap = new HashMap<>();
	     List<HashMap<String, Object>> productCategorySales = salesSummaryService.getProductCategorySales();
	  // 로깅을 사용하여 데이터 출력
	     logger.info("Product Category Sales Data: {}", productCategorySales);
	     resultMap.put("productCategorySales", productCategorySales);
	     return ResponseEntity.ok(resultMap);
	 }


	 
}

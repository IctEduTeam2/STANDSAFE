package com.ict.statistics.model.service;

import java.util.HashMap;
import java.util.List;

import com.ict.statistics.model.vo.SalesSummaryVO;

public interface SalesSummaryService {
	//데이터를 조회
	List<SalesSummaryVO> getSalesSummary();
	//탑5 조회
	List<SalesSummaryVO> getTop5Products();
	
	public List<HashMap<String, Object>> getProductCategorySales();

	

}

package com.ict.statistics.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.statistics.model.dao.SalesSummaryDAO;
import com.ict.statistics.model.vo.SalesSummaryVO;

@Service
public class SalesSummaryServiceImpl implements SalesSummaryService{
	
	@Autowired
	private SalesSummaryDAO salesSummaryDAO;
	
	//데이터를 조회
	@Override
	public List<SalesSummaryVO> getSalesSummary() {
	    List<SalesSummaryVO> result = salesSummaryDAO.getSalesSummary();
	    return result;
	}

	@Override
	public List<SalesSummaryVO> getTop5Products() {
		List<SalesSummaryVO> result = salesSummaryDAO.getTop5Products();
		return result;
	}

	@Override
	public List<HashMap<String, Object>> getProductCategorySales() {
	    return salesSummaryDAO.getProductCategorySales();
	}

}

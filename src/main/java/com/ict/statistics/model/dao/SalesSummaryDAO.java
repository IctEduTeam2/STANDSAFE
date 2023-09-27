package com.ict.statistics.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.statistics.model.vo.SalesSummaryVO;

@Repository
public class SalesSummaryDAO {
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;

	public List<SalesSummaryVO> getSalesSummary() {
	    List<SalesSummaryVO> result = sqlSessionTemplate.selectList("statistics.selectSalesSummary");
	    return result;
	}

	public List<SalesSummaryVO> getTop5Products() {
		List<SalesSummaryVO> result = sqlSessionTemplate.selectList("statistics.getTop5Products");
		return result;
	}

	public List<HashMap<String, Object>> getProductCategorySales() {
        return sqlSessionTemplate.selectList("statistics.getProductCategorySales");
    }
	
	
	
}

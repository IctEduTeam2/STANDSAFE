package com.ict.statistics.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.statistics.model.vo.PostVO;

@Repository
public class PostDAO {
	
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	public List<PostVO> getAllTop10() {
		return sqlSessionTemplate.selectList("statistics.getAllTop10");
	}

	public List<PostVO> getQATop10() {
		return sqlSessionTemplate.selectList("statistics.getQATop10");
	}

	public List<PostVO> getReviewTop10() {
		 return sqlSessionTemplate.selectList("statistics.getReviewTop10");
	}

	public List<PostVO> getReportTop10() {
		return sqlSessionTemplate.selectList("statistics.getReportTop10");
	}

}

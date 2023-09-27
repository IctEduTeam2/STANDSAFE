package com.ict.statistics.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.statistics.model.dao.PostDAO;
import com.ict.statistics.model.vo.PostVO;

@Service
public class PostServiceImpl implements PostService{
	
	@Autowired
    private PostDAO postDAO;
	
	
	@Override
	public List<PostVO> getAllTop10() {
		return postDAO.getAllTop10();
	}

	@Override
	public List<PostVO> getQATop10() {
		return postDAO.getQATop10();
	}

	@Override
	public List<PostVO> getReviewTop10() {
		return postDAO.getReviewTop10();
	}

	@Override
	public List<PostVO> getReportTop10() {
		return postDAO.getReportTop10();
	}

}

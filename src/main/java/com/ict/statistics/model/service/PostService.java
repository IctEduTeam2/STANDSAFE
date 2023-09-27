package com.ict.statistics.model.service;

import java.util.List;

import com.ict.statistics.model.vo.PostVO;

public interface PostService {
	
	List<PostVO> getAllTop10();

	List<PostVO> getQATop10();

	List<PostVO> getReviewTop10();

	List<PostVO> getReportTop10();
}

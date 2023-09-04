package com.ict.user.model.service;

import com.ict.user.model.vo.PointVO;

public interface PointService {

	//1.유저에 배당되는 포인트 조회
	PointVO getPointsByUserId(String id);

}

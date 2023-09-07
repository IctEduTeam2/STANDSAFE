package com.ict.user.model.service;

import com.ict.user.model.vo.PointVO;

public interface PointService {

	//1.유저번호에 배당되는 포인트 조회
	int getPointsByUserId(int CLIENT_NUM);
	
	//유저포인트 넣기
	int getJoinpoint(PointVO pVO);

}

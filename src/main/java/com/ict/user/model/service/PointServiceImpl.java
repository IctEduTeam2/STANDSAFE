package com.ict.user.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.user.model.dao.PointDAO;
import com.ict.user.model.vo.PointVO;
import com.ict.user.model.vo.UserVO;

@Service
public class PointServiceImpl implements PointService{
	@Autowired
    private PointDAO pointDAO;

	//포인트조회
	@Override
	public int getPointsByUserId(int CLIENT_NUM) {
		return pointDAO.getPointsByUserId(CLIENT_NUM);
	}
	//회원가입 포인트
	@Override
	public int getJoinpoint(PointVO pVO) {
		return pointDAO.getJoinpoint(pVO);
	}
	//리스트보여주기
	@Override
	public List<PointVO> getPointRecordsForUser(int CLIENT_NUM) {
		return pointDAO.getPointRecordsForUser(CLIENT_NUM);
	}
	

}

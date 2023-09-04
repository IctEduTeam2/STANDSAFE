package com.ict.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.user.model.dao.PointDAO;
import com.ict.user.model.vo.PointVO;

@Service
public class PointServiceImpl implements PointService{
	@Autowired
    private PointDAO pointDAO;
	
	@Override
	public PointVO getPointsByUserId(String id) {
		return pointDAO.getPointsByUserId(id);
	}

}

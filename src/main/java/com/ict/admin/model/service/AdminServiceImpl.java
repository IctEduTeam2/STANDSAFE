package com.ict.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ict.admin.model.dao.AdminDAO;
import com.ict.admin.model.vo.AdminVO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public int getAdminAdd(AdminVO adVO) {
		return adminDAO.getAdminAdd(adVO);
	}

	@Override
	public AdminVO getAdminPw(String admin_ID) {
		return adminDAO.getAdminPw(admin_ID);
	}
}

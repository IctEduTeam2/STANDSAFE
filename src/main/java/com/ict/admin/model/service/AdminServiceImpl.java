package com.ict.admin.model.service;

import java.util.List;

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

	@Override
	public boolean isAdminNickDuplicate(String ADMIN_NICK) {
		int cnt = adminDAO.isAdminNickDuplicate(ADMIN_NICK);
		return cnt > 0; 
	}

	@Override
	public boolean isAdminIdDuplicate(String ADMIN_ID) {
		int cnt = adminDAO.isAdminIdDuplicate(ADMIN_ID);
		return cnt > 0; 
	}
	@Override
	public List<AdminVO> getAllAdmins() {
		return adminDAO.getAllAdmins();
	}
	//관리자수
	@Override
	public int getCountAdmins() {
		return adminDAO.getCountAdmins();
	}
	//관리자 세부 정보 가져오기
	@Override
	public AdminVO getAdminDetail(int ADMIN_NUM) {
	    return adminDAO.getAdminDetail(ADMIN_NUM);
	}





}

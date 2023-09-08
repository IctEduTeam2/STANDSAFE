package com.ict.admin.model.service;

import com.ict.admin.model.vo.AdminVO;

public interface AdminService {
	
	//관리자등록
	int getAdminAdd(AdminVO adVO);
	
	//관리자 로그인
	AdminVO getAdminPw(String admin_ID);

}

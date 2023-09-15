package com.ict.admin.model.service;

import java.util.List;

import com.ict.admin.model.vo.AdminVO;

public interface AdminService {
	
	//관리자등록
	int getAdminAdd(AdminVO adVO);
	
	//관리자 로그인
	AdminVO getAdminPw(String admin_ID);
	
	//닉중복
	boolean isAdminNickDuplicate(String ADMIN_NICK);
	
	//아이디중복
	boolean isAdminIdDuplicate(String aDMIN_ID);

	//전체 보기
	List<AdminVO> getAllAdmins();
	//관리자 수
	int getCountAdmins();
	
	//관리자 세부 정보 가져오기
	AdminVO getAdminDetail(int ADMIN_NUM);
	
}

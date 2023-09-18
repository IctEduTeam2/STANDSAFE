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
	
	//관리자업데이트
	int updateAdmin(AdminVO adVO);
	
	//탈퇴처리
	int adminOut(AdminVO adVO);
	//타인 탈퇴
	void deactivateAdmins(List<Integer> adminIdList);
	//비활성화된 관리자
	List<AdminVO> getDeactivatedAdmins();

}

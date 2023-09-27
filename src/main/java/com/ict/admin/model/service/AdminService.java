package com.ict.admin.model.service;

import java.util.List;

import com.ict.admin.model.vo.AdminVO;
import com.ict.bbs.model.vo.QA_BBS_VO;
import com.ict.user.model.vo.UserVO;

public interface AdminService {

	// 관리자등록
	int getAdminAdd(AdminVO adVO);

	// 관리자 로그인
	public AdminVO getAdminPw(String admin_ID);

	// 닉중복
	boolean isAdminNickDuplicate(String ADMIN_NICK);

	// 아이디중복
	boolean isAdminIdDuplicate(String aDMIN_ID);

	// 활성관리자리스트 (시작과 끝 블럭 구하기)
	public List<AdminVO> getAdminlist(int offset, int limit);

	// 관리자 수
	int getCountAdmins();

	// 관리자 세부 정보 가져오기
	public AdminVO getAdminDetail(int ADMIN_NUM);

	// 관리자업데이트
	int updateAdmin(AdminVO adVO);

	// 탈퇴처리
	int adminOut(AdminVO adVO);

	// 타인 탈퇴
	void deactivateAdmins(List<Integer> adminIdList);

	// 비활성화된 관리자 리스트
	public List<AdminVO> getDeactivatedAdmins();

	public List<AdminVO> getAllAdmins();
	
	// 비활성화된 관리자 리스트(시작과 끝 블럭 구하기)
	public List<AdminVO> getDeactivatedAdminlist(int offset, int limit);
	
	//비활성화된 관리자 수
	int countDeactivatedAdmins();
	
	//검색 키워드 및 카테고리를 받아 처리하는 로직
	public List<AdminVO> getAdminlistByKeyword(String category, String keyword, int offset, int limit);
}

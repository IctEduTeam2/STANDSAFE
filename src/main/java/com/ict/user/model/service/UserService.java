package com.ict.user.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;

import com.ict.user.model.vo.UserVO;

public interface UserService {

	
	//1.일반 로그인
	public UserVO getUserPw(String ID);

	//sns로그인 이메일 비교
	public UserVO getUserByEmail(String mail);
	
	// 회원가입 
	int getUserAdd(UserVO uVO);
	
	// 아이디중복
	boolean isIdDuplicate(String ID);
	
	// 닉네임 중복
	boolean isNickDuplicate(String NICKNAME);
	
	//유저정보 수정
	int updateUser(UserVO userVO);
	
	//탈퇴
	int userOut(UserVO uVO);
	
	//아이디 찾기
	public UserVO findMemberId(UserVO uVO);
	
	//이메일찾아서 비번교체
	public UserVO findMemberMail(UserVO uVO);
	
	//임시 비번 넣기
	public UserVO upsertTempPW(UserVO uVO);
	
	//TEMP_PW 비우기
	int resetTempPW(String ID);
	//카운트
	int getCountUsers();
	
	//유저 키워드
	public List<UserVO> getUserlistByKeyword(String category, String keyword, int offset, int limit);
	
	// 시작과 끝 블럭 구하기(유저리스트)
	public List<UserVO> getUserlist(int offset, int limit);
	
	// 시작과 끝 블럭 구하기(삭제된 유저리스트)
	public List<UserVO> getDeactivatedUserlist(int offset, int limit);
	
	//유저 세부
	public UserVO getUserDetail(int CLIENT_NUM);
	
	//카운트 삭제유저
	int countDeactivatedUsers();
	
	// 유저 탈퇴
	void deactivateUsers(List<Integer> userIdList);


	public int getTotalDeactivatedUsers();

	public int getTotalActiveUsers();

	public List<UserVO> getUsersByJoinDateRange(String startDate, String endDate, int offset, int limit);

	public List<UserVO> getUsersByDeactivationDateRange(String startDate, String endDate, int offset, int limit);


}

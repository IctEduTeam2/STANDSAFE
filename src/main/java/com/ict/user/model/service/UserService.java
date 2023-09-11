package com.ict.user.model.service;

import com.ict.user.model.vo.UserVO;

public interface UserService {

	
	//1.일반 로그인
	UserVO getUserPw(String ID);

	//sns로그인 이메일 비교
	UserVO getUserByEmail(String mail);
	
	// 회원가입 
	int getUserAdd(UserVO uVO);
	
	// 아이디중복
	boolean isIdDuplicate(String ID);
	
	// 닉네임 중복
	boolean isNickDuplicate(String NICKNAME);
	
	//유저정보 수정
	int updateUser(UserVO userVO);

	
	
	
	// 아이디 찾기
	
	// 비번 찾기
}

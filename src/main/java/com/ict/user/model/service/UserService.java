package com.ict.user.model.service;

import com.ict.user.model.vo.UserVO;

public interface UserService {

	
	//1.일반 로그인
	UserVO getUserPw(String ID);

	// 회원가입 
	int getUserAdd(UserVO uVO);
	
	// 아이디중복
	int idCheck(String ID);
	
	// 닉네임 중복
	int nickCheck(String NICKNAME);
	
	// 아이디 찾기
	
	// 비번 찾기
}

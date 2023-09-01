package com.ict.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.user.model.vo.PointVO;
import com.ict.user.model.vo.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//로그인
	public UserVO getUserPw(String ID) {
		return sqlSessionTemplate.selectOne("member.selectPwd", ID);
	}
	//회원가입
	public int getUserAdd(UserVO uVO) {
		return sqlSessionTemplate.insert("member.insert", uVO);
	}

	//아이디 중복체크
	public int idCheck(String ID) {
		return sqlSessionTemplate.selectOne("member.idCheck", ID);
	}

	//닉네임 중복체크
	public int nickCheck(String NICKNAME) {
		return sqlSessionTemplate.selectOne("member.nickCheck", NICKNAME);
	}
	

}

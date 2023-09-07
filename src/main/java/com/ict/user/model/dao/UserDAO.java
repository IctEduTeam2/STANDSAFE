package com.ict.user.model.dao;

import java.util.Map;

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
	public int isIdDuplicate(String ID) {
		return sqlSessionTemplate.selectOne("member.idCheck", ID);
	}

	//닉네임 중복체크
	public int isNickDuplicate(String NICKNAME) {
		return sqlSessionTemplate.selectOne("member.nickCheck", NICKNAME);
	}
	//sns 이메일 비교
	public UserVO getUserByEmail(String MAIL) {
		return sqlSessionTemplate.selectOne("member.emailCheck", MAIL);
	}
	
	//유저 업데이트
	public int updateUser(UserVO userVO) {
		return sqlSessionTemplate.update("member.userUpdate", userVO);
	}
	//비밀번호 중복체크
	public int isPwDuplicate(Map<String, Object> params) {
		return sqlSessionTemplate.selectOne("member.pwCheck", params);
	}
	

}

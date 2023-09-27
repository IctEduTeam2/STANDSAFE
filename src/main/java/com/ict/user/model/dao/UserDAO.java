package com.ict.user.model.dao;

import java.util.HashMap;
import java.util.List;
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

	// 로그인
	public UserVO getUserPw(String ID) {
		return sqlSessionTemplate.selectOne("member.selectPwd", ID);
	}

	// 회원가입
	public int getUserAdd(UserVO uVO) {
		return sqlSessionTemplate.insert("member.insert", uVO);
	}

	// 아이디 중복체크
	public int isIdDuplicate(String ID) {
		return sqlSessionTemplate.selectOne("member.idCheck", ID);
	}

	// 닉네임 중복체크
	public int isNickDuplicate(String NICKNAME) {
		return sqlSessionTemplate.selectOne("member.nickCheck", NICKNAME);
	}

	// sns 이메일 비교
	public UserVO getUserByEmail(String MAIL) {
		return sqlSessionTemplate.selectOne("member.emailCheck", MAIL);
	}

	// 유저 업데이트
	public int updateUser(UserVO userVO) {
		return sqlSessionTemplate.update("member.userUpdate", userVO);
	}

	// 비밀번호 중복체크
	public int isPwDuplicate(Map<String, Object> params) {
		return sqlSessionTemplate.selectOne("member.pwCheck", params);
	}

	// 탈퇴
	public int userOut(UserVO uVO) {
		return sqlSessionTemplate.update("member.userOut", uVO);
	}

	// 아이디찾기
	public UserVO findMemberId(UserVO uVO) {
		return sqlSessionTemplate.selectOne("member.getIdByNameAndMail", uVO);
	}

	// 메일 찾아서 비번쏘기
	public UserVO findMemberMail(UserVO uVO) {
		return sqlSessionTemplate.selectOne("member.getMailByIdAndName", uVO);
	}

	// 비번교체용 업서트
	public UserVO upsertTempPW(UserVO uVO) {
		return sqlSessionTemplate.selectOne("member.upsertTempPW", uVO);
	}

	// TEMP_PW 비우기
	public int resetTempPW(String ID) {
		return sqlSessionTemplate.update("member.resetTempPW", ID);
	}

	public List<UserVO> getUserlistByKeyword(String category, String keyword, int offset, int limit) {
		Map<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("member.getUserlistByKeyword", map);
	}

	public int getCountUsers() {
		return sqlSessionTemplate.selectOne("member.countUsers");
	}

	// 시작과 끝 블럭 구하기
	public List<UserVO> getUserlist(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("member.userlist", map);
	}

	// 시작과 끝 블럭 구하기
	public List<UserVO> getDeactivatedUserlist(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("member.getDeactivatedUserlist", map);
	}

	// 개별화면
	public UserVO getUserDetail(int CLIENT_NUM) {
		return sqlSessionTemplate.selectOne("member.userDetail", CLIENT_NUM);
	}

	public int countDeactivatedUsers() {
		return sqlSessionTemplate.selectOne("member.countDeactivatedUsers");
	}

	public Object deactivateUsers(List<Integer> userIDs) {
		return sqlSessionTemplate.update("member.deactivateUsers", userIDs);
	}

	public List<UserVO> getDeactivatedAllUserlist() {
		return sqlSessionTemplate.selectOne("member.countDeactivatedAllUsers");
	}

	public int getTotalActiveUsers() {
		return sqlSessionTemplate.selectOne("member.getTotalActiveUsers");
	}

	public int getTotalDeactivatedUsers() {
		return sqlSessionTemplate.selectOne("member.getTotalDeactivatedUsers");
	}

	public List<UserVO> getUsersByJoinDateRange(String startDate, String endDate, int offset, int limit) {
		Map<String, Object> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("offset", offset);
		map.put("limit", limit);
		return sqlSessionTemplate.selectList("MapperNamespace.getUsersByJoinDateRange", map);
	}

	public List<UserVO> getUsersByDeactivationDateRange(String startDate, String endDate, int offset, int limit) {
		Map<String, Object> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("offset", offset);
		map.put("limit", limit);
		return sqlSessionTemplate.selectList("MapperNamespace.getUsersByDeactivationDateRange", map);
	}
}

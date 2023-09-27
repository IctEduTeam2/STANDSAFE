package com.ict.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.admin.model.vo.AdminVO;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//관리자등록
	public int getAdminAdd(AdminVO adVO) {
		return sqlSessionTemplate.insert("admin.insert", adVO);
	}
	
	//비밀번호조회
	public AdminVO getAdminPw(String admin_ID) {
		return sqlSessionTemplate.selectOne("admin.selectPwd", admin_ID);
	}
	
	//닉 중복체크
	public int isAdminNickDuplicate(String ADMIN_NICK) {
		return sqlSessionTemplate.selectOne("admin.nickCheck",ADMIN_NICK);
	}
	//아이디 중복체크
	public int isAdminIdDuplicate(String ADMIN_ID) {
		return sqlSessionTemplate.selectOne("admin.idCheck",ADMIN_ID);
	}
	//관리자 전체
	public List<AdminVO> getAllAdmins() {
		return sqlSessionTemplate.selectList("admin.selectAll");
	}
	//관리자수
	public int getCountAdmins() {
		return sqlSessionTemplate.selectOne("admin.countAdmins");
	}

	//개별화면
	public AdminVO getAdminDetail(int ADMIN_NUM) {
	    return sqlSessionTemplate.selectOne("admin.adminDetail", ADMIN_NUM);
	}
	
	//관리자 업데이트
	public int updateAdmin(AdminVO adVO) {
		return sqlSessionTemplate.update("admin.adminUpdate", adVO);
	}
	//관리자 삭제 처리
	public int adminOut(AdminVO adVO) {
		return sqlSessionTemplate.update("admin.adminOut", adVO);
	}

	//관리자 삭제 처리2
	public Object deactivateAdmins(List<Integer> adminIDs) {
		return sqlSessionTemplate.update("admin.deactivateAdmins", adminIDs);
	}
	//비활성화된 관리자
	public List<AdminVO> getDeactivatedAdmins() {
	    return sqlSessionTemplate.selectList("admin.getDeactivatedAdmins");
	}
	// 페이징을 위한 전체게시물 구하기
	public int getTotalCount() {
		return sqlSessionTemplate.selectOne("admin.admaincount");
	}
	// 시작과 끝 블럭 구하기
	public List<AdminVO> getAdminlist(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("admin.adminlist", map);
	}
	// 시작과 끝 블럭 구하기
	public List<AdminVO> getDeactivatedAdminlist(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("admin.getDeactivatedAdminlist", map);
	}
	// 페이징을 위한 삭제된 관리자
	public int countDeactivatedAdmins() {
		return sqlSessionTemplate.selectOne("admin.countDeactivatedAdmins");
	}

	public List<AdminVO> getAdminlistByKeyword(String category, String keyword, int offset, int limit) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("category", category);
	    map.put("keyword", keyword);
	    map.put("limit", limit);
	    map.put("offset", offset);
	    return sqlSessionTemplate.selectList("admin.getAdminlistByKeyword", map);
	}
}

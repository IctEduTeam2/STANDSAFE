package com.ict.admin.model.dao;

import java.util.List;

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
}

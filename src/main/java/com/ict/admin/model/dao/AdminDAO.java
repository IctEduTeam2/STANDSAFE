package com.ict.admin.model.dao;

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
	
}

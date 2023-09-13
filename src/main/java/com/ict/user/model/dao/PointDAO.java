package com.ict.user.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.user.model.vo.PointVO;
import com.ict.user.model.vo.UserVO;

@Repository
public class PointDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	//포인트삽입
	public int getJoinpoint(PointVO pVO) {
		return sqlSessionTemplate.insert("point.joinpoint", pVO);
	}
	//포인트조회
	public int getPointsByUserId(int CLIENT_NUM) {
		return sqlSessionTemplate.selectOne("point.userpoint", CLIENT_NUM);
	}
	//포인트 전체조회
	public List<PointVO> getPointRecordsForUser(int CLIENT_NUM) {
		return sqlSessionTemplate.selectList("point.selectPointByClientNum", CLIENT_NUM);
	}

}

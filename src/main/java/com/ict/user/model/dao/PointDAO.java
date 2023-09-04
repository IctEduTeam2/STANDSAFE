package com.ict.user.model.dao;

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
	public int insertPoints(PointVO pVO) {
		return sqlSessionTemplate.insert("point.insert", pVO);
	}
	//포인트조회
		public PointVO getPointsByUserId(String id) {
			return sqlSessionTemplate.selectOne("point.userpoint", id);
		}
}

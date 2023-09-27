package com.ict.statistics.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ict.statistics.model.vo.VisitorVO;

@Repository
public class VisitorDAO {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    // 방문 횟수를 업데이트
    public int recordVisit(String ID) {
        return sqlSessionTemplate.update("visitor.recordVisit", ID);
    }

    // 새로운 방문자 정보 추가
    public int addVisitor(VisitorVO visitorVO) {
        return sqlSessionTemplate.insert("visitor.addVisitor", visitorVO);
    }

    // 해당 날짜에 ID로 방문한 횟수를 반환
    public int getVisitCountByDateAndId(VisitorVO visitorVO) {
        return sqlSessionTemplate.selectOne("visitor.getVisitCountByDateAndId", visitorVO);
    }
    
    // 방문 횟수를 업데이트
    public void recordVisit(VisitorVO visitorVO) {
        sqlSessionTemplate.update("visitor.recordVisitByVO", visitorVO.getID());
    }

//=====================================================================================
	
    public List<VisitorVO> getWeeklyVisitCounts() {
        return sqlSessionTemplate.selectList("visitor.getWeeklyVisitCounts");
    }
}

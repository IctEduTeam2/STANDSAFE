package com.ict.statistics.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.statistics.model.dao.VisitorDAO;
import com.ict.statistics.model.vo.VisitorVO;

@Service
public class VisitorServiceImpl implements VisitorService {
	@Autowired
	private VisitorDAO visitorDAO;
	
	@Override
	public void recordVisit(String ID) {
		System.out.println("recordVisitID로 옴");
		visitorDAO.recordVisit(ID);
	}

	@Override
	public void addVisitor(VisitorVO visitorVO) {
	    // 현재 날짜에 해당 사용자의 방문 기록이 있는지 확인
	        visitorDAO.addVisitor(visitorVO);

	}
	
	@Override
    public int getVisitCountByDateAndId(VisitorVO visitorVO) {
        return visitorDAO.getVisitCountByDateAndId(visitorVO);
    }
//=======================================================

	 @Override
	    public List<VisitorVO> getWeeklyVisitCounts() {
	        return visitorDAO.getWeeklyVisitCounts();
	    }
}

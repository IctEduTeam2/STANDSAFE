package com.ict.statistics.model.service;

import java.util.List;

import com.ict.statistics.model.vo.VisitorVO;

public interface VisitorService {

	public void recordVisit(String ID);

	public void addVisitor(VisitorVO visitorVO);
	
	public int getVisitCountByDateAndId(VisitorVO visitorVO);
//=========================================================	

	public List<VisitorVO> getWeeklyVisitCounts();


}

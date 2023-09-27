package com.ict.statistics.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.statistics.model.service.VisitorService;
import com.ict.statistics.model.vo.VisitorVO;

@Controller
public class VisitorController {
	
	@Autowired
	private VisitorService visitorService;

	@RequestMapping("/getWeeklyVisitData")
	@ResponseBody
	public Map<String, Object> getWeeklyVisitData() {
	    Map<String, Object> resultMap = new HashMap<>();
	    List<VisitorVO> weeklyVisitData = visitorService.getWeeklyVisitCounts();
	    resultMap.put("weeklyVisitData", weeklyVisitData);
	    return resultMap;
	}

}

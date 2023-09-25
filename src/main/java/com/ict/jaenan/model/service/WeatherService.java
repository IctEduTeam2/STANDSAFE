package com.ict.jaenan.model.service;

import java.util.List;

import com.ict.jaenan.model.vo.AreaVO;
import com.ict.jaenan.model.vo.WeatherVO;

public interface WeatherService {
	
	public List<AreaVO> getArea(String selectStep1);
	
	public List<AreaVO> getCounties(String selectStep2);
	
	public List<WeatherVO> getWeatherlocation(String town, String citys, String counties);
}

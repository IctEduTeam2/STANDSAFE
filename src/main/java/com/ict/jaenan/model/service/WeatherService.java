package com.ict.jaenan.model.service;

import java.util.List;

import com.ict.jaenan.model.vo.AreaVO;
import com.ict.jaenan.model.vo.WeatherVO;

public interface WeatherService {
	
	List<AreaVO> getArea(String selectStep1);
	
	List<AreaVO> getCounties(String selectStep2);
	
	List<WeatherVO> getWeather();
}

package com.ict.jaenan.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.jaenan.model.dao.WeatherDAO;
import com.ict.jaenan.model.vo.AreaVO;
import com.ict.jaenan.model.vo.WeatherVO;

@Service
public class WeatherServiceImpl implements WeatherService {
	
	@Autowired
	private WeatherDAO weatherDAO;
	
	@Override
	public List<AreaVO> getArea(String selectStep1) {
		return weatherDAO.getArea(selectStep1);
	}
	
	@Override
	public List<AreaVO> getCounties(String selectStep2) {
		return weatherDAO.getCounties(selectStep2);
	}
	
	@Override
	public List<WeatherVO> getWeather() {
		return weatherDAO.getWeather();
	}
}

package com.ict.jaenan.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.jaenan.model.vo.AreaVO;
import com.ict.jaenan.model.vo.WeatherVO;

@Repository
public class WeatherDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public List<AreaVO> getArea(String selectStep1) {
		return sqlSessionTemplate.selectList("jaenan.arealist", selectStep1);
	}
	
	public List<AreaVO> getCounties(String selectStep2) {
		return sqlSessionTemplate.selectList("jaenan.countylist", selectStep2);
	}
	
	public List<WeatherVO> getWeather() {
		return sqlSessionTemplate.selectOne("jaenan.weatherone");
	}
}

package com.ict.jaenan.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.jaenan.model.service.WeatherService;
import com.ict.jaenan.model.vo.AreaVO;
import com.ict.jaenan.model.vo.WeatherVO;

@Controller
	public class JaenanRainController {

	@Autowired
	private WeatherService weatherService;
	
	//재난-강수-첫화면이자, 날씨실시간 jsp로 가는 컨트롤러
	@RequestMapping("/jaenan_rainlive.do")
	public ModelAndView jaenanRainLive()  { 
		return new ModelAndView("jaenan/info_rainlive");
	}
	
	
	
	
	
	//날씨 동 체크후 실행 버튼 눌렀을 경우 일처리하는 컨트롤러 
	@ResponseBody
	@RequestMapping(value="/get_areacity.do",produces="text/plain; charset=utf-8")
	public String getCitys(HttpServletRequest request,
			@ModelAttribute("selectStep1")String selectStep1,
			@ModelAttribute("selectStep2")String selectStep2,
			HttpSession session) {
		
		StringBuilder html = new StringBuilder();

	    System.out.println("갖고온 시/도시는:" + selectStep1);

	    if (selectStep1 == null || selectStep1.equals("")) {
	        System.out.println("카테고리를 선택하세요");
			/*
			 * String msg = "시/도 를 선택하세요";
			 * html.append("<option value='no'>").append(msg).append("</option>");
			 */
	    } else {
	        System.out.println("선택시에만 여기로");
	        List<AreaVO> cities = weatherService.getArea(selectStep1);
	        System.out.println("선택한 지역으로 갖고온 시군구배열:" + cities);

	        html.append("<select>");
	        for (AreaVO k : cities) {
	            html.append("<option value=\"").append(k.getStep2()).append("\">");
	            html.append(k.getStep2());
	            html.append("</option>");
	        }

	        html.append("</select>"); // </select> 요소를 마지막에 추가
	        System.out.println("html!!" + html);
	    }

	    if (selectStep2 == null || selectStep2.equals("")) {
	        System.out.println("카테고리를 선택하세요");
			/*
			 * String msg = "시/군/구 를 선택하세요";
			 * html.append("<option value='no1'>").append(msg).append("</option>");
			 */
	    } else {
	        System.out.println("선택시에만 여기로");
	        List<AreaVO> counties = weatherService.getCounties(selectStep2);
	        System.out.println("선택한 지역으로 갖고온 읍면동배열:" + counties);

	        html.append("<select>");
	        for (AreaVO k : counties) {
	            html.append("<option value=\"").append(k.getStep3()).append("\">");
	            html.append(k.getStep3());
	            html.append("</option>");
	        }

	        html.append("</select>"); // </select> 요소를 마지막에 추가
	        System.out.println("html!!" + html);
	    }

	    return html.toString(); // StringBuilder를 문자열로 변환하여 반환
	}
		
	@ResponseBody
	@RequestMapping(value= "/get_weather.do")
	public List<WeatherVO> getWeatherInfo(
			@ModelAttribute("citys")String citys,
			@ModelAttribute("counties")String counties,
			@ModelAttribute("town")String town,
			@ModelAttribute("dateInput")String dateInput,	
			@ModelAttribute("areacode")String areacode
			){
		
		System.out.println("시도:"+ citys);
		System.out.println("시군구:"+ counties);
		System.out.println("동네:"+ town);
		System.out.println("날짜:"+ dateInput );
		System.out.println("지역코드위한 코드:"+ areacode );
		
		
		
		List<WeatherVO> weatherlist = weatherService.getWeather();
		return weatherlist;
		
	}
	
	
	
	//재난-강수-홍수발령 페이지로 이동하는 컨트롤러
	@RequestMapping("/jaenan_rainnotice.do")
	public ModelAndView jaenanRainNotice() { 
		return new ModelAndView("jaenan/info_rainnotice");
	}
	
	
}

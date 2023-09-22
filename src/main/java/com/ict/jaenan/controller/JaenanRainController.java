package com.ict.jaenan.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.xml.sax.InputSource;


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


	    if (selectStep1 == null || selectStep1.equals("")) {
	        //System.out.println("카테고리를 선택하세요");
	    } else {
	      
	        List<AreaVO> cities = weatherService.getArea(selectStep1);
	     

	        html.append("<select>");
	        for (AreaVO k : cities) {
	            html.append("<option value=\"").append(k.getStep2()).append("\">");
	            html.append(k.getStep2());
	            html.append("</option>");
	        }

	        html.append("</select>"); // </select> 요소를 마지막에 추가
	        // System.out.println("html!!" + html);
	    }

	    if (selectStep2 == null || selectStep2.equals("")) {
	        //System.out.println("카테고리를 선택하세요");
			
	    } else {
	     
	        List<AreaVO> counties = weatherService.getCounties(selectStep2);
	        // System.out.println("선택한 지역으로 갖고온 읍면동배열:" + counties);

	        html.append("<select>");
	        for (AreaVO k : counties) {
	            html.append("<option value=\"").append(k.getStep3()).append("\">");
	            html.append(k.getStep3());
	            html.append("</option>");
	        }

	        html.append("</select>"); // </select> 요소를 마지막에 추가
	       // System.out.println("html!!" + html);
	    }

	    return html.toString(); // StringBuilder를 문자열로 변환하여 반환
	}
		
	
	@ResponseBody
	@RequestMapping(value= "/get_weather.do",produces="application/json; charset=utf-8")
	public String getWeatherInfo(
			 @RequestParam("dateInput") String dateInput,
		        @RequestParam("areacode") String areacode,
		        @RequestParam("step1") String step1,
		        @RequestParam("step2") String step2
		        ) throws Exception {
		BufferedReader br = null;
		StringBuffer sb = new StringBuffer();

		System.out.println("날짜:"+ dateInput );
		System.out.println("지역코드위한 코드:"+ areacode );
		System.out.println("지역코드위한 1:"+ step1 );
		System.out.println("지역코드위한 2:"+ step2 );

		WeatherVO weathervo = new WeatherVO();
		
		List<WeatherVO> weatherloc = weatherService.getWeatherlocation(areacode, step1,step2);
		
		for (WeatherVO k : weatherloc) {
			System.out.println("nx좌표:" + k.getGridX());
			System.out.println("ny좌표:" +k.getGridY());
			weathervo.setGridX(k.getGridX());
			weathervo.setGridY(k.getGridY());
			
		}
		
	
			String ny = weathervo.getGridY();  //y좌표
			String nx = weathervo.getGridX();  //x좌표
			String base_date  = dateInput.replace("-", "");

			System.out.println("ny좌표:" + ny);
			System.out.println("nx좌표:" +nx);
			System.out.println("날짜:" +base_date);
			
			
		try {
				StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"); /*URL*/
		        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=U5K8ToP0OjUZWoCAD2t5c39BAudQefSGjnRhVZzlgmDMrYsxypjhEicS2%2FgRc%2BqJzx5WJMWLTv0sF7LEzgEn7A%3D%3D"); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
		        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*요청자료형식(XML/JSON) Default: XML*/
		        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(base_date, "UTF-8")); /*‘21년 6월 28일발표*/
		        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode("0500", "UTF-8")); /*05시 발표*/
		        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); /*예보지점의 X 좌표값*/
		        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")); /*예보지점의 Y 좌표값*/
		        
		        URL url = new URL(urlBuilder.toString());
		        URLConnection conn = url.openConnection();
		       
		       br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
		       String msg = "";
		       while((msg=br.readLine())!=null) {
		    	   sb.append(msg);
		       }
		       
		       JSONParser jsonParser = new JSONParser();
		       JSONObject arr = (JSONObject) jsonParser.parse(sb.toString());
		       List<WeatherVO> list = new ArrayList<WeatherVO>();
		      
		       for (int i = 0; i < arr.size(); i++) {
		    	   JSONObject jobt = (JSONObject) arr.get(i);
		    	   String baseDate = (String) jobt.get("baseDate");
		    	   String baseTime = (String) jobt.get("baseTime");
		    	   String category = (String) jobt.get("category");
		    	   String fcstDate = (String) jobt.get("fcstDate");
		    	   String fcstTime = (String) jobt.get("fcstTime");
		    	   String fcstValue = (String) jobt.get("fcstValue");
		    	   
		    	   WeatherVO wvo = new WeatherVO(baseDate,baseTime,category,fcstDate,fcstTime,fcstValue,nx,ny);
		    	   list.add(wvo);	
			}
		        System.out.println("리스트는:" + list.toString());
		        return list.toString();
		        
		    } catch (Exception e) {
				System.out.println("오류는 : " + e);
				return null;
			}
	}
		
		
		
		
		
	
	
	
	//재난-강수-홍수발령 페이지로 이동하는 컨트롤러
	@RequestMapping("/jaenan_rainnotice.do")
	public ModelAndView jaenanRainNotice() { 
		return new ModelAndView("jaenan/info_rainnotice");
	}
	
	
} //끝괄호

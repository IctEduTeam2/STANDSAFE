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
import java.util.Locale.Category;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.json.simple.JSONArray;
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
	public List<WeatherVO> getWeatherInfo(
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
			System.out.println("x좌표:" + k.getGridX());
			System.out.println("y좌표:" +k.getGridY());
			weathervo.setGridX(k.getGridX());
			weathervo.setGridY(k.getGridY());
			
		}
		
	
			String ny = weathervo.getGridY();  //y좌표
			String nx = weathervo.getGridX();  //x좌표
			String[] parts = dateInput.split("[\\s:]+");
	        String base_date = parts[0].replace("-", "");
	        String base_time = parts[1] + parts[2]; // 시간과 분을 합침


			System.out.println("ny좌표:" + ny);
			System.out.println("nx좌표:" +nx);
			System.out.println("날짜:" +base_date);
			System.out.println("날짜:" +base_time);
			
			
		try {
				StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst"); 
		        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=U5K8ToP0OjUZWoCAD2t5c39BAudQefSGjnRhVZzlgmDMrYsxypjhEicS2%2FgRc%2BqJzx5WJMWLTv0sF7LEzgEn7A%3D%3D"); 
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); 
		        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); 
		        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(base_date, "UTF-8")); 
		        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode(base_time, "UTF-8")); 
		        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); 
		        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")); 
		        
		        URL url = new URL(urlBuilder.toString());
		        URLConnection conn = url.openConnection();
		       
		       br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
		       String msg = "";
		       while((msg=br.readLine())!=null) {
		    	   sb.append(msg);
		       }
		       
		       System.out.println(sb.toString());
		       
		       
		       /////////////////////////////////////////////////////////
		       JSONParser jsonParser = new JSONParser();
		       JSONObject arr = (JSONObject) jsonParser.parse(sb.toString());
		       JSONObject response = (JSONObject) arr.get("response"); // JSON 데이터 구조에 맞게 필요한 키를 가져옵니다.
		       
		      
		       // 이제 response 객체 안의 다른 키를 사용하여 데이터를 가져올 수 있습니다.
		      
		       JSONObject body = (JSONObject) response.get("body");
		       JSONObject items = (JSONObject) body.get("items");
		       JSONArray itemList = (JSONArray) items.get("item");
		       
		       List<WeatherVO> list = new ArrayList<WeatherVO>();
		      
		       for (Object item : itemList) {
		    	    JSONObject weatherItem = (JSONObject) item;
		    	
		    	    String category = (String) weatherItem.get("category");
		    	    String fcstValue = (String) weatherItem.get("fcstValue");
		    	    String fcstDate = (String) weatherItem.get("fcstDate");
		    	    String fcstTime = (String) weatherItem.get("fcstTime");

		    	    WeatherVO wvo = new WeatherVO(fcstDate, fcstTime,category,  fcstValue);  
		    	    list.add(wvo);
		    	}
  
		        System.out.println("리스트는:" + list);
		        return list;
		        
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

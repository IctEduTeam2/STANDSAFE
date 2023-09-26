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
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

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
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
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
	public ModelAndView jaenanRainLive(HttpSession session)  {
		
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
	
	
	
	
	@RequestMapping("/get_weather.do")
	public ModelAndView getWeatherInfo(
				@ModelAttribute("dateInput") String dateInput,
		        @ModelAttribute("citys")String citys,
		        @ModelAttribute("counties")String counties,
		        @ModelAttribute("town")String town,
		        HttpServletRequest request,
		        HttpSession session
		        ) {
	
		ModelAndView mv = new ModelAndView("jaenan/info_rainlive");

		StringBuffer sb = new StringBuffer();
        BufferedReader br = null;
		System.out.println("날짜:"+ dateInput );
		System.out.println("지역코드위한 mo1:"+ citys );
		System.out.println("지역코드위한 mo2:"+ counties );
		System.out.println("지역코드위한 mo3:"+ town );

		WeatherVO weathervo = new WeatherVO();
		
		//좌표 구해오기 (동네이름, 지역이름으로 디비에있는 좌표 검색)
		List<WeatherVO> weatherloc = weatherService.getWeatherlocation(town, citys,counties);
		
		//구해온좌표를 api 좌표에 넣기위해 setter
		for (WeatherVO k : weatherloc) {
			System.out.println("x좌표:" + k.getGridX());
			System.out.println("y좌표:" +k.getGridY());
			weathervo.setGridX(k.getGridX());
			weathervo.setGridY(k.getGridY());		
		}
		
	
			String ny = weathervo.getGridY();  //y좌표 설정
			String nx = weathervo.getGridX();  //x좌표 설정
			
			//날짜 설정하기위해 날짜와 시간 분리하기. 
			String[] parts = dateInput.split("[\\s:]+");
	        String base_date = parts[0].replace("-", "");       
	        String gettime = parts[1] + parts[2]; // 시간과 분을 합침
	        
	        //받은시간을 두고 30분 체크하기 
	        int hour = Integer.parseInt(gettime.substring(0, 2));
            int minute = Integer.parseInt(gettime.substring(2));

            // 분이 30 미만인 경우, 시간에서 1을 빼고 분을 30으로 설정
            if (minute < 30) {
                if (hour == 0) {
                    hour = 23; // 자정 이전인 경우, 시간을 23으로 설정
                } else {
                    hour--; // 그 외의 경우 1 시간 빼기
                }
                minute = 30;
            } else {
                // 분이 30 이상인 경우, 분을 0으로 설정
                minute = 30;
            }
            
            String base_time = String.format("%02d%02d", hour, minute);
            System.out.println("Formatted Time: " + base_time);
            
            
            String front_time = hour + ":" + minute;
            //api에 넣을 정보변수 다 확인하기. 밑의변수이름으로 들어갈것.
			System.out.println("ny좌표:" + ny);
			System.out.println("nx좌표:" +nx);
			System.out.println("날짜:" +base_date);
			System.out.println("30분단위 시분:" +base_time);
			
			try {
				StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst"); 
		        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=U5K8ToP0OjUZWoCAD2t5c39BAudQefSGjnRhVZzlgmDMrYsxypjhEicS2%2FgRc%2BqJzx5WJMWLTv0sF7LEzgEn7A%3D%3D"); 
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); 
		        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("XML", "UTF-8")); 
		        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(base_date, "UTF-8")); 
		        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode(base_time, "UTF-8")); 
		        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); 
		        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")); 
		        
		        URL url = new URL(urlBuilder.toString());
		        URLConnection conn = url.openConnection();
		        br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
		        String msg = "";
		        while((msg=br.readLine()) !=null) {
		        	sb.append(msg);
		        }
		        System.out.println(sb.toString());
		        InputSource in = new InputSource(new StringReader(sb.toString()));
		        
		       // 자바에서 XML 파싱하는 방법 : **DOM 방식, SAX방식
				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();
				Document document = builder.parse(in);
		        ArrayList<WeatherVO> list = new ArrayList<WeatherVO>();
		        
		      
		        	NodeList item = document.getElementsByTagName("item");
		        	for (int i = 0; i < item.getLength(); i++) {
		        		String baseDate = (document.getElementsByTagName("baseDate").item(i).getFirstChild()).getNodeValue();
		        		String baseTime  = (document.getElementsByTagName("baseTime").item(i).getFirstChild()).getNodeValue();
						String category  = (document.getElementsByTagName("category").item(i).getFirstChild()).getNodeValue();
						String fcstDate  =(document.getElementsByTagName("fcstDate").item(i).getFirstChild()).getNodeValue();
						String fcstTime  =(document.getElementsByTagName("fcstTime").item(i).getFirstChild()).getNodeValue();
						String fcstValue  = (document.getElementsByTagName("fcstValue").item(i).getFirstChild()).getNodeValue();
						WeatherVO wvo = new WeatherVO(baseDate,baseTime,category,fcstDate,fcstTime,fcstValue);
		                list.add(wvo);
					}
		        	
		        mv.addObject("citys", citys);
		        mv.addObject("counties", counties);
		        mv.addObject("town", town);
		        mv.addObject("dateInput", dateInput);
		        mv.addObject("front_time", front_time);
	
		        mv.addObject("list", list);
 
	            return mv;

	        } catch (Exception e) {
	            e.printStackTrace();
	            return new ModelAndView("jaenan/weather_error");
	        }
	    }

	
	//재난-강수-홍수발령 페이지로 이동하는 컨트롤러
	@RequestMapping("/jaenan_rainnotice.do")
	public ModelAndView jaenanRainNotice() { 
		return new ModelAndView("jaenan/info_rainnotice");
	}
	
	
} //끝괄호

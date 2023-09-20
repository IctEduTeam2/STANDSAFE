package com.ict.jaenan.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.ict.jaenan.model.vo.JaenanRainVO;

@Controller
	public class JaenanRainController {

	
	//https://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108
	//날씨아이콘 다운받기, 7개 
	@RequestMapping("/jaenan_rainlive.do")
	public ModelAndView JaenanRainLive() {
		ModelAndView mv = new ModelAndView("jaenan/info_rainlive");
	
		 try {
			 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst"); /*URL*/
		        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=U5K8ToP0OjUZWoCAD2t5c39BAudQefSGjnRhVZzlgmDMrYsxypjhEicS2%2FgRc%2BqJzx5WJMWLTv0sF7LEzgEn7A%3D%3D"); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
		        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("XML", "UTF-8")); /*요청자료형식(XML/JSON) Default: XML*/
		        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode("20230920", "UTF-8")); /*‘21년 6월 28일 발표*/
		        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode("1900", "UTF-8")); /*06시 발표(정시단위) */
		        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode("59", "UTF-8")); /*예보지점의 X 좌표값*/
		        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode("126", "UTF-8")); /*예보지점의 Y 좌표값*/
		        URL url = new URL(urlBuilder.toString());
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("GET");
		        conn.setRequestProperty("Content-type", "application/json");
		        System.out.println("Response code: " + conn.getResponseCode());
		       
		        BufferedReader rd;
		        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        } else {
		            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		        }
		        StringBuilder sb = new StringBuilder();
		        String line;
		        while ((line = rd.readLine()) != null) {
		            sb.append(line);
		            
		        }
		        InputSource in = new InputSource(new StringReader(sb.toString()));
		        
		        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();
				Document document = builder.parse(in);
				
				ArrayList<JaenanRainVO> list = new ArrayList<JaenanRainVO>();
				NodeList item = document.getElementsByTagName("item");
				
				for (int i = 0; i < item.getLength(); i++) {
					String item1 = item.item(i).getFirstChild().getNodeValue();
					String category = ((Element)(item.item(i))).getAttribute("category");
					String nx = ((Element)(item.item(i))).getAttribute("nx");
					String ny = ((Element)(item.item(i))).getAttribute("ny");
					String obsrValue = ((Element)(item.item(i))).getAttribute("obsrValue");
					
					JaenanRainVO rainvo= new JaenanRainVO(category, nx, ny, obsrValue);
					list.add(rainvo);
					System.out.println("item + category + nx + ny + obsrValue"+item1 + category + nx + ny + obsrValue);
					
				}
		        mv.addObject("list", list);
		        
		        
		        //rd.close();
		        //conn.disconnect();
		        System.out.println(sb.toString());
		        System.out.println("list:" + list);
		        
		        return mv;
		    
		}catch (Exception e) {
			System.out.println("오류:" + e);
		}
		return null;
	}
		
	
	@RequestMapping("/jaenan_rainnotice.do")
	public ModelAndView JaenanRainNotice() { 
		return new ModelAndView("jaenan/info_rainnotice");
	}
	
	
}

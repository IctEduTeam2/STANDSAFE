package com.ict.jaenan.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.net.http.HttpRequest;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.xml.xpath.*;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.*;
import org.xml.sax.InputSource;

import com.ict.common.Paging;
import com.ict.jaenan.model.service.earthquakeService;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.*;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPathConstants;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

@Controller
public class JaenanController {
	
	@Autowired
	private earthquakeService earthquakeService;
	
	
	@Autowired
	private Paging paging;
	// 각 상세 보기

	@RequestMapping("/jaenan_jijinmap.do")
	public ModelAndView JaenanMap() {
		return new ModelAndView("jaenan/info_jaenan_jijinmap");
	}

	@RequestMapping("/jaenan_jijingraph.do")
	public ModelAndView JaenanGraph() {
		return new ModelAndView("jaenan/info_jaenan_jijingraph");
	}

	@RequestMapping("/jaenan_jijin.do")
	public ModelAndView JaenanJijin(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView("jaenan/jaenan_jijin");
	    paging = new Paging();
	    
	    // 현재 페이지 설정
	    String cPage = request.getParameter("cPage");
	    paging.setNowPage(cPage == null ? 1 : Integer.parseInt(cPage));
	    // API 호출
	    StringBuilder sb = new StringBuilder();
	    try {
	        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1741000/DomesticEarthqMagn4HigherOccur/getDomesticEarthqMagn4HigherOccur");
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=serviceKey"); 
	        urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(paging.getNowPage()), "UTF-8"));
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8"));
	        
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        
	        BufferedReader rd;
	        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }

	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	    } catch (Exception e) {
	        e.printStackTrace();
	        return new ModelAndView("shopping/error");
	    }

	    // totalCount 추출
	    int totalCount = 0;
	    try {
	        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	        DocumentBuilder builder = factory.newDocumentBuilder();
	        Document doc = builder.parse(new InputSource(new StringReader(sb.toString())));
	        
	        NodeList totalCountNode = doc.getElementsByTagName("totalCount");
	        if (totalCountNode != null && totalCountNode.getLength() > 0) {
	            totalCount = Integer.parseInt(totalCountNode.item(0).getTextContent());
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	 // 총 레코드 수 설정
	    paging.setTotalRecord(totalCount);

	    // 총 페이지 수 계산
	    if (paging.getTotalRecord() <= paging.getNumPerPage()) {
	        paging.setTotalPage(1);
	    } else {
	        paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
	        if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
	            paging.setTotalPage(paging.getTotalPage() + 1);
	        }
	    }

	    // 나머지 페이징 로직 (예: 시작 블록, 끝 블록 등의 계산)은 여기에 추가됩니다.
	    paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));
        paging.setBeginBlock((int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
        paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);
        if (paging.getEndBlock() > paging.getTotalPage()) {
            paging.setEndBlock(paging.getTotalPage());
        }
	    // API 데이터를 JSP에 전달
        System.out.println("Current Page: " + paging.getNowPage());
        System.out.println("API Response: " + sb.toString());
	    request.setAttribute("apiData", sb.toString());
	    request.setAttribute("paging", paging);
	    return mv;
	}

	// JaenanJijinLive 메서드 수정
	@RequestMapping("/jaenan_jijinlive.do")
	public ModelAndView JaenanJijinLive(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView("jaenan/info_jaenan_jijinlive");
	    try {
	        // 데이터 가져오기
	        List<Map<String, String>> earthquakeList = earthquakeService.getEarthquakeData();

	        mv.addObject("earthquakeList", earthquakeList);  // 지진 데이터 리스트를 ModelAndView 객체에 추가
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return mv;
	}
	
	// /getEarthquakeData.do 엔드포인트 수정
	@RequestMapping("/getEarthquakeData.do")
	@ResponseBody
	public List<Map<String, String>> getEarthquakeData() {
	    // 여기서 데이터를 가져오는 로직을 구현합니다.
	    List<Map<String, String>> earthquakeList = new ArrayList<>();
	    
	    try {
	        LocalDate endDate = LocalDate.now(); // 현재 날짜
	        LocalDate startDate = endDate.minusDays(3); // 3일 전의 날짜

	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
	        String formattedStartDate = startDate.format(formatter);
	        String formattedEndDate = endDate.format(formatter);

	        StringBuilder urlBuilder = new StringBuilder(
	                "http://apis.data.go.kr/1360000/EqkInfoService/getEqkMsg"); /* URL */
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
	                + "=serviceKey"); /*
	                                                                                                                            * Service
	                                                                                                                            * Key
	                                                                                                                            */
	        urlBuilder.append("&" + URLEncoder.encode("fromTmFc", "UTF-8") + "="
	                + URLEncoder.encode(formattedStartDate, "UTF-8"));
	        urlBuilder.append(
	                "&" + URLEncoder.encode("toTmFc", "UTF-8") + "=" + URLEncoder.encode(formattedEndDate, "UTF-8"));
	        urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8"));
	        urlBuilder.append("&" + URLEncoder.encode("dataType", "UTF-8") + "=" + URLEncoder.encode("XML", "UTF-8"));

	        // 실제 API 호출 부분 주석 처리
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/xml;charset=UTF-8");
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = br.readLine()) != null) {
	            sb.append(line);
	        }
	        br.close();

	        String apiData = sb.toString();

	        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	        DocumentBuilder builder = factory.newDocumentBuilder();
	        Document doc = builder.parse(new InputSource(new StringReader(apiData)));

	        NodeList nList = doc.getElementsByTagName("item");
	        for (int temp = 0; temp < nList.getLength(); temp++) {
	            Node nNode = nList.item(temp);
	            if (nNode.getNodeType() == Node.ELEMENT_NODE) {
	                Element eElement = (Element) nNode;

	                Map<String, String> earthquakeData = new HashMap<>();
	                earthquakeData.put("tmFc", eElement.getElementsByTagName("tmFc").item(0).getTextContent());
	                earthquakeData.put("tmEqk", eElement.getElementsByTagName("tmEqk").item(0).getTextContent());
	                earthquakeData.put("lat", eElement.getElementsByTagName("lat").item(0).getTextContent());
	                earthquakeData.put("lon", eElement.getElementsByTagName("lon").item(0).getTextContent());
	                earthquakeData.put("loc", eElement.getElementsByTagName("loc").item(0).getTextContent());
	                earthquakeData.put("dep", eElement.getElementsByTagName("dep").item(0).getTextContent());
	                earthquakeData.put("mt", eElement.getElementsByTagName("mt").item(0).getTextContent());
	                earthquakeData.put("rem", eElement.getElementsByTagName("rem").item(0).getTextContent());
	                earthquakeData.put("img", eElement.getElementsByTagName("img").item(0).getTextContent());

	                earthquakeList.add(earthquakeData);
	            } else {
	                System.out.println("Node type is not ELEMENT_NODE for item " + temp);
	            }
	        }
	        System.out.println("Number of 'item' tags: " + nList.getLength());
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return earthquakeList;
	}

	@RequestMapping("/jaenan_fire.do")
	public ModelAndView JaenanFire() {
		return new ModelAndView("jaenan/info_fire");
	}

	@RequestMapping("/jaenan_firegraph.do")
	public ModelAndView JaenanFireGraph() {
		return new ModelAndView("jaenan/info_firegraph");
	}

}

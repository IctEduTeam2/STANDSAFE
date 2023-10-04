package com.ict.jaenan.model.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

@Service
public class earthquakeServiceImpl implements earthquakeService {

	    public List<Map<String, String>> getEarthquakeData() {
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
	                    + "=nwGcgvkIwJsPyPvd9Fbbm5Q%2FTmb6CJTcyBVkkjoS3qZIubHVtipbeNzBXQyMyiVIK%2BMprnCOBGK8XajyF774iQ%3D%3D"); /*
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
	            
	            // 실제 API 호출 부분
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

}

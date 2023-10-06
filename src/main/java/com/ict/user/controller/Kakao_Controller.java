package com.ict.user.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Kakao_Controller {

	// 인증코드를 받기 위해서 redirect_uri를 사용
	@RequestMapping("/kakaologin.do")
	public ModelAndView KakaoLogin(String code, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/sns_loginok.do");
		//ModelAndView mv = new ModelAndView("result3");
		
		//ModelAndView mv = new ModelAndView("/");
		// code 받기 확인
		// System.out.println(code);
		
		// 2. 토근 받기 
		// POST	https://kauth.kakao.com/oauth/token
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			// POST 요청에 필요
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// 요청 헤더 부분
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			
			// 본문에 필요한 요구사항 4개 
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuffer sb = new StringBuffer();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=1b5cf56e8cc2a06876bd756e6307c0ad");
			//서버 확인하고 바꿔줘야함
			//sb.append("&redirect_uri=http://localhost:8080/kakaologin.do");
			sb.append("&redirect_uri=https://nohssam.site/kakaologin.do");
			sb.append("&code="+code);
			bw.write(sb.toString());
			bw.flush();
			
			// 성공하면 200
			 int responseCode = conn.getResponseCode();
			 System.out.println("responseCode : " + responseCode);
			if(responseCode == 200) {
				// 요청을 통행 얻은 JSON 타입의 결과 메세지를 읽어온다.
				BufferedReader br = 
						new BufferedReader(new InputStreamReader(conn.getInputStream()));
				StringBuffer result = new StringBuffer();
				String line = null;
				while((line = br.readLine())!= null) {
					result.append(line);
				}
				System.out.println("결과:"+result.toString());
				
				// JSON파싱 처리 "access_token"과 "refresh_token"을 잡아내어
				// 카카오 API 요청을 한 후 
				// ModelAndView에 저장하여 result3.jsp에서 결과를 표현한다.
				JSONParser pars = new JSONParser();
				JSONObject json = (JSONObject)pars.parse(result.toString());
				
				String access_token = (String) json.get("access_token");
				String refresh_token = (String) json.get("refresh_token");
				
				// 마지막 3번째 사용자 정보 요청
				// GET/POST 	https://kapi.kakao.com/v2/user/me
				String apiURL = "https://kapi.kakao.com/v2/user/me";
				
				// 헤더부분
				// Authorization	Authorization: Bearer ${ACCESS_TOKEN}
				// Content-type	Content-type: application/x-www-form-urlencoded;charset=utf-8
				
				String header = "Bearer "+access_token;
				
				URL url2 = new URL(apiURL);
				HttpURLConnection conn2 = (HttpURLConnection)url2.openConnection();
				// POST방식
				conn2.setRequestMethod("POST");
				conn2.setDoOutput(true);
				
				// 헤더 요청 사항 
				conn2.setRequestProperty("Authorization", header);
				
				int res_code = conn2.getResponseCode();
				// HttpURLConnection.HTTP_OK => 성공시 200
				System.out.println("res_code:"+res_code);
				if(res_code == HttpURLConnection.HTTP_OK) {
					// 카카오 서버쪽에서 사용자의 정보를 보내다.
					// 이것을 읽어와서 필요한 정보들을 선별해야 한다.
					BufferedReader brdm = 
							new BufferedReader(new InputStreamReader(conn2.getInputStream()));
					
					String str = null;
					StringBuffer res = new StringBuffer();
					while((str = brdm.readLine()) != null) {
						res.append(str);
					}
					
					// 사용자 정보
					System.out.println("str : " + str);
					System.out.println("result type" + result.getClass().getName()); 
					System.out.println("사용자 정보:"+res.toString());
					
					json = (JSONObject)pars.parse(res.toString());
					
					JSONObject props = (JSONObject)json.get("properties");
					String NICKNAME = (String)props.get("nickname");
					
					JSONObject kakao_account = (JSONObject)json.get("kakao_account");
					String MAIL = (String)kakao_account.get("email");
					String BIRTH = (String)kakao_account.get("birthday");
					String ID = (String)kakao_account.get("id");
					
					System.out.println("NICKNAME:"+NICKNAME);
					System.out.println("BIRTH:"+BIRTH);
					System.out.println("MAIL:"+MAIL);
					
					HttpSession session = request.getSession();
					session.setAttribute("NICKNAME", NICKNAME);
					session.setAttribute("BIRTH", BIRTH);
					session.setAttribute("MAIL", MAIL);
					
				}
			}
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
package com.ict.jaenan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JaenanController {
	
	//각 상세 보기
	
	@RequestMapping("/jaenan_jijinmap.do")
	public ModelAndView JaenanMap() {
		return new ModelAndView("jaenan/info_jaenan_jijinmap");
	}
	
	@RequestMapping("/jaenan_jijingraph.do")
	public ModelAndView JaenanGraph() {
		return new ModelAndView("jaenan/info_jaenan_jijingraph");
	}
	
	@RequestMapping("/jaenan_jijin.do")
	public ModelAndView Jaenan() {
		return new ModelAndView("jaenan/info_jaenan_jijin");
	}
	
	@RequestMapping("/jaenan_jijinlive.do")
	public ModelAndView JaenanLive() {
		return new ModelAndView("jaenan/info_jaenan_jijinlive");
	}
	
	@RequestMapping("/jaenan_rainlive.do")
	public ModelAndView JaenanRainLive() {
		return new ModelAndView("jaenan/info_rainlive");
	}
	
	@RequestMapping("/jaenan_rainnotice.do")
	public ModelAndView JaenanRainNotice() {
		return new ModelAndView("jaenan/info_rainnotice");
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

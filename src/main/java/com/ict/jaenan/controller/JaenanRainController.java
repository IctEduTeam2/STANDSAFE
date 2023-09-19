package com.ict.jaenan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
	public class JaenanRainController {

	
	
	@RequestMapping("/jaenan_rainlive.do")
	public ModelAndView JaenanRainLive() {
		return new ModelAndView("jaenan/info_rainlive");
	}
	
	@RequestMapping("/jaenan_rainnotice.do")
	public ModelAndView JaenanRainNotice() {
		return new ModelAndView("jaenan/info_rainnotice");
	}
	
	
}

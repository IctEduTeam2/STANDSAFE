package com.ict.bbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BBSController {
	
	//각 리스트로 
	@RequestMapping("/bbs_notice_go.do")
	public ModelAndView goBbsNotice() {
		return new ModelAndView("bbs/notice");
	}

	
	@RequestMapping("/bbs_event_go.do")
	public ModelAndView goBbsEvent() {
		return new ModelAndView("bbs/event");
	}
	
	@RequestMapping("/bbs_faq_go.do")
	public ModelAndView goBbsFaq() {
		return new ModelAndView("bbs/faq");
	}
	
	@RequestMapping("/bbs_qa_go.do")
	public ModelAndView goBbsQa() {
		return new ModelAndView("bbs/qa");
	}
	
	@RequestMapping("/bbs_report_go.do")
	public ModelAndView goBbsReport() {
		return new ModelAndView("bbs/report");
	}
	
	@RequestMapping("/bbs_review_go.do")
	public ModelAndView goBbsReview() {
		return new ModelAndView("bbs/review");
	}
	
	
	//각 상세보기로
	@RequestMapping("/bbs_notice_onelist.do")
	public ModelAndView goBbsNoticeOneList() {
		return new ModelAndView("bbs/notice_onelist");
	}
	
	@RequestMapping("/bbs_event_onelist.do")
	public ModelAndView goBbsEventOneList() {
		return new ModelAndView("bbs/event_onelist");
	}
	@RequestMapping("/bbs_qa_onelist.do")
	public ModelAndView goBbsQAOneList() {
		return new ModelAndView("bbs/qa_onelist");
	}
	@RequestMapping("/bbs_report_onelist.do")
	public ModelAndView goBbsReportOneList() {
		return new ModelAndView("bbs/report_onelist");
	}
	@RequestMapping("/bbs_review_onelist.do")
	public ModelAndView goBbsReviewOneList() {
		return new ModelAndView("bbs/review_onelist");
	}
	
	
	
	 //각 작성폼으로
	@RequestMapping("/bbs_qa_writeform.do")
	public ModelAndView goBbsQAWriteForm() {
		return new ModelAndView("bbs/qa_writeform");
	}
	
	@RequestMapping("/bbs_report_writeform.do")
	public ModelAndView goBbsReportWriteForm() {
		return new ModelAndView("bbs/report_writeform");
	}
	@RequestMapping("/bbs_review_writeform.do")
	public ModelAndView goBbsReviewtWriteForm() {
		return new ModelAndView("bbs/review_writeform");
	}
	
	//작성완료 일처리 컨트롤러
	@RequestMapping("/bbs_qa_writeOk.do")
	public ModelAndView BbsQaWriteOk() {
		ModelAndView mv = new ModelAndView("redirect:/bbs_qa_go.do");
		return mv;
	}
	
	
	
	
	
	//각 삭제폼으로
	@RequestMapping("/bbs_qa_delete.do")
	public ModelAndView goBbsQaDelete() {
		return new ModelAndView("bbs/qa_delete");
	}
	@RequestMapping("/bbs_report_delete.do")
	public ModelAndView goBbsReportDelete() {
		return new ModelAndView("bbs/report_delete");
	}
	@RequestMapping("/bbs_review_delete.do")
	public ModelAndView goBbsReviewDelete() {
		return new ModelAndView("bbs/review_delete");
	}
	
	
	//각 수정폼으로
	
	@RequestMapping("/bbs_qa_update.do")
	public ModelAndView goBbsQaUpdate() {
		return new ModelAndView("bbs/qa_update");
	}
	@RequestMapping("/bbs_review_update.do")
	public ModelAndView goBbsReviewUpdate() {
		return new ModelAndView("bbs/review_update");
	}
	
}

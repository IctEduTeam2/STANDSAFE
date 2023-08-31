package com.ict.bbs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.bbs.model.service.BBS_Service;
import com.ict.bbs.model.vo.EV_BBS_VO;
import com.ict.bbs.model.vo.FA_BBS_VO;
import com.ict.bbs.model.vo.NO_BBS_VO;
import com.ict.common.Paging;

@Controller
public class BBSController {
	
	@Autowired
	private BBS_Service bbsService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private Paging paging;
	
	//각 리스트로 

	
	//공지사항 전체리스트 + 페이징
	@RequestMapping("/bbs_notice_go.do")
	public ModelAndView goBbsNotice(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("bbs/notice");
		
		//페이징을 위해 게시물의 전체글 구하기
		int count = bbsService.getTotalNoticeCount();
		paging.setTotalRecord(count);
		
		//페이징처리
		if(paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		}else {
			paging.setTotalPage(paging.getTotalRecord()/paging.getNumPerPage());
			if(paging.getTotalRecord()%paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() +1);
			}
		}
		
		String cPage = request.getParameter("cPage");
		if(cPage==null) {
			paging.setNowPage(1);
		}else {
			paging.setNowPage(Integer.parseInt(cPage));
		}
		
		paging.setOffset(paging.getNumPerPage()*(paging.getNowPage()-1));
		
		paging.setBeginBlock((int)((paging.getNowPage()-1)/paging.getPagePerBlock())
				*paging.getPagePerBlock()+1);
		
		paging.setEndBlock(paging.getBeginBlock()+paging.getPagePerBlock()-1);
		
		if(paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		
		List<NO_BBS_VO> list = bbsService.getnoticelist(paging.getOffset(),paging.getNumPerPage());
		
		String notice_num = request.getParameter("NOTICE_NUM");
		NO_BBS_VO nvo = bbsService.getNoticeOneList(notice_num);
		
		mv.addObject("list", list);
		mv.addObject("nvo", nvo);
		mv.addObject("paging", paging);
		return mv;
	}
	
	
	
	
	@RequestMapping("/bbs_event_go.do")
	public ModelAndView goBbsEvent(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("bbs/event");
		
		//페이징을 위해 게시물의 전체글 구하기
		int count = bbsService.getTotalEventCount();
		paging.setTotalRecord(count);
		
		//페이징처리
		if(paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		}else {
			paging.setTotalPage(paging.getTotalRecord()/paging.getNumPerPage());
			if(paging.getTotalRecord()%paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() +1);
			}
		}
		
		String cPage = request.getParameter("cPage");
		if(cPage==null) {
			paging.setNowPage(1);
		}else {
			paging.setNowPage(Integer.parseInt(cPage));
		}
		
		paging.setOffset(paging.getNumPerPage()*(paging.getNowPage()-1));
		
		paging.setBeginBlock((int)((paging.getNowPage()-1)/paging.getPagePerBlock())
				*paging.getPagePerBlock()+1);
		
		paging.setEndBlock(paging.getBeginBlock()+paging.getPagePerBlock()-1);
		
		if(paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		
		List<EV_BBS_VO> list = bbsService.geteventlist(paging.getOffset(),paging.getNumPerPage());
		
		String event_num = request.getParameter("EVENT_NUM");
		EV_BBS_VO evo = bbsService.getEventOneList(event_num);
		
		mv.addObject("list", list);
		mv.addObject("evo", evo);
		mv.addObject("paging", paging);
		return mv;
	}
	
	
	
	@RequestMapping("/bbs_faq_go.do")
	public ModelAndView goBbsFaq(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("bbs/faq");
		
		//페이징을 위해 게시물의 전체글 구하기
		int count = bbsService.getTotalFaqCount();
		paging.setTotalRecord(count);
		
		//페이징처리
		if(paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		}else {
			paging.setTotalPage(paging.getTotalRecord()/paging.getNumPerPage());
			if(paging.getTotalRecord()%paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() +1);
			}
		}
		String cPage = request.getParameter("cPage");
		if(cPage==null) {
			paging.setNowPage(1);
		}else {
			paging.setNowPage(Integer.parseInt(cPage));
		}
		
		paging.setOffset(paging.getNumPerPage()*(paging.getNowPage()-1));
		
		paging.setBeginBlock((int)((paging.getNowPage()-1)/paging.getPagePerBlock())
				*paging.getPagePerBlock()+1);
		
		paging.setEndBlock(paging.getBeginBlock()+paging.getPagePerBlock()-1);
		
		if(paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		
		List<FA_BBS_VO> list = bbsService.getfaqlist(paging.getOffset(),paging.getNumPerPage());
		
		String faq_num = request.getParameter("FA_NUM");
		
		FA_BBS_VO fqvo = bbsService.getFaqOneList(faq_num);
		
		
		
		mv.addObject("list", list);
		mv.addObject("fqvo", fqvo);
		mv.addObject("paging", paging);

		return mv;

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
	
	//공지사항 상세보기
	@RequestMapping("/bbs_notice_onelist.do")
	public ModelAndView goBbsNoticeOneList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("bbs/notice_onelist");
		
		String notice_num = request.getParameter("NOTICE_NUM");
		String cPage = request.getParameter("cPage");
		
		//조회수
		int hit = bbsService.getNoticeHitUpdate(notice_num);
		
		//onelist
		NO_BBS_VO nvo = bbsService.getNoticeOneList(notice_num);
		
		mv.addObject("nvo", nvo);
		mv.addObject("cPage", cPage);

		return mv;
	}
	
	@RequestMapping("/bbs_event_onelist.do")
	public ModelAndView goBbsEventOneList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("bbs/event_onelist");
		
		String event_num = request.getParameter("EVENT_NUM");
		String cPage = request.getParameter("cPage");
		
		//조회수
		int hit = bbsService.getEventHitUpdate(event_num);
		
		//onelist
		EV_BBS_VO evo = bbsService.getEventOneList(event_num);
		
		mv.addObject("evo", evo);
		mv.addObject("cPage", cPage);

		return mv;
	}
	
	
	@RequestMapping("/bbs_faq_onelist.do")
	public ModelAndView goBbsFaqOneList(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView("redirect:/bbs_faq_go.do");
		String faq_num = request.getParameter("FA_NUM");
		String cPage = request.getParameter("cPage");
		
		//조회수
		int hit = bbsService.getFaqHitUpdate(faq_num);
		
		//onelist
		FA_BBS_VO favo = bbsService.getFaqOneList(faq_num);
		
		mv.addObject("favo", favo);
		mv.addObject("cPage", cPage);

		return mv;
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
	public ModelAndView goBbsQAWriteForm(HttpServletRequest request) {
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

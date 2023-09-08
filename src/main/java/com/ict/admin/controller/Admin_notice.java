package com.ict.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.admin.model.service.NoticeService;
import com.ict.admin.model.vo.NoticeVO;
import com.ict.common.Paging;

@Controller
public class Admin_notice {
	
	@Autowired
	private NoticeService notiService;
	@Autowired
	private Paging paging;
	
	@RequestMapping("/admin_notice.do")
	public ModelAndView AdminNo(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin_notice/notice");
		
		//페이징 처리 
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
		}else{
			paging.setNowPage(Integer.parseInt(cPage));
		}
		
		paging.setOffset(paging.getNumPerPage()*(paging.getNowPage()-1));
		paging.setBeginBlock((int)((paging.getNowPage()-1)/paging.getPagePerBlock())
				*paging.getPagePerBlock()+1);
	
		paging.setEndBlock(paging.getBeginBlock()+paging.getPagePerBlock()-1);
		
		if(paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		
		List<NoticeVO> list = notiService.getadnoticelist(paging.getOffset(),paging.getNumPerPage());
		
		String notice_num = request.getParameter("NOTICE_NUM");
		NoticeVO anvo = notiService.getAdNoticeOneList(notice_num);
		
		mv.addObject("list", list);
		mv.addObject("anvo", anvo);
		mv.addObject("paging", paging);
		return mv;
	}
	
	@RequestMapping("/admin_qa.do")
	public ModelAndView AdminQa() {
		ModelAndView mv = new ModelAndView("admin_notice/qa");
		return mv;
	}
	@RequestMapping("/admin_faq.do")
	public ModelAndView AdminFaq() {
		ModelAndView mv = new ModelAndView("admin_notice/faq");
		return mv;
	}
	@RequestMapping("/admin_event.do")
	public ModelAndView AdminEvent() {
		ModelAndView mv = new ModelAndView("admin_notice/event");
		return mv;
	}
	@RequestMapping("/admin_reivew.do")
	public ModelAndView AdminReview() {
		ModelAndView mv = new ModelAndView("admin_notice/reivew");
		return mv;
	}
	@RequestMapping("/admin_popslide.do")
	public ModelAndView AdminPs() {
		ModelAndView mv = new ModelAndView("admin_notice/popslide");
		return mv;
	}
	@RequestMapping("/admin_report.do")
	public ModelAndView Adminreport() {
		ModelAndView mv = new ModelAndView("admin_notice/report");
		return mv;
	}
	
	
	//공지사항 
	@RequestMapping("/ad_allnotice.do") //
	public ModelAndView AdminAllNotice() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_notice");
		return mv;
	}
	@RequestMapping("/ad_noticeform.do")//
	public ModelAndView AdminNoWriteForm() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_notice_writeform");
		return mv;
	}
	@RequestMapping("/adnotice_onelist.do")//
	public ModelAndView AdminNoOneList() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_notice_onelist");
		return mv;
	}
	@RequestMapping("/adnotice_update.do")//
	public ModelAndView AdminNoUpdate() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_notice_update");
		return mv;
	}
	@RequestMapping("/adnotice_delete.do")//
	public ModelAndView AdminNoDelete() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_notice_delete");
		return mv;
	}
	@RequestMapping("/return3.do")
	public ModelAndView AdminNolistlist() {
		ModelAndView mv = new ModelAndView("admin_notice/notice");
		return mv;
	}
	//테이블 삭제버튼
	@RequestMapping("/adnotice_deletetable.do")
	public ModelAndView AdminTableDelete() {
		ModelAndView mv = new ModelAndView("admin_notice/notice");
		return mv;
	}
	
		
	//Q&A
	@RequestMapping("/ad_allqa.do") 
	public ModelAndView AdminAllQa() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_qa");
		return mv;
	}
	@RequestMapping("/adqa_onelist_user.do")
	public ModelAndView AdminQaOneListUser() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_qa_onelist_user");
		return mv;
	}
	@RequestMapping("/adqa_writeform.do")
	public ModelAndView AdminWriteqw() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_qareply_writeform");
		return mv;
	}

	@RequestMapping("/adqa_delete.do")
	public ModelAndView AdminReDelete() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_qa_delete");
		return mv;
	}
	@RequestMapping("/adqa_update.do")
	public ModelAndView AdminReUpdate() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_qareply_update");
		return mv;
	}
	@RequestMapping("/adqa_onelist.do")
	public ModelAndView AdminReOnelist() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_qa_onelist");
		return mv;
	}
	
	
	@RequestMapping("/return4.do")
	public ModelAndView AdminGoQa() {
		ModelAndView mv = new ModelAndView("admin_notice/qa");
		return mv;
	}
	
	
	
	//이용안내 FAQ
	@RequestMapping("/ad_allfaq.do")
	public ModelAndView AdminAllFaq() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_faq");
		return mv;
	}
	
	@RequestMapping("/ad_faqform.do")
	public ModelAndView AdminFaqWriteForm() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_faq_writeform");
		return mv;
	}
	
	@RequestMapping("/return2.do")
	public ModelAndView AdminGoFqa() {
		ModelAndView mv = new ModelAndView("admin_notice/faq");
		return mv;
	}
	
	//이벤트
	@RequestMapping("/ad_eveall_go.do")
	public ModelAndView AdminAllEvent() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_event");
		return mv;
	}
	
	@RequestMapping("/ad_evewrite_go.do")
	public ModelAndView AdminEveWriteForm() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_event_writeform");
		return mv;
	}
	@RequestMapping("/adevent_update.do")
	public ModelAndView AdminEveUpdate() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_event_update");
		return mv;
	}
	@RequestMapping("/adevent_delete.do")
	public ModelAndView AdminEveDelete() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_event_delete");
		return mv;
	}
	@RequestMapping("/adevent_onelist.do")
	public ModelAndView AdminEveOnelist() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_event_onelist");
		return mv;
	}
	@RequestMapping("/return1.do")
	public ModelAndView AdminGoEvent() {
		ModelAndView mv = new ModelAndView("admin_notice/event");
		return mv;
	}
	
	//리뷰
	@RequestMapping("/ad_allreview.do")
	public ModelAndView AdminAllRev() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_review");
		return mv;
	}
	@RequestMapping("/adreview_delete.do")
	public ModelAndView AdminRevDelete() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_review_delete");
		return mv;
	}
	@RequestMapping("/adreview_write_reply.do")
	public ModelAndView AdminRevWritereply() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_review_writeform");
		return mv;
	}
	@RequestMapping("/bbs_adreview_update.do")
	public ModelAndView AdminRevUpdate() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_review_update");
		return mv;
	}
	@RequestMapping("/adreview_onelist.do")
	public ModelAndView AdminRevOnelist() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_review_onelist");
		return mv;
	}
	@RequestMapping("/adreview_onelist_user.do")
	public ModelAndView AdminRevOnelistUser() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_review_onelist_user");
		return mv;
	}
	
	@RequestMapping("/return6.do")
	public ModelAndView AdminGorev() {
		ModelAndView mv = new ModelAndView("admin_notice/reivew");
		return mv;
	}
	
	
	
	
	//신고
	@RequestMapping("/ad_allreport.do") 
	public ModelAndView AdminAllRep() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_report");
		return mv;
	}
	@RequestMapping("/adreport_delete.do") 
	public ModelAndView AdminRepDelete() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_report_delete");
		return mv;
	}
	@RequestMapping("/adreport_update.do") 
	public ModelAndView AdminRepUpdate() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_report_update");
		return mv;
	}
	@RequestMapping("/adreport_writeform.do") 
	public ModelAndView AdminRepWrite() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_report_writeform");
		return mv;
	}
	@RequestMapping("/ad_report_onelist.do") 
	public ModelAndView AdminRepOnelist() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_report_onelist");
		return mv;
	}
	@RequestMapping("/ad_report_onelist_user.do") 
	public ModelAndView AdminRepOnelistUser() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_report_onelist_user");
		return mv;
	}
	@RequestMapping("/return5.do")
	public ModelAndView AdminGorep() {
		ModelAndView mv = new ModelAndView("admin_notice/report");
		return mv;
	}
	
	//팝업 슬라이드 
	@RequestMapping("/allpopslide.do")
	public ModelAndView AdminPopWriteForm() {
		ModelAndView mv = new ModelAndView("/admin_notice/popslide_writeform");
		return mv;
	}
	
	@RequestMapping("/ad_popup.do")
	public ModelAndView AdminPopup() {
		ModelAndView mv = new ModelAndView("/admin_notice/popslide");
		return mv;
	}
}
	


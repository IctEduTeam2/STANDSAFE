package com.ict.admin.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

		// 페이징 처리를 위한 로직 추가
		int totalRecord = notiService.getTotalRecord(); // 전체 공지사항 레코드 수
		paging.setTotalRecord(totalRecord);
		
		if (totalRecord <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(totalRecord / paging.getNumPerPage());
			if (totalRecord % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		String cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));
		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}

		List<NoticeVO> list = notiService.getadnoticelist(paging.getOffset(), paging.getNumPerPage());
		
		//전체 공지사항, 등록된 공지사항, 삭제된 공지사항, 삭제된 공지사항의 개수 가져오기
		int totalNotices = notiService.getTotalNotices();
		int registeredNotices = notiService.getRegisteredNotices();
		int deletedNotices = notiService.getDeletedNotices();

		
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		
		mv.addObject("totalNotices", totalNotices);
		mv.addObject("registeredNotices", registeredNotices);
		mv.addObject("deletedNotices", deletedNotices);
		
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

	// 공지사항
	@RequestMapping("/ad_allnotice.do") //
	public ModelAndView AdminAllNotice() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_notice");
		return mv;
	}

	@RequestMapping("/ad_noticeform.do") //
	public ModelAndView AdminNoWriteForm() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_notice_writeform");
		return mv;
	}

	@RequestMapping("/adnotice_onelist.do") //
	public ModelAndView AdminNoOneList() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_notice_onelist");
		return mv;
	}

	@RequestMapping("/adnotice_update.do") //
	public ModelAndView AdminNoUpdate() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_notice_update");
		return mv;
	}

	@RequestMapping("/adnotice_delete.do") //
	public ModelAndView AdminNoDelete() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_notice_delete");
		return mv;
	}

	@RequestMapping("/return3.do")
	public ModelAndView AdminNolistlist() {
		ModelAndView mv = new ModelAndView("admin_notice/notice");
		return mv;
	}

	// 테이블 삭제버튼
	

	//게시물삭제검색버튼 
	@RequestMapping(value = "/adnotice_deleted.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adNotiDeleted(HttpServletRequest request, HttpSession session) {
	    // 여기에서 NOTICE_ST 값이 2인 데이터만 필터링하여 list를 가져옵니다.
	    List<NoticeVO> list = notiService.getDeletedNoti();

	    StringBuilder html = new StringBuilder();
	    int no = list.size(); // 번호를 내림차순으로 출력하기 위해 리스트 크기로 초기화
	    for (NoticeVO k : list) {
	        html.append("<tr>");
	        html.append("<td><input type='checkbox' name='chk' value='").append(k.getNOTICE_NUM()).append("' /></td>");
	        html.append("<td>").append(no).append("</td>");  // 번호 추가
	        html.append("<td>").append(k.getNOTICE_SUBJECT()).append("</td>");
	        html.append("<td>").append(k.getNOTICE_CONTENT()).append("</td>");
	        html.append("<td>").append(k.getNOTICE_FILE()).append("</td>");
	        html.append("<td>").append(k.getNOTICE_HIT()).append("</td>");
	        html.append("<td>").append(k.getNOTICE_DATE()).append("</td>");
	        html.append("<td>").append(k.getNOTICE_UPDATE()).append("</td>");
	        html.append("<td>").append(k.getNOTICE_WRITER()).append("</td>");
	        //html.append("<td>").append(k.getNOTICE_ST()).append("</td>");
	        html.append("<td>");
	        if (k.getNOTICE_ST().equals("1")) {
	            html.append("[등록]");
	        } else if (k.getNOTICE_ST().equals("2")) {
	            html.append("[삭제]");
	        } else {
	            html.append("[미등록]");
	        }
	        html.append("</td>");
	        html.append("</tr>");
	        no--;  // 번호 감소
	    }
	    return html.toString();
	}

	//검색버튼
	@RequestMapping(value = "/adnotice_search.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adNotiSearch(
			@RequestParam(value = "searchKey", required = false) String searchKey,
	        @RequestParam(value = "searchText", required = false) String searchText,
	        @RequestParam(value = "searchTitle", required = false) String searchTitle,
	        @RequestParam(value = "start1", required = false) String start1,
	        @RequestParam(value = "close1", required = false) String close1,
	        @RequestParam(value = "mg_type", required = false) String mg_type,
	        HttpServletRequest request, HttpSession session) {
		
		List<NoticeVO> list;	
		
	    // Step 1: 검색 조건 검증 (상태설정안하고 검색(전체리스트))
	    if(searchText == null || searchText.trim().isEmpty()) {
	    	list = notiService.getAllNotices();
	    }else {
	    	// Step 2: 검색 쿼리 실행
	    	list = notiService.adNotiSearch(searchKey, searchText, searchTitle, start1,close1, mg_type);   	
	    }

	    // Step 3: 결과를 HTML 형태로 가공
	    StringBuilder html = new StringBuilder();
	    int no = list.size(); // 번호를 내림차순으로 출력하기 위해 리스트 크기로 초기화
	    for (NoticeVO k : list) {
	        html.append("<tr>");
	        // 각 NoticeVO 객체에서 정보를 가져와 HTML을 구성합니다.
	        //html.append("<td><input type='checkbox' name='chk' value='").append(k.getNOTICE_NUM()).append("' /></td>");
	        html.append("<td><input type='checkbox' id ='checkvalue' name='chk' value='").append(k.getNOTICE_NUM()).append("' /></td>");
	        html.append("<input type='hidden' id ='checknum' name='checknum' value='").append(k.getNOTICE_NUM()).append("' />");   
	        System.out.println("게시글번호"+ k.getNOTICE_NUM());
	        html.append("<td>").append(k.getNOTICE_NUM()).append("</td>");
	        html.append("<td>").append(k.getNOTICE_SUBJECT()).append("</td>");
	        html.append("<td>").append(k.getNOTICE_CONTENT()).append("</td>");
	        html.append("<td>").append(k.getNOTICE_FILE()).append("</td>");
	        html.append("<td>").append(k.getNOTICE_HIT()).append("</td>");
	        html.append("<td>").append(k.getNOTICE_DATE()).append("</td>");
	        html.append("<td>").append(k.getNOTICE_UPDATE()).append("</td>");
	        html.append("<td>").append(k.getNOTICE_WRITER()).append("</td>");
	        //html.append("<td>").append(k.getNOTICE_ST()).append("</td>");
	        html.append("<td>");
	        if (k.getNOTICE_ST().equals("1")) {
	            html.append("[등록]");
	        } else if (k.getNOTICE_ST().equals("2")) {
	            html.append("[삭제]");
	        } else {
	            html.append("[미등록]");
	        }
	        html.append("</td>");
	        html.append("</tr>");
	        no--;  // 번호 감소
	    }
	    return html.toString();
	}

	//홈페이지 등록 버튼
	
	
	
	
	// Q&A
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

	// 이용안내 FAQ
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

	// 이벤트
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

	// 리뷰
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

	// 신고
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

	// 팝업 슬라이드
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

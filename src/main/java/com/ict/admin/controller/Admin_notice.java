package com.ict.admin.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.admin.model.service.NoticeService;
import com.ict.admin.model.vo.AdminVO;
import com.ict.admin.model.vo.EventVO;
import com.ict.admin.model.vo.FaqVO;
import com.ict.admin.model.vo.NoticeVO;
import com.ict.admin.model.vo.PopUpSVO;
import com.ict.admin.model.vo.QaVO;
import com.ict.admin.model.vo.ReVO;
import com.ict.admin.model.vo.ReportVO;
import com.ict.common.Paging;

@Controller
public class Admin_notice {

	@Autowired
	private NoticeService notiService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private Paging paging;

	@RequestMapping("/admin_logohome.do")
	public ModelAndView getAdminLoginOk(AdminVO adVO, HttpSession session) {
		// 입력한 id의 패스워드를 DB에 가져와서 입력한 pwd와 비교해서 맞으면 성공 틀리면 실패
		// id로 DB에 저장된 pwd 가져오기
		ModelAndView mv = new ModelAndView("/admin_main/index");
		return mv;
	}

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

		// 전체 공지사항, 등록된 공지사항, 삭제된 공지사항, 삭제된 공지사항의 개수 가져오기
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

		int totalQa = notiService.getTotalQa();
		int deletedQa = notiService.getDeletedQa();

		mv.addObject("totalQa", totalQa);
		mv.addObject("deletedQa", deletedQa);
		return mv;
	}

	@RequestMapping("/admin_faq.do")
	public ModelAndView AdminFaq() {
		ModelAndView mv = new ModelAndView("admin_notice/faq");
		int totalFaq = notiService.getTotalFaq();
		int registeredFaq = notiService.getRegisteredFaq();
		int deletedFaq = notiService.getDeletedFaq();

		mv.addObject("totalFaq", totalFaq);
		mv.addObject("registeredFaq", registeredFaq);
		mv.addObject("deletedFaq", deletedFaq);
		return mv;
	}

	@RequestMapping("/admin_event.do")
	public ModelAndView AdminEvent() {
		ModelAndView mv = new ModelAndView("admin_notice/event");
		int totalEvent = notiService.getTotalEvent();
		int registeredEvent = notiService.getRegisteredEvent();
		int deletedEvent = notiService.getDeletedEvent();

		mv.addObject("totalEvent", totalEvent);
		mv.addObject("registeredEvent", registeredEvent);
		mv.addObject("deletedEvent", deletedEvent);
		return mv;
	}

	@RequestMapping("/admin_reivew.do")
	public ModelAndView AdminReview() {
		ModelAndView mv = new ModelAndView("admin_notice/reivew");
		int totalReview = notiService.getTotalReview();
		int deletedReview = notiService.getDeletedReview();

		mv.addObject("totalReview", totalReview);
		mv.addObject("deletedReview", deletedReview);
		return mv;
	}

	@RequestMapping("/admin_report.do")
	public ModelAndView Adminreport() {
		ModelAndView mv = new ModelAndView("admin_notice/report");
		int totalReport = notiService.getTotalReport();
		int deletedReport = notiService.getDeletedReport();

		mv.addObject("totalReport", totalReport);
		mv.addObject("deletedReport", deletedReport);
		return mv;
	}
	
	@RequestMapping("/admin_popslide.do")
	public ModelAndView AdminPs() {
		ModelAndView mv = new ModelAndView("admin_notice/popslide");
		int totalPopup = notiService.getTotalPopup();
		int registeredPopup = notiService.getRegisteredPopup();
		int upregisteredPopup = notiService.getUnRegisteredPopup();
		int deletedPopup = notiService.getDeletedPopup();

		mv.addObject("totalPopup", totalPopup);
		mv.addObject("registeredPopup", registeredPopup);
		mv.addObject("upregisteredPopup", upregisteredPopup);
		mv.addObject("deletedPopup", deletedPopup);
		return mv;
	}


	// 공지사항
	@RequestMapping("/ad_allnotice.do") //
	public ModelAndView AdminAllNotice() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_notice");
		return mv;
	}

	// 작성 페이지 이동
	@RequestMapping("/ad_noticeform.do") //
	public ModelAndView AdminNoWriteForm(@ModelAttribute("NOTICE_NUM") String NOTICE_NUM, HttpSession session) {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_notice_writeform");
		return mv;
	}

	// 작성 완료 폼이동
	@RequestMapping("/ad_writenoti.do") //
	public ModelAndView AdminNoWriteForm(@ModelAttribute("NOTICE_NUM") String NOTICE_NUM,
			@ModelAttribute("NOTICE_SUBJECT") String NOTICE_SUBJECT, HttpSession session, HttpServletRequest request,
			NoticeVO mvo) {

		ModelAndView mv = new ModelAndView("redirect:/admin_notice.do");
		try {
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");

			MultipartFile f_param = mvo.getFile();
			if (f_param.isEmpty()) {
				mvo.setNOTICE_FILE("");
			} else {
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString() + "_" + mvo.getFile().getOriginalFilename();
				mvo.setNOTICE_FILE(f_name);

				byte[] in = mvo.getFile().getBytes();
				File out = new File(path, f_name);

				FileCopyUtils.copy(in, out);
			}

			String admin_name = (String) request.getSession().getAttribute("admin_name");
			mvo.setNOTICE_WRITER(admin_name);
			String num = (String) request.getSession().getAttribute("admin_num");

			mvo.setADMIN_NUM(num);
			mvo.setNOTICE_SUBJECT(NOTICE_SUBJECT);
			String type = request.getParameter("NOTICE_TYPE");
			// vo에 갖고온값 저장.
			mvo.setNOTICE_TYPE(type);
			int result = notiService.getNotiWriteOk(mvo);
			if (result > 0) {
				return mv;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}

	// 상세보기
	@RequestMapping("/adnotice_onelist.do") //
	public ModelAndView AdminNoOneList(@ModelAttribute("NOTICE_NUM") String NOTICE_NUM) {
		System.out.println("들? : " + NOTICE_NUM);
		int hit = notiService.getAdNoticeHitUpdate(NOTICE_NUM);
		ModelAndView mv = new ModelAndView("admin_bbs/ad_notice_onelist");
		NoticeVO mvo = notiService.getAdNoticeOneList(NOTICE_NUM);
		mv.addObject("mvo", mvo);

		return mv;
	}

	// 수정중 폼
	@RequestMapping("/adnotice_update.do") //
	public ModelAndView AdminNoUpdate(@ModelAttribute("NOTICE_NUM") String NOTICE_NUM,
			@ModelAttribute("cPage") String cPage, HttpSession session) {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_notice_update");
		System.out.println("왜? : " + NOTICE_NUM);
		NoticeVO mvo = notiService.getAdNoticeOneList(NOTICE_NUM);
		System.out.println("Returned mvo: " + mvo);
		mv.addObject("mvo", mvo);
		return mv;
	}

	// 수정완료
	@RequestMapping("/admin_updateOK.do") //
	public ModelAndView AdminNoUpOk(NoticeVO mvo, HttpServletRequest request, @ModelAttribute("cPage") String cPage,
			@ModelAttribute("NOTICE_NUM") String NOTICE_NUM, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		try {
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile f_param = mvo.getFile();

			if (f_param.isEmpty()) {
				mvo.setNOTICE_FILE(mvo.getOld_f_name());
			} else {

				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString() + "_" + mvo.getFile().getOriginalFilename();
				mvo.setNOTICE_FILE(f_name);

				byte[] in = mvo.getFile().getBytes();

				File out = new File(path, f_name);

				FileCopyUtils.copy(in, out);
			}

			// 관리자이름 갖고오기 - 작성자에 자동 뜨고 저장하기위함
			String admin_name = (String) request.getSession().getAttribute("admin_name");

			mvo.setNOTICE_WRITER(admin_name);

			// 관리자 admin_num 갖고오자. 디비에 넣어야한다.
			String num = (String) request.getSession().getAttribute("admin_num");

			mvo.setADMIN_NUM(num);

			// 라디오체크박스 값을 맴퍼에 보내기위해 가지고오기
			String type = request.getParameter("NOTICE_TYPE");

			// vo에 갖고온값 저장.
			mvo.setNOTICE_TYPE(type);

			int result = notiService.getNoticeUpdateOk(mvo);

			if (result > 0) {
				mv.setViewName("redirect:/adnotice_onelist.do");
				return mv;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}

	// 삭제되는 폼이동
	@RequestMapping("/adnotice_delete.do") //
	public ModelAndView AdminNoDelete(@ModelAttribute("NOTICE_NUM") String NOTICE_NUM,

			HttpSession session) {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_notice_delete");
		System.out.println("no1: " + NOTICE_NUM);
		return mv;
	}

	// 삭제완료 폼
	@RequestMapping("/admin_delpwdck.do") //
	public ModelAndView AdminNoDelChk(@ModelAttribute("pwd") String pwd,
			@ModelAttribute("NOTICE_NUM") String NOTICE_NUM,

			HttpServletRequest request, HttpSession session) {
		System.out.println("pwd : " + pwd);
		System.out.println("NOTICE_NUM : " + NOTICE_NUM);
		ModelAndView mv = new ModelAndView();

		// 로그인한 세션에 저장된 admin_num 갖고오기.
		String num = (String) request.getSession().getAttribute("admin_num");

		// 로그인한 회원의 비번갖고오기. 입력한 비번과 비교하기위함
		String dbpw = (String) request.getSession().getAttribute("dbpw");

		if (!passwordEncoder.matches(pwd, dbpw)) {
			System.out.println("틀린암호");
			mv.setViewName("admin_bbs/ad_notice_delete");
			mv.addObject("pwchk", "fail");
			return mv;

		} else {
			System.out.println("맞는암호");
			int del = notiService.NoticeDeleteOk(NOTICE_NUM);
			mv.setViewName("redirect:/admin_notice.do");
			return mv;
		}

	}

	@RequestMapping("/return3.do")
	public ModelAndView AdminNolistlist() {
		ModelAndView mv = new ModelAndView("admin_notice/notice");
		return mv;
	}

	// 테이블 삭제버튼
	@RequestMapping(value = "/adnotice_deleted1.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adNotiDeleted(HttpServletRequest request, HttpSession session,
			@RequestParam("selectedNotices[]") List<String> selectedNotices) {
		// 여기에서 NOTICE_ST 값이 2인 데이터만 필터링하여 list를 가져옵니다.
		for (String k : selectedNotices) {
			int del = notiService.upNotitabst(k);
		}
		String msg = "삭제 성공하였습니다.";
		return msg;
	}

	// 홈페이지 등록
	@RequestMapping(value = "/update_adnoticestatus.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String updateNoticeStatus(HttpServletRequest request, HttpSession session,
			@RequestParam("selectedNotices[]") List<String> selectedNotices) {
		// 여기에서 NOTICE_ST 값이 2인 데이터만 필터링하여 list를 가져옵니다.
		for (String k : selectedNotices) {
			int del = notiService.updateNoticeStatus(k);
		}
		String msg = "등록 성공하였습니다.";
		return msg;
	}

	// 게시물삭제검색버튼
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
			html.append("<td>").append(no).append("</td>"); // 번호 추가
			html.append("<td><a href='/adnotice_onelist.do?NOTICE_NUM=").append(k.getNOTICE_NUM()).append("'>")
					.append(k.getNOTICE_SUBJECT()).append("</a></td>");
			if (k.getNOTICE_FILE() == null || k.getNOTICE_FILE().isEmpty()) {
				html.append("<td>없음</td>");
			} else {
				html.append("<td>있음</td>");
			}
			html.append("<td>").append(k.getNOTICE_HIT()).append("</td>");
			html.append("<td>").append(k.getNOTICE_DATE()).append("</td>");
			html.append("<td>").append(k.getNOTICE_UPDATE()).append("</td>");
			html.append("<td>").append(k.getNOTICE_WRITER()).append("</td>");
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
			no--; // 번호 감소
		}
		return html.toString();
	}

	// 검색버튼
	@RequestMapping(value = "/adnotice_search.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adNotiSearch(@RequestParam(value = "searchKey", required = false) String searchKey,
			@RequestParam(value = "searchText", required = false) String searchText,
			@RequestParam(value = "searchTitle", required = false) String searchTitle,
			@RequestParam(value = "start1", required = false) String start1,
			@RequestParam(value = "close1", required = false) String close1,
			@RequestParam(value = "mg_type", required = false) String mg_type, HttpServletRequest request,
			HttpSession session) {

		List<NoticeVO> list;

		// Step 1: 검색 조건 검증 (상태설정안하고 검색(전체리스트))
		if (searchText == null && start1 == null && close1 == null) {
			list = notiService.getAllNotices();
		} else {
			// Step 2: 검색 쿼리 실행
			list = notiService.adNotiSearch(searchKey, searchText, searchTitle, start1, close1, mg_type);
		}

		// Step 3: 결과를 HTML 형태로 가공
		StringBuilder html = new StringBuilder();
		int no = list.size(); // 번호를 내림차순으로 출력하기 위해 리스트 크기로 초기화
		for (NoticeVO k : list) {
			html.append("<tr>");
			// 각 NoticeVO 객체에서 정보를 가져와 HTML을 구성합니다.
			html.append("<td><input type='checkbox' id ='checkvalue' name='chk' value='").append(k.getNOTICE_NUM())
					.append("' /></td>");
			html.append("<input type='hidden' id ='checknum' name='checknum' value='").append(k.getNOTICE_NUM())
					.append("' />");
			html.append("<td>").append(no).append("</td>");
			html.append("<td><a href='/adnotice_onelist.do?NOTICE_NUM=").append(k.getNOTICE_NUM()).append("'>")
					.append(k.getNOTICE_SUBJECT()).append("</a></td>");

			if (k.getNOTICE_FILE() == null || k.getNOTICE_FILE().isEmpty()) {
				html.append("<td>없음</td>");
			} else {
				html.append("<td>있음</td>");
			}
			String result = html.toString();
			html.append("<td>").append(k.getNOTICE_HIT()).append("</td>");
			html.append("<td>").append(k.getNOTICE_DATE()).append("</td>");
			html.append("<td>").append(k.getNOTICE_UPDATE()).append("</td>");
			html.append("<td>").append(k.getNOTICE_WRITER()).append("</td>");
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
			no--; // 번호 감소
		}
		return html.toString();
	}

	// Q&A
	// 삭제qna검색
	@RequestMapping(value = "/adqa_deleted.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adQaDelSearch(HttpServletRequest request, HttpSession session) {
		// 여기에서 BOARD_ST 값이 0인 데이터만 필터링하여 list를 가져옵니다.
		List<QaVO> list = notiService.getDeleQa();

		StringBuilder html = new StringBuilder();
		int no = list.size(); // 번호를 내림차순으로 출력하기 위해 리스트 크기로 초기화
		for (QaVO k : list) {
			html.append("<tr>");
			html.append("<td><input type='checkbox' name='chk' value='").append(k.getBOARD_NUM()).append("' /></td>");
			html.append("<td>").append(no).append("</td>"); // 번호 추가
			if (k.getADMIN_NUM() != null) {
				html.append("<td id='RE'>").append("　　[Re]").append("<a href='/adqa_onelist_user.do?BOARD_NUM=")
						.append(k.getBOARD_NUM()).append("'>").append(k.getBOARD_SUBJECT()).append("</a></td>");
			} else {
				html.append("<td id='RE'>").append("<a href='/adqa_onelist_user.do?BOARD_NUM=").append(k.getBOARD_NUM())
						.append("'>").append(k.getBOARD_SUBJECT()).append("</a></td>");
			}
			if (k.getBOARD_FILE() == null || k.getBOARD_FILE().isEmpty()) {
				html.append("<td>없음</td>");
			} else {
				html.append("<td>있음</td>");
			}
			
			html.append("<td>").append(k.getBOARD_DATE()).append("</td>");
			html.append("<td>").append(k.getBOARD_UPDATE()).append("</td>");
			html.append("<td>").append(k.getBOARD_WRITER()).append("</td>");
			html.append("<td>");
			if (k.getBOARD_ST().equals("1")) {
				html.append("[답변대기]");
			} else if (k.getBOARD_ST().equals("2")) {
				html.append("[답변완료]");
			} else if (k.getBOARD_ST().equals("3")) {
				html.append("");
			}

			html.append("</td>");
			html.append("</tr>");
			no--; // 번호 감소
		}
		return html.toString();
	}

	// 검색
	@RequestMapping(value = "/adqa_search.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adQaSearch(@RequestParam(value = "searchKey", required = false) String searchKey,
			@RequestParam(value = "searchText", required = false) String searchText,
			@RequestParam(value = "searchTitle", required = false) String searchTitle,
			@RequestParam(value = "start1", required = false) String start1,
			@RequestParam(value = "close1", required = false) String close1,
			@RequestParam(value = "mg_type", required = false) String mg_type, HttpServletRequest request,
			HttpSession session) {
		List<QaVO> list;

		// Step 1: 검색 조건 검증 (상태설정안하고 검색(전체리스트))
		if (searchText == null && start1 == null && close1 == null) {
			list = notiService.getAllQa();
		} else {
			// Step 2: 검색 쿼리 실행
			list = notiService.adSearchQa(searchKey, searchText, searchTitle, start1, close1, mg_type);
		}

		// Step 3: 결과를 HTML 형태로 가공
		StringBuilder html = new StringBuilder();
		int no = list.size(); // 번호를 내림차순으로 출력하기 위해 리스트 크기로 초기화
		for (QaVO k : list) {
			html.append("<tr>");
			// 각 NoticeVO 객체에서 정보를 가져와 HTML을 구성합니다.
			html.append("<td><input type='checkbox' id ='checkvalue' name='chk' value='").append(k.getBOARD_NUM())
					.append("' /></td>");
			html.append("<input type='hidden' id ='checknum' name='checknum' value='").append(k.getBOARD_NUM())
					.append("' />");
			html.append("<td>").append(no).append("</td>");
			if (k.getBOARD_ST().equals("3")) {
				html.append("<td id='RE'>").append("　　[Re]").append("<a href='/adqa_onelist_user.do?BOARD_NUM=")
						.append(k.getBOARD_NUM()).append("'>").append(k.getBOARD_SUBJECT()).append("</a></td>");
			} else {
				html.append("<td id='RE'>").append("<a href='/adqa_onelist_user.do?BOARD_NUM=").append(k.getBOARD_NUM())
						.append("'>").append(k.getBOARD_SUBJECT()).append("</a></td>");
			}

			if (k.getBOARD_FILE() == null || k.getBOARD_FILE().isEmpty()) {
				html.append("<td>없음</td>");
			} else {
				html.append("<td>있음</td>");
			}

			String result = html.toString();
			html.append("<td>").append(k.getBOARD_DATE()).append("</td>");
			html.append("<td>").append(k.getBOARD_UPDATE()).append("</td>");
			html.append("<td>").append(k.getBOARD_WRITER()).append("</td>");
			html.append("<td>");
			if (k.getBOARD_ST().equals("1")) {
				html.append("[답변대기]");
			} else if (k.getBOARD_ST().equals("2")) {
				html.append("[답변완료]");
			} else if (k.getADMIN_NUM() != null) {
				html.append("");
			}
			html.append("</td>");
			html.append("</tr>");
			no--; // 번호 감소
		}
		return html.toString();
	}

	// 테이블 삭제버튼
	@RequestMapping(value = "/adqa_deleted1.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adQaDeleted(HttpServletRequest request, HttpSession session,
			@RequestParam("selectedQa[]") List<String> selectedQa) {
		// 여기에서 BOARD_ST 값이 0인 데이터만 필터링하여 list를 가져옵니다.
		for (String k : selectedQa) {
			int del = notiService.upQatabst(k);
		}
		String msg = "삭제 성공하였습니다.";
		return msg;
	}

	// qa 사용자 상세화면
	@RequestMapping("/adqa_onelist_user.do")
	public ModelAndView AdminQaOneListUser(HttpServletRequest request, HttpSession session,
			@ModelAttribute("BOARD_NUM") String BOARD_NUM) {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_qa_onelist_user");
		QaVO qvo = notiService.getQaOneList(BOARD_NUM);
		mv.addObject("qvo", qvo);
		return mv;
	}

	// 삭제완료 폼이동
	@RequestMapping("/adqa_delete.do")
	public ModelAndView AdminQaDelete(HttpServletRequest request, HttpSession session,
			@ModelAttribute("BOARD_NUM") String BOARD_NUM) {
		System.out.println("BOARD_NUM : " + BOARD_NUM);
		ModelAndView mv = new ModelAndView("admin_bbs/ad_qa_delete");
		return mv;
	}

	// 삭제완료 찐
	@RequestMapping("/admin_qa_del_ok.do")
	public ModelAndView AdminQaDel(HttpServletRequest request, HttpSession session,
			@ModelAttribute("BOARD_NUM") String BOARD_NUM, @ModelAttribute("pwd") String pwd) {
		System.out.println("pwd : " + pwd);
		System.out.println("NOTICE_NUM : " + BOARD_NUM);
		ModelAndView mv = new ModelAndView();

		// 로그인한 세션에 저장된 admin_num 갖고오기.
		String num = (String) request.getSession().getAttribute("admin_num");

		// 로그인한 회원의 비번갖고오기. 입력한 비번과 비교하기위함
		String dbpw = (String) request.getSession().getAttribute("dbpw");

		if (!passwordEncoder.matches(pwd, dbpw)) {
			System.out.println("틀린암호");
			mv.setViewName("admin_bbs/ad_qa_delete");
			mv.addObject("pwchk", "fail");
			return mv;

		} else {
			System.out.println("맞는암호");
			int del = notiService.QaDeleteOk(BOARD_NUM);
			mv.setViewName("redirect:/admin_qa.do");
			return mv;
		}
	}

	// 답글
	@RequestMapping("/adqa_writeform.do")
	public ModelAndView getAnsInsertForm(@ModelAttribute("BOARD_NUM") String BOARD_NUM,
			@ModelAttribute("BOARD_TYPE") String BOARD_TYPE) {
		return new ModelAndView("admin_bbs/ad_qareply_writeform");
		// form태그안에있던 cpage랑 idx를 다시 reply_write.jsp로 넘겨야한다.
	}

	@RequestMapping("/admin_qa_repleok.do")
	public ModelAndView getAnsWriteOk(@ModelAttribute("BOARD_NUM") String BOARD_NUM, QaVO qvo,
			HttpServletRequest request) {
		System.out.println("BOARD_NUM : " + BOARD_NUM);
		ModelAndView mv = new ModelAndView("redirect:/admin_qa.do");
		try {
			// 상세보기에서 그룹, 스텝 레브를 가져온다.
			// 뭐에대한 댓글인지 알려면 원글번호를 먼저 알아야한다. 그래서 그룹수를 갖고와야 몇번의 답글인지알고
			// 스텝은 +1 을 해줘야 댓글, 대댓글 대대댓글을 알수있다. 그리고 레벨은 순번조정하기위해 번호를 조정해야한다.
			// 상세보기의 idx르 갖고오면 그룹스텝레벨을 알수가있다.
			QaVO qavo = notiService.getQaOneList(BOARD_NUM);
			String c_num = qavo.getCLIENT_NUM();
			qvo.setCLIENT_NUM(c_num);
			String p_num = qavo.getPROD_NUM();
			if (p_num == null) {
				qvo.setPROD_NUM(null);
			} else {
				qvo.setPROD_NUM(p_num);
			}
			int st = notiService.getStUpdate(BOARD_NUM);
			int groups = Integer.parseInt(qavo.getBOARD_GROUPS());
			int step = Integer.parseInt(qavo.getBOARD_STEP());
			int lev = Integer.parseInt(qavo.getBOARD_LEV());

			// 스텝과 레벨을 하나씩 증가시켜주자.
			step++;
			lev++; // 이건 db에는 안올라가있다.

			// 디비에 레벨을 업데이트하자.
			// **그룹수와 같은 원글을 찾아서 레벨이 같거나 크면 레벨을 증가시키자.**
			// (스텝은 나중에)
			// vo도 써도되고, 맵을 써도된다.하지만 여기서는 vo가 갖고있는값은 증가 되어있지않아서 map을 쓰는게 편하겠다.
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("groups", groups);
			map.put("lev", lev);

			int result = notiService.getLevUpdate(map);

			// bvo가 증가가 안되었기때문에 증가시키는 일처리
			qvo.setBOARD_GROUPS(String.valueOf(groups));
			qvo.setBOARD_STEP(String.valueOf(step));
			qvo.setBOARD_LEV(String.valueOf(lev));
			// 위에서 증가시킨것을스트링으로 변환 후 setter로 입력시키자.
			// 변화가 있는건 스텝과 레벨이고 그룹은 변화가 없어서 두개만 집어넣기.
			// 암호화와 첨부파일 처리
			// 첨부
			String path = request.getSession().getServletContext().getRealPath("/resources/images");
			MultipartFile f_param = qvo.getFile();
			if (f_param.isEmpty()) {
				qvo.setBOARD_FILE("");
			} else {
				// 같은이름없도록
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString() + "_" + qvo.getFile().getOriginalFilename();
				qvo.setBOARD_FILE(f_name);

				// 이미지저장.
				byte[] in = qvo.getFile().getBytes();
				File out = new File(path, f_name);
				FileCopyUtils.copy(in, out);
			}

			// 비번을 암호화

			String admin_name = (String) request.getSession().getAttribute("admin_name");
			qvo.setBOARD_WRITER(admin_name);
			String num = (String) request.getSession().getAttribute("admin_num");

			qvo.setADMIN_NUM(num);
			String type = request.getParameter("BOARD_TYPE");
			String type1 = request.getParameter("BOARD_SUBJECT");
			System.out.println(type);
			System.out.println(type1);
			// vo에 갖고온값 저장.
			qvo.setBOARD_TYPE(type);
			qvo.setBOARD_SUBJECT(type1);
			// 삽입
			int res = notiService.getAnsWriteOk(qvo);
			mv.addObject("admin_name", admin_name);
			return mv;

		} catch (Exception e) {
			System.out.println("여기로오니?" + e);
			return null;

		}
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
	// 삭제게시물 검색
	@RequestMapping(value = "/adfaq_deleted.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adFaqDeleted(HttpServletRequest request, HttpSession session) {
		// 여기에서 NOTICE_ST 값이 2인 데이터만 필터링하여 list를 가져옵니다.
		List<FaqVO> list = notiService.getDeleFaq();

		StringBuilder html = new StringBuilder();
		int no = list.size(); // 번호를 내림차순으로 출력하기 위해 리스트 크기로 초기화
		for (FaqVO k : list) {
			html.append("<tr>");
			html.append("<td><input type='checkbox' name='chk' value='").append(k.getFA_NUM()).append("' /></td>");
			html.append("<td>").append(no).append("</td>"); // 번호 추가
			//html.append("<td><a href='/bbs_faq_onelist.do?FA_NUM=").append(k.getFA_NUM()).append("'>").append("Q.　").append(k.getFA_SUBJECT()).append("</a></td>");
			html.append("<td>").append("Q.　").append(k.getFA_SUBJECT()).append("</td>");

			
			String answerWithoutPTags = k.getFA_ANSWER().replaceAll("<p>", "").replaceAll("</p>", "");
            html.append("<td>").append("A.　").append(answerWithoutPTags).append("</td>");
			html.append("<td>").append(k.getFA_DATE()).append("</td>");
			html.append("<td>").append(k.getFA_UPDATE()).append("</td>");
			html.append("<td>").append(k.getFA_WRITER()).append("</td>");
			// html.append("<td>").append(k.getNOTICE_ST()).append("</td>");
			html.append("<td>");
			if (k.getFA_ST().equals("1")) {
				html.append("[등록]");
			} else if (k.getFA_ST().equals("2")) {
				html.append("[삭제]");
			} else {
				html.append("[미등록]");
			}
			html.append("</td>");
			html.append("</tr>");
			no--; // 번호 감소
		}
		return html.toString();
	}

	// 검색버튼
	@RequestMapping(value = "/adfaq_search.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adFaqSearch(@RequestParam(value = "searchKey", required = false) String searchKey,
			@RequestParam(value = "searchText", required = false) String searchText,
			@RequestParam(value = "searchTitle", required = false) String searchTitle,
			@RequestParam(value = "start1", required = false) String start1,
			@RequestParam(value = "close1", required = false) String close1,
			@RequestParam(value = "mg_type", required = false) String mg_type, HttpServletRequest request,
			HttpSession session) {

		List<FaqVO> list;

		// Step 1: 검색 조건 검증 (상태설정안하고 검색(전체리스트))
		if (searchText == null && start1 == null && close1 == null) {
			list = notiService.getAllFaq();
		} else {
			// Step 2: 검색 쿼리 실행
			list = notiService.adFaqSearch(searchKey, searchText, searchTitle, start1, close1, mg_type);
		}

		// Step 3: 결과를 HTML 형태로 가공
		StringBuilder html = new StringBuilder();
		int no = list.size(); // 번호를 내림차순으로 출력하기 위해 리스트 크기로 초기화
		for (FaqVO k : list) {
			html.append("<tr>");
			// 각 NoticeVO 객체에서 정보를 가져와 HTML을 구성합니다.
			html.append("<td><input type='checkbox' id ='checkvalue' name='chk' value='").append(k.getFA_NUM())
					.append("' /></td>");
			html.append("<input type='hidden' id ='checknum' name='checknum' value='").append(k.getFA_NUM())
					.append("' />");
			
			html.append("<td>").append(no).append("</td>");
//			html.append("<td><a href='/bbs_faq_onelist.do?FA_NUM=").append(k.getFA_NUM()).append("'>").append("Q.　").append(k.getFA_SUBJECT()).append("</a></td>");
			html.append("<td>").append("Q.　").append(k.getFA_SUBJECT()).append("</td>");
			String result = html.toString();
			
			String answerWithoutPTags = k.getFA_ANSWER().replaceAll("<p>", "").replaceAll("</p>", "");
            html.append("<td>").append("A.　").append(answerWithoutPTags).append("</td>");
			html.append("<td>").append(k.getFA_DATE()).append("</td>");
			html.append("<td>").append(k.getFA_UPDATE()).append("</td>");
			html.append("<td>").append(k.getFA_WRITER()).append("</td>");
			
			html.append("<td>");
			if (k.getFA_ST().equals("1")) {
				html.append("[등록]");
			} else if (k.getFA_ST().equals("2")) {
				html.append("[삭제]");
			} else {
				html.append("[미등록]");
			}
			html.append("</td>");
			html.append("</tr>");
			no--; // 번호 감소
		}
		return html.toString();
	}

	// 테이블 삭제버튼
	@RequestMapping(value = "/adfaq_deleted1.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adFaqDeleted(HttpServletRequest request, HttpSession session,
			@RequestParam("selectedFaq[]") List<String> selectedFaq) {
		// 여기에서 NOTICE_ST 값이 2인 데이터만 필터링하여 list를 가져옵니다.
		for (String k : selectedFaq) {
			int del = notiService.upFaqtabst(k);
		}
		String msg = "삭제 성공하였습니다.";
		return msg;
	}

	// 홈페이지 등록
	@RequestMapping(value = "/update_adfaqstatus.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String upFAQStatus(HttpServletRequest request, HttpSession session,
			@RequestParam("selectedFaq[]") List<String> selectedFaq) {
		// 여기에서 NOTICE_ST 값이 2인 데이터만 필터링하여 list를 가져옵니다.
		for (String k : selectedFaq) {
			int del = notiService.updateFaqStatus(k);
		}
		String msg = "등록 성공하였습니다.";
		return msg;
	}

	// 작성 페이지 이동
	@RequestMapping("/ad_faqform.do") //
	public ModelAndView AdminFaqWriteForm(@ModelAttribute("FA_NUM") String FA_NUM, HttpSession session) {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_faq_writeform");
		return mv;
	}

	// 작성 완료 폼이동
	@RequestMapping("/ad_writefaq.do") //
	public ModelAndView AdminFaqWriteForm(@ModelAttribute("FA_NUM") String FA_NUM,
			@ModelAttribute("FA_SUBJECT") String FA_SUBJECT, HttpSession session, HttpServletRequest request,
			FaqVO faqvo) {

		ModelAndView mv = new ModelAndView("redirect:/admin_faq.do");
		try {
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			String admin_name = (String) request.getSession().getAttribute("admin_name");
			faqvo.setFA_WRITER(admin_name);
			String num = (String) request.getSession().getAttribute("admin_num");

			faqvo.setADMIN_NUM(num);
			faqvo.setFA_SUBJECT(FA_SUBJECT);
			String type = request.getParameter("FA_TYPE");
			// vo에 갖고온값 저장.
			faqvo.setFA_TYPE(type);
			int result = notiService.getFaqWriteOk(faqvo);
			if (result > 0) {
				return mv;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
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

	// 게시물삭제검색버튼
	@RequestMapping(value = "/adevent_deleted.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adEventDeleted(HttpServletRequest request, HttpSession session) {
		// 여기에서 NOTICE_ST 값이 2인 데이터만 필터링하여 list를 가져옵니다.
		List<EventVO> list = notiService.getDeletedEve();

		StringBuilder html = new StringBuilder();
		int no = list.size(); // 번호를 내림차순으로 출력하기 위해 리스트 크기로 초기화
		for (EventVO k : list) {
			html.append("<tr>");
			html.append("<td><input type='checkbox' name='chk' value='").append(k.getEVENT_NUM()).append("' /></td>");
			html.append("<td>").append(no).append("</td>"); // 번호 추가
			html.append("<td><a href='/adevent_onelist.do?EVENT_NUM=").append(k.getEVENT_NUM()).append("'>")
					.append(k.getEVENT_SUBJECT()).append("</a></td>");
			html.append("<td>").append(k.getEVENT_CONTENT()).append("</td>");
			if (k.getEVENT_FILE() == null || k.getEVENT_FILE().isEmpty()) {
				html.append("<td>없음</td>");
			} else {
				html.append("<td>있음</td>");
			}
			
			html.append("<td>").append(k.getEVENT_DATE()).append("</td>");
			html.append("<td>").append(k.getEVENT_UPDATE()).append("</td>");
			html.append("<td>").append(k.getEVENT_WRITER()).append("</td>");
			html.append("<td>");
			if (k.getEVENT_ST().equals("1")) {
				html.append("[등록]");
			} else if (k.getEVENT_ST().equals("2")) {
				html.append("[삭제]");
			} else {
				html.append("[미등록]");
			}
			html.append("</td>");
			html.append("</tr>");
			no--; // 번호 감소
		}
		return html.toString();
	}

	// 검색버튼
	@RequestMapping(value = "/adevent_search.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adEventSearch(@RequestParam(value = "searchKey", required = false) String searchKey,
			@RequestParam(value = "searchText", required = false) String searchText,
			@RequestParam(value = "searchTitle", required = false) String searchTitle,
			@RequestParam(value = "start1", required = false) String start1,
			@RequestParam(value = "close1", required = false) String close1,
			@RequestParam(value = "mg_type", required = false) String mg_type, HttpServletRequest request,
			HttpSession session) {

		List<EventVO> list;

		// Step 1: 검색 조건 검증 (상태설정안하고 검색(전체리스트))
		if (searchText == null && start1 == null && close1 == null) {
			list = notiService.getAllEvent();
		} else {
			// Step 2: 검색 쿼리 실행
			list = notiService.adEventSearch(searchKey, searchText, searchTitle, start1, close1, mg_type);
		}

		// Step 3: 결과를 HTML 형태로 가공
		StringBuilder html = new StringBuilder();
		int no = list.size(); // 번호를 내림차순으로 출력하기 위해 리스트 크기로 초기화
		for (EventVO k : list) {
			html.append("<tr>");
			// 각 NoticeVO 객체에서 정보를 가져와 HTML을 구성합니다.
			html.append("<td><input type='checkbox' id ='checkvalue' name='chk' value='").append(k.getEVENT_NUM())
					.append("' /></td>");
			html.append("<input type='hidden' id ='checknum' name='checknum' value='").append(k.getEVENT_NUM())
					.append("' />");
			// html.append("<td>").append(k.getNOTICE_NUM()).append("</td>");
			html.append("<td>").append(no).append("</td>");
			html.append("<td><a href='/adevent_onelist.do?EVENT_NUM=").append(k.getEVENT_NUM()).append("'>")
					.append(k.getEVENT_SUBJECT()).append("</a></td>");
			html.append("<td>").append(k.getEVENT_CONTENT()).append("</td>");
			// html.append("<td>").append(k.getNOTICE_FILE()).append("</td>");
			if (k.getEVENT_FILE() == null || k.getEVENT_FILE().isEmpty()) {
				html.append("<td>없음</td>");
			} else {
				html.append("<td>있음</td>");
			}

			String result = html.toString();
			
			html.append("<td>").append(k.getEVENT_DATE()).append("</td>");
			html.append("<td>").append(k.getEVENT_UPDATE()).append("</td>");
			html.append("<td>").append(k.getEVENT_WRITER()).append("</td>");
			// html.append("<td>").append(k.getNOTICE_ST()).append("</td>");
			html.append("<td>");
			if (k.getEVENT_ST().equals("1")) {
				html.append("[등록]");
			} else if (k.getEVENT_ST().equals("2")) {
				html.append("[삭제]");
			} else {
				html.append("[미등록]");
			}
			html.append("</td>");
			html.append("</tr>");
			no--; // 번호 감소
		}
		return html.toString();
	}

	// 테이블 삭제버튼
	@RequestMapping(value = "/adevent_deleted1.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adeveDeleted(HttpServletRequest request, HttpSession session,
			@RequestParam("selectedEvent[]") List<String> selectedEvent) {
		// 여기에서 NOTICE_ST 값이 2인 데이터만 필터링하여 list를 가져옵니다.
		for (String k : selectedEvent) {
			System.out.println("k : " + k);
			int del = notiService.upevetabst(k);
		}
		String msg = "삭제 성공하였습니다.";
		return msg;
	}

	// 홈페이지 등록
	@RequestMapping(value = "/update_adeventstatus.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String upEventStatus(HttpServletRequest request, HttpSession session,
			@RequestParam("selectedEvent[]") List<String> selectedEvent) {
		// 여기에서 NOTICE_ST 값이 2인 데이터만 필터링하여 list를 가져옵니다.
		for (String k : selectedEvent) {
			int del = notiService.updateEventStatus(k);
		}
		String msg = "등록 성공하였습니다.";
		return msg;
	}

	// 작성 페이지 이동
	@RequestMapping("/ad_eventform.do") //
	public ModelAndView AdminEveWriteForm(@ModelAttribute("EVENT_NUM") String EVENT_NUM, HttpSession session) {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_event_writeform");
		return mv;
	}

	// 작성 완료 폼이동
	@RequestMapping("/ad_writeeve.do") //
	public ModelAndView AdminEventForm(@ModelAttribute("EVENT_NUM") String EVENT_NUM,
			@ModelAttribute("EVENT_SUBJECT") String EVENT_SUBJECT, HttpSession session, HttpServletRequest request,
			EventVO evevo) {

		ModelAndView mv = new ModelAndView("redirect:/admin_event.do");
		try {
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");

			MultipartFile f_param = evevo.getFile();
			if (f_param.isEmpty()) {
				evevo.setEVENT_FILE("");
			} else {
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString() + "_" + evevo.getFile().getOriginalFilename();
				evevo.setEVENT_FILE(f_name);

				byte[] in = evevo.getFile().getBytes();
				File out = new File(path, f_name);

				FileCopyUtils.copy(in, out);
			}

			String admin_name = (String) request.getSession().getAttribute("admin_name");
			evevo.setEVENT_WRITER(admin_name);
			String num = (String) request.getSession().getAttribute("admin_num");

			evevo.setADMIN_NUM(num);
			evevo.setEVENT_SUBJECT(EVENT_SUBJECT);
			String type = request.getParameter("EVENT_TYPE");
			// vo에 갖고온값 저장.
			evevo.setEVENT_TYPE(type);
			int result = notiService.getEveWriteOk(evevo);
			if (result > 0) {
				return mv;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}

	// 상세보기
	@RequestMapping("/adevent_onelist.do") //
	public ModelAndView AdminEveOnelist(@ModelAttribute("EVENT_NUM") String EVENT_NUM) {
		System.out.println("들4? : " + EVENT_NUM);
		int hit = notiService.getAdEveHitUpdate(EVENT_NUM);
		ModelAndView mv = new ModelAndView("admin_bbs/ad_event_onelist");
		EventVO evevo = notiService.getAdEveOnelist(EVENT_NUM);
		mv.addObject("evevo", evevo);
		return mv;
	}

	// 수정중 폼
	@RequestMapping("/adevent_update.do") //
	public ModelAndView AdminNoUpdate(@ModelAttribute("EVENT_NUM") String EVENT_NUM,
			// @ModelAttribute("cPage")String cPage,
			HttpSession session) {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_event_update");
		System.out.println("왜? : " + EVENT_NUM);
		EventVO evevo = notiService.getAdEveOnelist(EVENT_NUM);
		System.out.println("Returned mvo: " + evevo);
		mv.addObject("evevo", evevo);
		return mv;
	}

	// 수정완료
	@RequestMapping("/admin_upEveOK.do") //
	public ModelAndView AdminEUpOk(EventVO evevo, HttpServletRequest request,
			// @ModelAttribute("cPage")String cPage,
			@ModelAttribute("EVENT_NUM") String EVENT_NUM, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		try {
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile f_param = evevo.getFile();

			if (f_param.isEmpty()) {
				evevo.setEVENT_FILE(evevo.getOld_f_name());
			} else {

				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString() + "_" + evevo.getFile().getOriginalFilename();
				evevo.setEVENT_FILE(f_name);

				byte[] in = evevo.getFile().getBytes();

				File out = new File(path, f_name);

				FileCopyUtils.copy(in, out);
			}

			// 관리자이름 갖고오기 - 작성자에 자동 뜨고 저장하기위함
			String admin_name = (String) request.getSession().getAttribute("admin_name");

			evevo.setEVENT_WRITER(admin_name);

			// 관리자 admin_num 갖고오자. 디비에 넣어야한다.
			String num = (String) request.getSession().getAttribute("admin_num");

			evevo.setADMIN_NUM(num);

			// 라디오체크박스 값을 맴퍼에 보내기위해 가지고오기
			String type = request.getParameter("EVENT_TYPE");

			// vo에 갖고온값 저장.
			evevo.setEVENT_TYPE(type);

			int result = notiService.getEeUpdateOk(evevo);

			if (result > 0) {
				mv.setViewName("redirect:/adevent_onelist.do");
				return mv;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}

	// 삭제되는 폼이동
	@RequestMapping("/adevent_delete.do")
	public ModelAndView AdminEDelete(@ModelAttribute("EVENT_NUM") String EVENT_NUM,

			HttpSession session) {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_event_delete");
		System.out.println("no1: " + EVENT_NUM);
		return mv;
	}

	// 삭제완료 폼
	@RequestMapping("/admin_delepwck.do") //
	public ModelAndView AdminEveDelChk(@ModelAttribute("pwd") String pwd, @ModelAttribute("EVENT_NUM") String EVENT_NUM,

			HttpServletRequest request, HttpSession session) {
		System.out.println("pwd : " + pwd);
		System.out.println("EVENT_NUM : " + EVENT_NUM);
		ModelAndView mv = new ModelAndView();

		// 로그인한 세션에 저장된 admin_num 갖고오기.
		String num = (String) request.getSession().getAttribute("admin_num");

		// 로그인한 회원의 비번갖고오기. 입력한 비번과 비교하기위함
		String dbpw = (String) request.getSession().getAttribute("dbpw");

		if (!passwordEncoder.matches(pwd, dbpw)) {
			System.out.println("틀린암호");
			mv.setViewName("admin_bbs/ad_event_delete");
			mv.addObject("pwchk", "fail");
			return mv;

		} else {
			System.out.println("맞는암호");
			int del = notiService.EventDeleteOk(EVENT_NUM);
			mv.setViewName("redirect:/admin_event.do");
			return mv;
		}

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

	// 리뷰
	// 삭제 리뷰검색
	@RequestMapping(value = "/adrev_deleted.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adRevDelSearch(HttpServletRequest request, HttpSession session) {
		// 여기에서 BOARD_ST 값이 0인 데이터만 필터링하여 list를 가져옵니다.
		List<ReVO> list = notiService.getDeleRev();

		StringBuilder html = new StringBuilder();
		int no = list.size(); // 번호를 내림차순으로 출력하기 위해 리스트 크기로 초기화
		for (ReVO k : list) {
			html.append("<tr>");
			html.append("<td><input type='checkbox' name='chk' value='").append(k.getRE_NUM()).append("' /></td>");
			html.append("<td>").append(no).append("</td>"); // 번호 추가
			if (k.getADMIN_NUM() != null) {
				html.append("<td id='RE'>").append("　　[Re]").append("<a href='/adreview_onelist_user.do?RE_NUM=")
						.append(k.getRE_NUM()).append("'>").append(k.getRE_SUBJECT()).append("</a></td>");
			} else {
				html.append("<td id='RE'>").append("<a href='/adreview_onelist_user.do?RE_NUM=").append(k.getRE_NUM())
						.append("'>").append(k.getRE_SUBJECT()).append("</a></td>");
			}
			if (k.getRE_FILE() == null || k.getRE_FILE().isEmpty()) {
				html.append("<td>없음</td>");
			} else {
				html.append("<td>있음</td>");
			}
			// html.append("<td>").append(k.getRE_HIT()).append("</td>");
			html.append("<td>").append(k.getRE_DATE()).append("</td>");
			html.append("<td>").append(k.getRE_UPDATE()).append("</td>");
			html.append("<td>").append(k.getRE_WRITER()).append("</td>");
			// html.append("<td>").append(k.getNOTICE_ST()).append("</td>");
			html.append("<td>");
			if (k.getRE_ST().equals("1")) {
				html.append("[답변대기]");
			} else if (k.getRE_ST().equals("2")) {
				html.append("[답변완료]");
			} else if (k.getRE_ST().equals("3")) {
				html.append("");
			}

			html.append("</td>");
			html.append("</tr>");
			no--; // 번호 감소
		}
		return html.toString();
	}

	// 검색
	@RequestMapping(value = "/adrev_search.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adRevSearch(@RequestParam(value = "searchKey", required = false) String searchKey,
			@RequestParam(value = "searchText", required = false) String searchText,
			@RequestParam(value = "searchTitle", required = false) String searchTitle,
			@RequestParam(value = "start1", required = false) String start1,
			@RequestParam(value = "close1", required = false) String close1,
			@RequestParam(value = "mg_type", required = false) String mg_type, HttpServletRequest request,
			HttpSession session) {
		List<ReVO> list;

		// Step 1: 검색 조건 검증 (상태설정안하고 검색(전체리스트))
		if (searchText == null && start1 == null && close1 == null) {
			list = notiService.getAllRev();
		} else {
			// Step 2: 검색 쿼리 실행
			list = notiService.adSearchRev(searchKey, searchText, searchTitle, start1, close1, mg_type);
		}

		// Step 3: 결과를 HTML 형태로 가공
		StringBuilder html = new StringBuilder();
		int no = list.size(); // 번호를 내림차순으로 출력하기 위해 리스트 크기로 초기화
		for (ReVO k : list) {
			html.append("<tr>");
			// 각 NoticeVO 객체에서 정보를 가져와 HTML을 구성합니다.
			html.append("<td><input type='checkbox' id ='checkvalue' name='chk' value='").append(k.getRE_NUM())
					.append("' /></td>");
			html.append("<input type='hidden' id ='checknum' name='checknum' value='").append(k.getRE_NUM())
					.append("' />");
			// html.append("<td>").append(k.getNOTICE_NUM()).append("</td>");
			html.append("<td>").append(no).append("</td>");
			if (k.getRE_ST().equals("3")) {
				html.append("<td id='RE'>").append("　　[Re]").append("<a href='/adreview_onelist_user.do?RE_NUM=")
						.append(k.getRE_NUM()).append("'>").append(k.getRE_SUBJECT()).append("</a></td>");
			} else {
				html.append("<td id='RE'>").append("<a href='/adreview_onelist_user.do?RE_NUM=").append(k.getRE_NUM())
						.append("'>").append(k.getRE_SUBJECT()).append("</a></td>");
			}

			if (k.getRE_FILE() == null || k.getRE_FILE().isEmpty()) {
				html.append("<td>없음</td>");
			} else {
				html.append("<td>있음</td>");
			}

			String result = html.toString();
			// html.append("<td>").append(k.getNOTICE_HIT()).append("</td>");
			html.append("<td>").append(k.getRE_DATE()).append("</td>");
			html.append("<td>").append(k.getRE_UPDATE()).append("</td>");
			html.append("<td>").append(k.getRE_WRITER()).append("</td>");
			// html.append("<td>").append(k.getNOTICE_ST()).append("</td>");
			html.append("<td>");
			if (k.getRE_ST().equals("1")) {
				html.append("[답변대기]");
			} else if (k.getRE_ST().equals("2")) {
				html.append("[답변완료]");
			} else if (k.getADMIN_NUM() != null) {
				html.append("");
			}
			html.append("</td>");
			html.append("</tr>");
			no--; // 번호 감소
		}
		return html.toString();
	}

	// 테이블 삭제버튼
	@RequestMapping(value = "/adrev_deleted1.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adRevDeleted(HttpServletRequest request, HttpSession session,
			@RequestParam("selectedRev[]") List<String> selectedRev) {
		// 여기에서 BOARD_ST 값이 0인 데이터만 필터링하여 list를 가져옵니다.
		for (String k : selectedRev) {
			int del = notiService.upRevtabst(k);
		}
		String msg = "삭제 성공하였습니다.";
		return msg;
	}

	// 리뷰 사용자 상세화면
	@RequestMapping("/adreview_onelist_user.do")
	public ModelAndView AdminReOneListUser(HttpServletRequest request, HttpSession session,
			@ModelAttribute("RE_NUM") String RE_NUM) {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_review_onelist_user");
		ReVO rvo = notiService.getReOneList(RE_NUM);
		mv.addObject("rvo", rvo);
		return mv;
	}

	// 삭제완료 폼이동
	@RequestMapping("/adreview_delete.do")
	public ModelAndView AdminReDelete(HttpServletRequest request, HttpSession session,
			@ModelAttribute("RE_NUM") String RE_NUM) {
		System.out.println("RE_NUM : " + RE_NUM);
		ModelAndView mv = new ModelAndView("admin_bbs/ad_review_delete");
		return mv;
	}

	// 삭제완료 찐
	@RequestMapping("/admin_re_del_ok.do")
	public ModelAndView AdminReDel(HttpServletRequest request, HttpSession session,
			@ModelAttribute("RE_NUM") String RE_NUM, @ModelAttribute("pwd") String pwd) {
		System.out.println("pwd : " + pwd);
		System.out.println("RE_NUM : " + RE_NUM);
		ModelAndView mv = new ModelAndView();

		// 로그인한 세션에 저장된 admin_num 갖고오기.
		String num = (String) request.getSession().getAttribute("admin_num");

		// 로그인한 회원의 비번갖고오기. 입력한 비번과 비교하기위함
		String dbpw = (String) request.getSession().getAttribute("dbpw");

		if (!passwordEncoder.matches(pwd, dbpw)) {
			System.out.println("틀린암호");
			mv.setViewName("admin_bbs/ad_review_delete");
			mv.addObject("pwchk", "fail");
			return mv;

		} else {
			System.out.println("맞는암호");
			int del = notiService.ReviewDeleteOk(RE_NUM);
			mv.setViewName("redirect:/admin_reivew.do");
			return mv;
		}
	}
	
	// 답글
	@RequestMapping("/adreview_write_reply.do")
	public ModelAndView ReplyInsertForm(@ModelAttribute("RE_NUM") String RE_NUM,
			@ModelAttribute("RE_TYPE") String RE_TYPE) {
		return new ModelAndView("admin_bbs/ad_review_writeform");
		// form태그안에있던 cpage랑 idx를 다시 reply_write.jsp로 넘겨야한다.
	}
	@RequestMapping("/admin_re_repleok.do")
	public ModelAndView ReplyWriteOk(@ModelAttribute("RE_NUM") String RE_NUM, ReVO rvo,
			HttpServletRequest request) {
		System.out.println("RE_NUM : " + RE_NUM);
		ModelAndView mv = new ModelAndView("redirect:/admin_reivew.do");
		try {
			// 상세보기에서 그룹, 스텝 레브를 가져온다.
			// 뭐에대한 댓글인지 알려면 원글번호를 먼저 알아야한다. 그래서 그룹수를 갖고와야 몇번의 답글인지알고
			// 스텝은 +1 을 해줘야 댓글, 대댓글 대대댓글을 알수있다. 그리고 레벨은 순번조정하기위해 번호를 조정해야한다.
			// 상세보기의 idx르 갖고오면 그룹스텝레벨을 알수가있다.
			ReVO ravo = notiService.getReOneList(RE_NUM);
			String c_num = ravo.getCLIENT_NUM();
			rvo.setCLIENT_NUM(c_num);
			String p_num = ravo.getPROD_NUM();
			if (p_num == null) {
				rvo.setPROD_NUM(null);
			} else {
				rvo.setPROD_NUM(p_num);
			}
			int st = notiService.getReStUpdate(RE_NUM);
			int groups = Integer.parseInt(ravo.getRE_GROUPS());
			int step = Integer.parseInt(ravo.getRE_STEP());
			int lev = Integer.parseInt(ravo.getRE_LEV());

			// 스텝과 레벨을 하나씩 증가시켜주자.
			step++;
			lev++; // 이건 db에는 안올라가있다.

			// 디비에 레벨을 업데이트하자.
			// **그룹수와 같은 원글을 찾아서 레벨이 같거나 크면 레벨을 증가시키자.**
			// (스텝은 나중에)
			// vo도 써도되고, 맵을 써도된다.하지만 여기서는 vo가 갖고있는값은 증가 되어있지않아서 map을 쓰는게 편하겠다.
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("groups", groups);
			map.put("lev", lev);

			int result = notiService.getReLevUpdate(map);

			// bvo가 증가가 안되었기때문에 증가시키는 일처리
			rvo.setRE_GROUPS(String.valueOf(groups));
			rvo.setRE_STEP(String.valueOf(step));
			rvo.setRE_LEV(String.valueOf(lev));
			// 위에서 증가시킨것을스트링으로 변환 후 setter로 입력시키자.
			// 변화가 있는건 스텝과 레벨이고 그룹은 변화가 없어서 두개만 집어넣기.

			// 암호화와 첨부파일 처리
			// 첨부
			String path = request.getSession().getServletContext().getRealPath("/resources/images");
			MultipartFile f_param = rvo.getFile();
			if (f_param.isEmpty()) {
				rvo.setRE_FILE("");
			} else {
				// 같은이름없도록
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString() + "_" + rvo.getFile().getOriginalFilename();
				rvo.setRE_FILE(f_name);

				// 이미지저장.
				byte[] in = rvo.getFile().getBytes();
				File out = new File(path, f_name);
				FileCopyUtils.copy(in, out);
			}

			// 비번을 암호화

			String admin_name = (String) request.getSession().getAttribute("admin_name");
			rvo.setRE_WRITER(admin_name);
			String num = (String) request.getSession().getAttribute("admin_num");

			rvo.setADMIN_NUM(num);
			String type = request.getParameter("RE_TYPE");
			String type1 = request.getParameter("RE_SUBJECT");
			System.out.println(type);
			System.out.println(type1);
			// vo에 갖고온값 저장.
			rvo.setRE_TYPE(type);
			rvo.setRE_SUBJECT(type1);
			// 삽입
			int res = notiService.ReplyWriteOk(rvo);
			mv.addObject("admin_name", admin_name);
			return mv;

		} catch (Exception e) {
			System.out.println("여기로오니?" + e);
			return null;

		}
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
	// 신고
	// 삭제된 신고검색
	@RequestMapping(value = "/adrep_deleted.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adRepDelSearch(HttpServletRequest request, HttpSession session) {
		// 여기에서 BOARD_ST 값이 0인 데이터만 필터링하여 list를 가져옵니다.
		List<ReportVO> list = notiService.getDeleRep();

		StringBuilder html = new StringBuilder();
		int no = list.size(); // 번호를 내림차순으로 출력하기 위해 리스트 크기로 초기화
		for (ReportVO k : list) {
			html.append("<tr>");
			html.append("<td><input type='checkbox' name='chk' value='").append(k.getREPORT_NUM()).append("' /></td>");
			html.append("<td>").append(no).append("</td>"); // 번호 추가
			if (k.getADMIN_NUM() != null) {
				html.append("<td id='RE'>").append("　　[Re]").append("<a href='/ad_report_onelist_user.do?REPORT_NUM=")
						.append(k.getREPORT_NUM()).append("'>").append(k.getREPORT_SUBJECT()).append("</a></td>");
			} else {
				html.append("<td id='RE'>").append("<a href='/ad_report_onelist_user.do?REPORT_NUM=").append(k.getREPORT_NUM())
						.append("'>").append(k.getREPORT_SUBJECT()).append("</a></td>");
			}
			if (k.getREPORT_FILE() == null || k.getREPORT_FILE().isEmpty()) {
				html.append("<td>없음</td>");
			} else {
				html.append("<td>있음</td>");
			}
			html.append("<td>").append(k.getREPORT_DATE()).append("</td>");
			html.append("<td>").append(k.getREPORT_WRITER()).append("</td>");
			html.append("<td>");
			if (k.getREPORT_ST().equals("1")) {
				html.append("[답변대기]");
			} else if (k.getREPORT_ST().equals("2")) {
				html.append("[답변완료]");
			} else if (k.getREPORT_ST().equals("3")) {
				html.append("");
			}

			html.append("</td>");
			html.append("</tr>");
			no--; // 번호 감소
		}
		return html.toString();
	}
	// 검색
	@RequestMapping(value = "/adrep_search.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adRepSearch(@RequestParam(value = "searchKey", required = false) String searchKey,
			@RequestParam(value = "searchText", required = false) String searchText,
			@RequestParam(value = "searchTitle", required = false) String searchTitle,
			@RequestParam(value = "start1", required = false) String start1,
			@RequestParam(value = "close1", required = false) String close1,
			@RequestParam(value = "mg_type", required = false) String mg_type, HttpServletRequest request,
			HttpSession session) {
		List<ReportVO> list;

		// Step 1: 검색 조건 검증 (상태설정안하고 검색(전체리스트))
		if (searchText == null && start1 == null && close1 == null) {
			list = notiService.getAllRep();
		} else {
			// Step 2: 검색 쿼리 실행
			list = notiService.adSearchRep(searchKey, searchText, searchTitle, start1, close1, mg_type);
		}

		// Step 3: 결과를 HTML 형태로 가공
		StringBuilder html = new StringBuilder();
		int no = list.size(); // 번호를 내림차순으로 출력하기 위해 리스트 크기로 초기화
		for (ReportVO k : list) {
			html.append("<tr>");
			// 각 NoticeVO 객체에서 정보를 가져와 HTML을 구성합니다.
			html.append("<td><input type='checkbox' id ='checkvalue' name='chk' value='").append(k.getREPORT_NUM())
					.append("' /></td>");
			html.append("<input type='hidden' id ='checknum' name='checknum' value='").append(k.getREPORT_NUM())
					.append("' />");
			// html.append("<td>").append(k.getNOTICE_NUM()).append("</td>");
			html.append("<td>").append(no).append("</td>");
			if (k.getREPORT_ST().equals("3")) {
				html.append("<td id='RE'>").append("　　[Re]").append("<a href='/ad_report_onelist_user.do?REPORT_NUM=")
						.append(k.getREPORT_NUM()).append("'>").append(k.getREPORT_SUBJECT()).append("</a></td>");
			} else {
				html.append("<td id='RE'>").append("<a href='/ad_report_onelist_user.do?REPORT_NUM=").append(k.getREPORT_NUM())
						.append("'>").append(k.getREPORT_SUBJECT()).append("</a></td>");
			}
			if (k.getREPORT_FILE() == null || k.getREPORT_FILE().isEmpty()) {
				html.append("<td>없음</td>");
			} else {
				html.append("<td>있음</td>");
			}
			String result = html.toString();
			html.append("<td>").append(k.getREPORT_DATE()).append("</td>");
			html.append("<td>").append(k.getREPORT_WRITER()).append("</td>");
			html.append("<td>");
			if (k.getREPORT_ST().equals("1")) {
				html.append("[답변대기]");
			} else if (k.getREPORT_ST().equals("2")) {
				html.append("[답변완료]");
			} else if (k.getADMIN_NUM() != null) {
				html.append("");
			}
			html.append("</td>");
			html.append("</tr>");
			no--; // 번호 감소
		}
		return html.toString();
	}
	// 테이블 삭제버튼
	@RequestMapping(value = "/adrep_deleted1.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adRepDeleted(HttpServletRequest request, HttpSession session,
			@RequestParam("selectedRep[]") List<String> selectedRep) {
		// 여기에서 BOARD_ST 값이 0인 데이터만 필터링하여 list를 가져옵니다.
		for (String k : selectedRep) {
			int del = notiService.upReptabst(k);
		}
		String msg = "삭제 성공하였습니다.";
		return msg;
	}
	// 리뷰 사용자 상세화면
	@RequestMapping("/ad_report_onelist_user.do")
	public ModelAndView AdminRepOneListUser(HttpServletRequest request, HttpSession session,
			@ModelAttribute("REPORT_NUM") String REPORT_NUM) {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_report_onelist_user");
		ReportVO rpvo = notiService.getRepOneList(REPORT_NUM);
		mv.addObject("rpvo", rpvo);
		return mv;
	}
	// 삭제완료 폼이동
	@RequestMapping("/adreport_delete.do")
	public ModelAndView AdminRepDelete(HttpServletRequest request, HttpSession session,
			@ModelAttribute("REPORT_NUM") String REPORT_NUM) {
		System.out.println("REPORT_NUM : " + REPORT_NUM);
		ModelAndView mv = new ModelAndView("admin_bbs/ad_report_delete");
		return mv;
	}

	// 삭제완료 찐
	@RequestMapping("/admin_rep_del_ok.do")
	public ModelAndView AdminRepDel(HttpServletRequest request, HttpSession session,
			@ModelAttribute("REPORT_NUM") String REPORT_NUM, @ModelAttribute("pwd") String pwd) {
		System.out.println("pwd : " + pwd);
		System.out.println("REPORT_NUM : " + REPORT_NUM);
		ModelAndView mv = new ModelAndView();

		// 로그인한 세션에 저장된 admin_num 갖고오기.
		String num = (String) request.getSession().getAttribute("admin_num");

		// 로그인한 회원의 비번갖고오기. 입력한 비번과 비교하기위함
		String dbpw = (String) request.getSession().getAttribute("dbpw");

		if (!passwordEncoder.matches(pwd, dbpw)) {
			System.out.println("틀린암호");
			mv.setViewName("admin_bbs/ad_report_delete");
			mv.addObject("pwchk", "fail");
			return mv;

		} else {
			System.out.println("맞는암호");
			int del = notiService.ReportDeleteOk(REPORT_NUM);
			mv.setViewName("redirect:/admin_report.do");
			return mv;
		}
	}
	// 답글
	@RequestMapping("/adreport_writeform.do")
	public ModelAndView ReportInsertForm(@ModelAttribute("REPORT_NUM") String REPORT_NUM,
			@ModelAttribute("REPORT_TYPE") String REPORT_TYPE) {
		return new ModelAndView("admin_bbs/ad_report_writeform");
		// form태그안에있던 cpage랑 idx를 다시 reply_write.jsp로 넘겨야한다.
	}
	@RequestMapping("/admin_report_repleok.do")
	public ModelAndView ReplyWriteOk(@ModelAttribute("REPORT_NUM") String REPORT_NUM, ReportVO rpvo,
			HttpServletRequest request) {
		System.out.println("REPORT_NUM : " + REPORT_NUM);
		ModelAndView mv = new ModelAndView("redirect:/admin_report.do");
		try {
			// 상세보기에서 그룹, 스텝 레브를 가져온다.
			// 뭐에대한 댓글인지 알려면 원글번호를 먼저 알아야한다. 그래서 그룹수를 갖고와야 몇번의 답글인지알고
			// 스텝은 +1 을 해줘야 댓글, 대댓글 대대댓글을 알수있다. 그리고 레벨은 순번조정하기위해 번호를 조정해야한다.
			// 상세보기의 idx르 갖고오면 그룹스텝레벨을 알수가있다.
			ReportVO rpavo = notiService.getRepOneList(REPORT_NUM);
			String c_num = rpavo.getCLIENT_NUM();
			rpvo.setCLIENT_NUM(c_num);
			String p_num = rpavo.getPROD_NUM();
			if (p_num == null) {
				rpvo.setPROD_NUM(null);
			} else {
				rpvo.setPROD_NUM(p_num);
			}
			int st = notiService.getRepStUpdate(REPORT_NUM);
			int groups = Integer.parseInt(rpavo.getREPORT_GROUPS());
			int step = Integer.parseInt(rpavo.getREPORT_STEP());
			int lev = Integer.parseInt(rpavo.getREPORT_LEV());

			// 스텝과 레벨을 하나씩 증가시켜주자.
			step++;
			lev++; // 이건 db에는 안올라가있다.

			// 디비에 레벨을 업데이트하자.
			// **그룹수와 같은 원글을 찾아서 레벨이 같거나 크면 레벨을 증가시키자.**
			// (스텝은 나중에)
			// vo도 써도되고, 맵을 써도된다.하지만 여기서는 vo가 갖고있는값은 증가 되어있지않아서 map을 쓰는게 편하겠다.
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("groups", groups);
			map.put("lev", lev);

			int result = notiService.getReLepUpdate(map);

			// bvo가 증가가 안되었기때문에 증가시키는 일처리
			rpvo.setREPORT_GROUPS(String.valueOf(groups));
			rpvo.setREPORT_STEP(String.valueOf(step));
			rpvo.setREPORT_LEV(String.valueOf(lev));
			// 위에서 증가시킨것을스트링으로 변환 후 setter로 입력시키자.
			// 변화가 있는건 스텝과 레벨이고 그룹은 변화가 없어서 두개만 집어넣기.

			// 암호화와 첨부파일 처리
			// 첨부
			String path = request.getSession().getServletContext().getRealPath("/resources/images");
			MultipartFile f_param = rpvo.getFile();
			if (f_param.isEmpty()) {
				rpvo.setREPORT_FILE("");
			} else {
				// 같은이름없도록
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString() + "_" + rpvo.getFile().getOriginalFilename();
				rpvo.setREPORT_FILE(f_name);

				// 이미지저장.
				byte[] in = rpvo.getFile().getBytes();
				File out = new File(path, f_name);
				FileCopyUtils.copy(in, out);
			}

			// 비번을 암호화
			String admin_name = (String) request.getSession().getAttribute("admin_name");
			rpvo.setREPORT_WRITER(admin_name);
			String num = (String) request.getSession().getAttribute("admin_num");

			rpvo.setADMIN_NUM(num);
			String type = request.getParameter("REPORT_TYPE");
			String type1 = request.getParameter("REPORT_SUBJECT");
			System.out.println(type);
			System.out.println(type1);
			// vo에 갖고온값 저장.
			rpvo.setREPORT_TYPE(type);
			rpvo.setREPORT_SUBJECT(type1);
			// 삽입
			int res = notiService.ReportWriteOk(rpvo);
			mv.addObject("admin_name", admin_name);
			return mv;

		} catch (Exception e) {
			System.out.println("여기로오니?" + e);
			return null;

		}
	}
	@RequestMapping("/adreport_update.do")
	public ModelAndView AdminRepUpdate() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_report_update");
		return mv;
	}



	@RequestMapping("/ad_report_onelist.do")
	public ModelAndView AdminRepOnelist() {
		ModelAndView mv = new ModelAndView("admin_bbs/ad_report_onelist");
		return mv;
	}



	@RequestMapping("/return5.do")
	public ModelAndView AdminGorep() {
		ModelAndView mv = new ModelAndView("admin_notice/report");
		return mv;
	}

	// 팝업 슬라이드
	// 작성 페이지 이동
	@RequestMapping("/allpopslide.do") //
	public ModelAndView AdminPWriteForm(HttpSession session) {
		ModelAndView mv = new ModelAndView("/admin_notice/popslide_writeform");
		return mv;
	}

	// 작성 완료 폼이동
	@RequestMapping("/popupswriteok.do") //
	public ModelAndView AdminPopWriteForm(
			HttpSession session, HttpServletRequest request,
			PopUpSVO popvo) {

		ModelAndView mv = new ModelAndView("redirect:/ad_popup.do");
		try {
			String path = request.getSession().getServletContext().getRealPath("/resources/images/slide");

			MultipartFile f_param = popvo.getFile();
			if (f_param.isEmpty()) {
				popvo.setPOPUP_ADDR("");
			} else {
				//UUID uuid = UUID.randomUUID();
				String f_name = popvo.getFile().getOriginalFilename();
				popvo.setPOPUP_ADDR(f_name);
				popvo.setPOPUP_IMG(f_name);

				byte[] in = popvo.getFile().getBytes();
				File out = new File(path, f_name);

				FileCopyUtils.copy(in, out);
			}

			String admin_name = (String) request.getSession().getAttribute("admin_name");
			popvo.setPOPUP_WRITER(admin_name);
			String type = request.getParameter("TYPE");
			if(type.equals("팝업")) {
				popvo.setPOPUP_ST("0");
			}else {
				popvo.setPOPUP_ST("1");
			}
			// vo에 갖고온값 저장.

			int result = notiService.getPopupWriteOk(popvo);
			if (result > 0) {
				return mv;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	// 삭제된 팝업 슬라이드 검색
	@RequestMapping(value = "/adpopup_deleted.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adPopDeleted(HttpServletRequest request, HttpSession session) {
		// 여기에서 NOTICE_ST 값이 2인 데이터만 필터링하여 list를 가져옵니다.
		List<PopUpSVO> list = notiService.getDeletedPop();

		StringBuilder html = new StringBuilder();
		int no = list.size(); // 번호를 내림차순으로 출력하기 위해 리스트 크기로 초기화
		for (PopUpSVO k : list) {
			html.append("<tr>");
			html.append("<td><input type='checkbox' name='chk' value='").append(k.getPOPUP_NUM()).append("' /></td>");
			html.append("<td>").append(no).append("</td>"); // 번호 추가
			html.append("<td><a href='/adpopup_onelist.do?POPUP_NUM=").append(k.getPOPUP_NUM()).append("'>")
					.append(k.getPOPUP_IMG()).append("</a></td>");
			if(k.getPOPUP_ST().equals("0")) {
				html.append("<td>팝업</td>");
			}else {
				html.append("<td>슬라이드</td>");
			}
			html.append("<td>").append(k.getPOPUP_WRITER()).append("</td>");
			html.append("<td>");
			
			if (k.getPOPUP_CHK().equals("1")) {
				html.append("[등록]");
			} else if (k.getPOPUP_CHK().equals("2")) {
				html.append("[미등록]");
			} else if (k.getPOPUP_CHK().equals("0")) {
				html.append("[삭제]");
			}
			
			html.append("</td>");
			html.append("</tr>");
			no--; // 번호 감소
		}
		return html.toString();
	}
	// 검색버튼
	@RequestMapping(value = "/adpop_search.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adPopSearch(@RequestParam(value = "searchKey", required = false) String searchKey,
			@RequestParam(value = "searchText", required = false) String searchText,
			@RequestParam(value = "searchTitle", required = false) String searchTitle,
			@RequestParam(value = "start1", required = false) String start1,
			@RequestParam(value = "close1", required = false) String close1,
			@RequestParam(value = "mg_type", required = false) String mg_type, HttpServletRequest request,
			HttpSession session) {

		List<PopUpSVO> list;

		// Step 1: 검색 조건 검증 (상태설정안하고 검색(전체리스트))
		if (searchText == null && start1 == null && close1 == null) {
			list = notiService.getAllPopup();
		} else {
			// Step 2: 검색 쿼리 실행
			list = notiService.adPopupSearch(searchKey, searchText, searchTitle, start1, close1, mg_type);
		}

		// Step 3: 결과를 HTML 형태로 가공
		StringBuilder html = new StringBuilder();
		int no = list.size(); // 번호를 내림차순으로 출력하기 위해 리스트 크기로 초기화
		for (PopUpSVO k : list) {
			html.append("<tr>");
			// 각 NoticeVO 객체에서 정보를 가져와 HTML을 구성합니다.
			html.append("<td><input type='checkbox' id ='checkvalue' name='chk' value='").append(k.getPOPUP_NUM())
					.append("' /></td>");
			html.append("<input type='hidden' id ='checknum' name='checknum' value='").append(k.getPOPUP_NUM())
					.append("' />");
			// html.append("<td>").append(k.getNOTICE_NUM()).append("</td>");
			html.append("<td>").append(no).append("</td>");
//			html.append("<td><a href='/adpopup_onelist.do?POPUP_NUM=").append(k.getPOPUP_NUM()).append("'>")
//					.append(k.getPOPUP_IMG()).append("</a></td>");
			html.append("<td>").append(k.getPOPUP_IMG()).append("</td>");

			if(k.getPOPUP_ST().equals("0")) {
				html.append("<td>팝업</td>");
			}else {
				html.append("<td>슬라이드</td>");
			}
			String result = html.toString();
			html.append("<td>").append(k.getPOPUP_WRITER()).append("</td>");
			html.append("<td>");
			if (k.getPOPUP_CHK().equals("1")) {
				html.append("[등록]");
			} else if (k.getPOPUP_CHK().equals("2")) {
				html.append("[미등록]");
			}
			html.append("</td>");
			html.append("</tr>");
			no--; // 번호 감소
		}
		return html.toString();
	}
	// 테이블 삭제버튼
	@RequestMapping(value = "/adpop_deleted1.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adPopUpDeleted(HttpServletRequest request, HttpSession session,
			@RequestParam("selectedPopUp[]") List<String> selectedPopUp) {
		
		for (String k : selectedPopUp) {
			int del = notiService.upPopUptabst(k);
		}
		String msg = "삭제 성공하였습니다.";
		return msg;
	}
	// 홈페이지 등록
	@RequestMapping(value = "/update_adpopstatus.do", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String updatePopUpStatus(HttpServletRequest request, HttpSession session,
			@RequestParam("selectedPopup[]") List<String> selectedPopup,
			@RequestParam("AddForm") String AddForm) {
		System.out.println("AddForm : " + AddForm);
		if(AddForm.equals("팝업")) {
			for (String k : selectedPopup) {
				int del1 = notiService.updatePopStatus1(k);
			}
			String msg = "등록 성공하였습니다.";
			return msg;
		}else if(AddForm.equals("슬라이드")){
			for (String k : selectedPopup) {
				int del2 = notiService.updatePopStatus2(k);
			}
			String msg = "등록 성공하였습니다.";
			return msg;
		}
		return null;
		}


	@RequestMapping("/ad_popup.do")
	public ModelAndView AdminPopup() {
		ModelAndView mv = new ModelAndView("/admin_notice/popslide");
		return mv;
	}
	
	
}

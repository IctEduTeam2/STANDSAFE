package com.ict.bbs.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.bbs.model.service.BBS_Service;
import com.ict.bbs.model.vo.EV_BBS_VO;
import com.ict.bbs.model.vo.FA_BBS_VO;
import com.ict.bbs.model.vo.NO_BBS_VO;
import com.ict.bbs.model.vo.QA_BBS_VO;
import com.ict.bbs.model.vo.REP_BBS_VO;
import com.ict.bbs.model.vo.RE_BBS_VO;
import com.ict.common.Paging;
import com.ict.user.model.vo.UserVO;

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
	public ModelAndView goBbsNotice(HttpServletRequest request,HttpSession session) {
		session.removeAttribute("reponelist");
        session.removeAttribute("qaonelist");
        session.removeAttribute("revonelist");
		
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
	public ModelAndView goBbsEvent(HttpServletRequest request,HttpSession session) {
		session.removeAttribute("reponelist");
        session.removeAttribute("qaonelist");
        session.removeAttribute("revonelist");
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
	public ModelAndView goBbsFaq(HttpServletRequest request,HttpSession session) {
		session.removeAttribute("reponelist");
        session.removeAttribute("qaonelist");
        session.removeAttribute("revonelist");
		ModelAndView mv = new ModelAndView();
		
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
		
		

	
		mv.addObject("cPage", cPage);

		mv.addObject("list", list);
		mv.addObject("paging", paging);
		
		mv.setViewName("bbs/faq");
	
		return mv;

	}
	
	@RequestMapping("/bbs_qa_go.do")
	public ModelAndView goBbsQa(HttpServletRequest request, HttpSession session) {
		session.removeAttribute("reponelist");    
        session.removeAttribute("revonelist");
		
		ModelAndView mv = new ModelAndView("bbs/qa");
		
		//페이징을 위해 게시물의 전체글 구하기
		int count = bbsService.getTotalQnaCount();
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
	
		
		List<QA_BBS_VO> list = bbsService.getqnalist(paging.getOffset(),paging.getNumPerPage());
		

		
		mv.addObject("list", list);
		mv.addObject("paging", paging);

		

		return mv;

	}
	
	@RequestMapping("/bbs_report_go.do")
	public ModelAndView goBbsReport(HttpServletRequest request,HttpSession session) {
	
        session.removeAttribute("qaonelist");
        session.removeAttribute("revonelist");
		ModelAndView mv = new ModelAndView("bbs/report");
		
		//페이징을 위해 게시물의 전체글 구하기
		int count = bbsService.getTotalReportCount();
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
	
		
		List<REP_BBS_VO> list = bbsService.getreportlist(paging.getOffset(),paging.getNumPerPage());
		
	
		mv.addObject("list", list);
		
		mv.addObject("paging", paging);



		return mv;

	}
	
	@RequestMapping("/bbs_review_go.do")
	public ModelAndView goBbsReview(HttpServletRequest request,HttpSession session) {
		session.removeAttribute("reponelist");
        session.removeAttribute("qaonelist");
		ModelAndView mv = new ModelAndView("bbs/review");
		
		//페이징을 위해 게시물의 전체글 구하기
		int count = bbsService.getTotalReviewCount();
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
	
		
		List<RE_BBS_VO> list = bbsService.getreviewlist(paging.getOffset(),paging.getNumPerPage());
		
		String review_num = request.getParameter("RE_NUM");

		
		RE_BBS_VO reviewvo = bbsService.getReviewOneList(review_num);

		
		mv.addObject("list", list);
		mv.addObject("reviewvo",reviewvo);
		mv.addObject("paging", paging);



		return mv;

	}

	
	
	//각 상세보기로
	
	//공지사항 상세보기
	@RequestMapping("/bbs_notice_onelist.do")
	public ModelAndView goBbsNoticeOneList(HttpServletRequest request,HttpSession session) {
		
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
	public ModelAndView goBbsEventOneList(HttpServletRequest request,HttpSession session) {
		
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
	public ModelAndView goBbsFaqOneList(HttpServletRequest request,HttpSession session) {
		
		
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
	public ModelAndView goBbsQAOneList(HttpServletRequest request, HttpSession session) {
		session.removeAttribute("reponelist");
        session.removeAttribute("qaonelist");
        session.removeAttribute("revonelist");
		ModelAndView mv = new ModelAndView();
		
		String qna_num = request.getParameter("BOARD_NUM");
		String cPage = request.getParameter("cPage");
				
		//onelist
		QA_BBS_VO qnavo = bbsService.getQnaOneList(qna_num);
		
		mv.addObject("qnavo", qnavo);
		mv.addObject("cPage", cPage);
		
		String c_num = (String) request.getSession().getAttribute("id");
		System.out.println("로그인한 아이디의 번호: " + c_num);
		String dbnum = qnavo.getCLIENT_NUM();
		System.out.println("게시물번호로 조회하여 갖고온 멤버번호:" + dbnum);
		String lock = qnavo.getBOARD_LOCK();
		System.out.println("비밀글여부 확인 1은 비밀, 0은 일반 : " + lock);

			if(lock.equals("1") && !dbnum.equals(c_num)) {
				session.setAttribute("qaonelist", "not");
				mv.setViewName("redirect:/bbs_qa_go.do");

		        return mv; 
			}else {
				session.setAttribute("qaonelist", "view");
					if(dbnum.equals(c_num)) {
						session.setAttribute("qaonelist", "update");
					}
					mv.setViewName("bbs/qa_onelist");
					return mv;
			}

		}
			

	
	@RequestMapping("/bbs_report_onelist.do")
	public ModelAndView goBbsReportOneList(HttpServletRequest request, HttpSession session) {
		session.removeAttribute("reponelist");
        session.removeAttribute("qaonelist");
        session.removeAttribute("revonelist");
		ModelAndView mv = new ModelAndView("bbs/report_onelist");
		
		String rep_num = request.getParameter("REPORT_NUM");
		String cPage = request.getParameter("cPage");
				
		//onelist
		REP_BBS_VO repvo = bbsService.getReportOneList(rep_num);
		
		mv.addObject("repvo", repvo);
		mv.addObject("cPage", cPage);

		String c_num = (String) request.getSession().getAttribute("id");
		System.out.println("로그인한 아이디의 아이디: " + c_num);
		String dbnum = repvo.getCLIENT_NUM();
		System.out.println("게시물번호로 조회하여 갖고온 멤버번호:" + dbnum);


			if(!dbnum.equals(c_num)) {
				session.setAttribute("reponelist", "not");
				mv.setViewName("redirect:/bbs_report_go.do");

		        return mv; 
			}else {
					session.setAttribute("reponelist", "update");	
					mv.setViewName("bbs/report_onelist");
					return mv;
			}

		}
	
	@RequestMapping("/bbs_review_onelist.do")
	public ModelAndView goBbsReviewOneList(HttpServletRequest request, HttpSession session) {
		session.removeAttribute("reponelist");
        session.removeAttribute("qaonelist");
        session.removeAttribute("revonelist");
		ModelAndView mv = new ModelAndView("bbs/review_onelist");
		
		String review_num = request.getParameter("RE_NUM");
		String cPage = request.getParameter("cPage");
				
		//onelist
		RE_BBS_VO reviewvo = bbsService.getReviewOneList(review_num);
		
		mv.addObject("reviewvo", reviewvo);
		mv.addObject("cPage", cPage);

		String c_num = (String) request.getSession().getAttribute("id");
		System.out.println("로그인한 아이디의 아이디: " + c_num);
		String dbnum = reviewvo.getCLIENT_NUM();
		System.out.println("게시물번호로 조회하여 갖고온 멤버번호:" + dbnum);
		String lock = reviewvo.getRE_LOCK();
		System.out.println("비밀글여부 확인 1은 비밀, 0은 일반 : " + lock);

		
		
			if(lock.equals("1") && !dbnum.equals(c_num)) {
				session.setAttribute("revonelist", "not");
				mv.setViewName("redirect:/bbs_review_go.do");

		        return mv; 
			}else {
				session.setAttribute("revonelist", "view");
					if(dbnum.equals(c_num)) {
						session.setAttribute("revonelist", "update");
					}
					mv.setViewName("bbs/review_onelist");
					return mv;
			}

		}
			
	
	
	 //각 작성폼으로
	
	
	@GetMapping("/bbs_qa_writeform.do")
	public ModelAndView goBbsQAWriteForm(HttpServletRequest request,HttpSession session) {
	
		return new ModelAndView("bbs/qa_writeform");
	}
	
	@RequestMapping("/bbs_report_writeform.do")
	public ModelAndView goBbsReportWriteForm(HttpServletRequest request,HttpSession session) {
		
		return new ModelAndView("bbs/report_writeform");
	}
	@RequestMapping("/bbs_review_writeform.do")
	public ModelAndView goBbsReviewtWriteForm(HttpServletRequest request,HttpSession session) {
		
		return new ModelAndView("bbs/review_writeform");
	}
	
	
	
	//작성완료 일처리 컨트롤러 : qa
	@PostMapping("/bbs_qa_writeOk.do")
	public ModelAndView BbsQaWriteOk(QA_BBS_VO qnavo,HttpServletRequest request, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("redirect:/bbs_qa_go.do");
		
		try {
			String path =request.getSession().getServletContext().getRealPath("/resources/upload");
			
			
			
			MultipartFile f_param = qnavo.getFile();
			if(f_param.isEmpty()) {
				qnavo.setBOARD_FILE("");
			}else {
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString()+"_"+qnavo.getFile().getOriginalFilename();
				qnavo.setBOARD_FILE(f_name);
				
				byte[] in = qnavo.getFile().getBytes();
				File out = new File(path, f_name);
				
				FileCopyUtils.copy(in, out);
			}
			
			//회원닉네임 갖고오기 - 작성자에 자동 뜨고 저장하기위함
			String nick = (String) request.getSession().getAttribute("nick");
			System.out.println("로그인한 닉넴 : " + nick); 
			
			//제리똥나온다. vo저장후 맵퍼에 보내자. 저장하라고
			qnavo.setBOARD_WRITER(nick);
			
			//회원client_num 갖고오자. 디비에 넣어야한다. 
			String num = (String) request.getSession().getAttribute("id");
			System.out.println("닉네임의 번호:" + num);
			//맞는 17번 나온다, 저장하자, 혜인님이만든 유저 vo의 클라인트넘버는 인트로, 나는 스트링으로 바꿔주는 작업
			qnavo.setCLIENT_NUM(num);

			//라디오체크박스 값을 맴퍼에 보내기위해 가지고오기
			
			String type= request.getParameter("BOARD_TYPE");
			
			//vo에 갖고온값 저장.
			qnavo.setBOARD_TYPE(type);
			
			//비밀글 체크시 제목앞에 붙이기.
			String lock =  request.getParameter("secret_flag");
			System.out.println("비밀글여부  : " + lock);  //1이 비밀글 0은 일반
			
			//[비밀] 을 붙일 제목가져오기
			String sub = qnavo.getBOARD_SUBJECT();
			
			if(lock.equals("1")) {
				qnavo.setBOARD_LOCK("1");
			}else {
				qnavo.setBOARD_LOCK("0");
			}

			int result = bbsService.getQnaWriteOk(qnavo);
			
			
			if(result >0) {
				return mv;
			}else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	@PostMapping("/bbs_report_writeOk.do")
	public ModelAndView BbsReportWriteOk(REP_BBS_VO repvo,
			HttpServletRequest request, HttpSession session) {
		
		
		ModelAndView mv = new ModelAndView("redirect:/bbs_report_go.do");
		
		try {
			String path =request.getSession().getServletContext().getRealPath("/resources/upload");
			
			
			
			MultipartFile f_param = repvo.getFile();
			if(f_param.isEmpty()) {
				repvo.setREPORT_FILE("");
			}else {
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString()+"_"+repvo.getFile().getOriginalFilename();
				repvo.setREPORT_FILE(f_name);
				
				byte[] in = repvo.getFile().getBytes();
				File out = new File(path, f_name);
				
				FileCopyUtils.copy(in, out);
			}
			
			//회원닉네임 갖고오기 - 작성자에 자동 뜨고 저장하기위함
			String nick = (String) request.getSession().getAttribute("nick");
			System.out.println("로그인한 닉넴 : " + nick); 
		
			
			String maskNick;
			
			if(nick.length() <2) {
				char firstChar = nick.charAt(0);
				maskNick = firstChar + "**";
			} else {
				char firstChar = nick.charAt(0);
				char lastChar = nick.charAt(nick.length() -1);
				StringBuilder maskName = new StringBuilder();
				maskName.append(firstChar);
				for(int i = 1; i <nick.length() -1; i++) {
					maskName.append('*');
				}
				maskName.append(lastChar);
				maskNick = maskName.toString();
			}
			System.out.println("가려진 닉넴" + maskNick);
			
			mv.addObject("maskNick", maskNick);

			//회원client_num 갖고오자. 디비에 넣어야한다. 
			String num = (String) request.getSession().getAttribute("id");
			System.out.println("닉네임의 번호:" + num);
			//맞는 17번 나온다, 저장하자, 혜인님이만든 유저 vo의 클라인트넘버는 인트로, 나는 스트링으로 바꿔주는 작업
			repvo.setCLIENT_NUM(num);

			//라디오체크박스 값을 맴퍼에 보내기위해 가지고오기
			
			String type= request.getParameter("REPORT_TYPE");
			
			//vo에 갖고온값 저장.
			repvo.setREPORT_TYPE(type);
			
			

			int result = bbsService.getReportWriteOk(repvo);
			
			if(result >0) {
				
				return mv;
			}else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	
	
	//작성완료 리뷰
	@PostMapping("/bbs_review_writeOk.do")
	public ModelAndView BbsReviewWriteOk(RE_BBS_VO reviewvo,
			HttpServletRequest request, HttpSession session) {
		
	ModelAndView mv = new ModelAndView("redirect:/bbs_review_go.do");
	
	try {
		String path =request.getSession().getServletContext().getRealPath("/resources/upload");
		
		
		
		MultipartFile f_param = reviewvo.getFile();
		
		if(f_param.isEmpty()) {
			reviewvo.setRE_FILE("");
		}else {
			UUID uuid = UUID.randomUUID();
			String f_name = uuid.toString()+"_"+reviewvo.getFile().getOriginalFilename();
			reviewvo.setRE_FILE(f_name);
			
			byte[] in = reviewvo.getFile().getBytes();
			File out = new File(path, f_name);
			
			FileCopyUtils.copy(in, out);
		}
		
		//회원닉네임 갖고오기 - 작성자에 자동 뜨고 저장하기위함
		String nick = (String) request.getSession().getAttribute("nick");
		System.out.println("로그인한 닉넴 : " + nick); 
		
		//제리똥나온다. vo저장후 맵퍼에 보내자. 저장하라고
		reviewvo.setRE_WRITER(nick);
		
		//회원client_num 갖고오자. 디비에 넣어야한다. 
		String num = (String) request.getSession().getAttribute("id");
		System.out.println("닉네임의 번호:" + num);
		//맞는 17번 나온다, 저장하자, 혜인님이만든 유저 vo의 클라인트넘버는 인트로, 나는 스트링으로 바꿔주는 작업
		reviewvo.setCLIENT_NUM(num);

		//라디오체크박스 값을 맴퍼에 보내기위해 가지고오기
		
		String type= request.getParameter("RE_TYPE");
		
		//vo에 갖고온값 저장.
		reviewvo.setRE_TYPE(type);
		
		//비밀글 체크시 제목앞에 붙이기.
		String lock =  request.getParameter("secret_flag");
		System.out.println("비밀글여부  : " + lock);  //1이 비밀글 0은 일반
		
		//[비밀] 을 붙일 제목가져오기
		String sub = reviewvo.getRE_SUBJECT();
		
		if(lock.equals("1")) {
			reviewvo.setRE_LOCK("1");
		}else {
			reviewvo.setRE_LOCK("0");
		}

		int result = bbsService.getReviewWriteOk(reviewvo);
		
		
		if(result >0) {
			return mv;
		}else {
			return null;
		}
	} catch (Exception e) {
		System.out.println(e);
		return null;
	}
}
	
	
	//각 삭제폼으로
	@RequestMapping("/bbs_qa_deleteform.do")
	public ModelAndView goBbsQaDelete(
			@ModelAttribute("BOARD_NUM")String BOARD_NUM,
			@ModelAttribute("cPage")String cPage,
			HttpSession session) {
		
		
		return new ModelAndView("bbs/qa_delete");

	}

	@RequestMapping("/bbs_review_deleteform.do")
	public ModelAndView goBbsReviewDelete(
			@ModelAttribute("RE_NUM")String RE_NUM,
			@ModelAttribute("cPage")String cPage,
			HttpSession session) {
		
		return new ModelAndView("bbs/review_delete");
	}
	
	
	//삭제완료되는 일처리 : qa
	@RequestMapping("/bbs_deleteOk.do")
	public ModelAndView BbsQaDeleteOk(
			@RequestParam("pwd")String pwd,
			@ModelAttribute("BOARD_NUM")String BOARD_NUM,
			@ModelAttribute("cPage")String cPage,
			HttpServletRequest request,
			HttpSession session) {
	
		ModelAndView mv = new ModelAndView();
		
		//로그인한 세션에 저장된 client_num 갖고오기.
		String num = (String) request.getSession().getAttribute("id");
		System.out.println("닉네임의 번호:" + num);
		//로그인정보랑 맞게나온다.. 저장하자, 혜인님이만든 유저 vo의 클라인트넘버는 인트로, 나는 스트링으로 바꿔주는 작업
		//로그인한정보와 맞는 번호임. 
		
		
		//로그인한 회원의 비번갖고오기. 입력한 비번과 비교하기위함 
		String dbpw = (String) request.getSession().getAttribute("dbpw");
		System.out.println("디비비번은:" + dbpw);
		
		//입력한 번호출력해보기.
		System.out.println("입력한번호는:" + pwd);
		
		if( !passwordEncoder.matches(pwd, dbpw)) {
			System.out.println("틀린암호");
			mv.setViewName("bbs/qa_delete");
			mv.addObject("pwchk", "fail");
			return mv;
			
		}else {
			System.out.println("맞는암호");
			int del = bbsService.BbsQaDeleteOk(BOARD_NUM);
			mv.setViewName("redirect:/bbs_qa_go.do");
			return mv;
		}
		


		
	}
	
	//삭제되는일처리 : 리뷰 
	@RequestMapping("/bbs_reviewDeleteOk.do")
	public ModelAndView BbsReviewDeleteOk(
			@RequestParam("pwd")String pwd,
			@ModelAttribute("RE_NUM")String RE_NUM,
			@ModelAttribute("cPage")String cPage,
			HttpServletRequest request,
			HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		//로그인한 세션에 저장된 client_num 갖고오기.
		String num = (String) request.getSession().getAttribute("id");
		System.out.println("닉네임의 번호:" + num);
		//로그인정보랑 맞게나온다.. 저장하자, 혜인님이만든 유저 vo의 클라인트넘버는 인트로, 나는 스트링으로 바꿔주는 작업
		//로그인한정보와 맞는 번호임. 
		
		
		//로그인한 회원의 비번갖고오기. 입력한 비번과 비교하기위함 
			String dbpw = (String) request.getSession().getAttribute("dbpw");
			System.out.println("디비비번은:" + dbpw);
		
		//입력한 번호출력해보기.
		System.out.println("입력한번호는:" + pwd);
		
		if( !passwordEncoder.matches(pwd, dbpw)) {
			System.out.println("틀린암호");
			mv.setViewName("bbs/review_delete");
			mv.addObject("pwchk", "fail");
			return mv;
			
		}else {
			System.out.println("맞는암호");
			int del = bbsService.BbsReviewDeleteOk(RE_NUM);
			mv.setViewName("redirect:/bbs_review_go.do");
			return mv;
		}
		


		
	}
	
	
	//각 수정폼으로
	
	@RequestMapping("/bbs_qa_updateform.do")
	public ModelAndView goBbsQaUpdate(
			@ModelAttribute("BOARD_NUM")String BOARD_NUM,
			@ModelAttribute("cPage")String cPage,
			HttpSession session) {
		
		ModelAndView mv = new ModelAndView("bbs/qa_update");
		
		QA_BBS_VO qnavo = bbsService.getQnaOneList(BOARD_NUM);
		mv.addObject("qnavo", qnavo);
		return mv;
		
	}
	
	
	@RequestMapping("/bbs_review_updateform.do")
	public ModelAndView goBbsReviewUpdate(
			@ModelAttribute("RE_NUM")String RE_NUM,
			@ModelAttribute("cPage")String cPage,
			HttpSession session) {
		
		ModelAndView mv = new ModelAndView("bbs/review_update");
		
		RE_BBS_VO reviewvo = bbsService.getReviewOneList(RE_NUM);
		mv.addObject("reviewvo", reviewvo);
		return mv;
	}
	
	
	
	//수정완료 컨트롤러 : qa
	@RequestMapping("/bbs_qa_updateOk.do")
	public ModelAndView BbsQaUpdateOk(QA_BBS_VO qnavo,HttpServletRequest request,
			@ModelAttribute("cPage")String cPage,
			@ModelAttribute("BOARD_NUM")String BOARD_NUM,
			HttpSession session){
		
		ModelAndView mv = new ModelAndView();
		try {
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile f_param = qnavo.getFile();

			if(f_param.isEmpty()) {
				qnavo.setBOARD_FILE(qnavo.getOld_f_name());
			}else {
				
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString()+"_"+qnavo.getFile().getOriginalFilename();
				qnavo.setBOARD_FILE(f_name);
				
				byte[] in = qnavo.getFile().getBytes();
				
				File out = new File(path, f_name);
				
				FileCopyUtils.copy(in, out);
			}
			
			//회원닉네임 갖고오기 - 작성자에 자동 뜨고 저장하기위함
			String nick = (String) request.getSession().getAttribute("nick");
			System.out.println("로그인한 닉넴 : " + nick); 
			
			//제리똥나온다. vo저장후 맵퍼에 보내자. 저장하라고
			qnavo.setBOARD_WRITER(nick);
			
			//회원client_num 갖고오자. 디비에 넣어야한다. 
			String num = (String) request.getSession().getAttribute("id");
			System.out.println("닉네임의 번호:" + num);
			
		
			qnavo.setCLIENT_NUM(num);
		
			//라디오체크박스 값을 맴퍼에 보내기위해 가지고오기
			String type= request.getParameter("BOARD_TYPE");
			
			//vo에 갖고온값 저장.
			qnavo.setBOARD_TYPE(type);
			
			//비밀글 체크시 제목앞에 붙이기.
			String lock =  request.getParameter("secret_flag");
			System.out.println("비밀글여부  : " + lock);  //1이 비밀글 0은 일반
			
			
			//[비밀] 을 붙일 제목가져오기
			String sub = qnavo.getBOARD_SUBJECT();
			System.out.println(sub);
			
			if(lock.equals("1")) {
				
				qnavo.setBOARD_LOCK("1");
				qnavo.setBOARD_SUBJECT(sub);
			}else {
				qnavo.setBOARD_LOCK("0");
				qnavo.setBOARD_SUBJECT(sub);
			}
			

			int result = bbsService.getQnaUpdateOk(qnavo);
			
			
			if(result >0) {
				mv.setViewName("redirect:/bbs_qa_onelist.do");
				return mv;
			}else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	
	
	//수정완료 일처리 : 리뷰
	@RequestMapping("/bbs_review_updateOk.do")
	public ModelAndView BbsReviewUpdateOk(RE_BBS_VO riviewvo,HttpServletRequest request,
			@ModelAttribute("cPage")String cPage,
			@ModelAttribute("RE_NUM")String RE_NUM,
			HttpSession session){
		
		ModelAndView mv = new ModelAndView();
		try {
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile f_param = riviewvo.getFile();

			if(f_param.isEmpty()) {
				riviewvo.setRE_FILE(riviewvo.getOld_f_name());
			}else {
				
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString()+"_"+riviewvo.getFile().getOriginalFilename();
				riviewvo.setRE_FILE(f_name);
				
				byte[] in = riviewvo.getFile().getBytes();
				
				File out = new File(path, f_name);
				
				FileCopyUtils.copy(in, out);
			}
			
			//회원닉네임 갖고오기 - 작성자에 자동 뜨고 저장하기위함
			String nick = (String) request.getSession().getAttribute("nick");
			System.out.println("로그인한 닉넴 : " + nick); 
			
			//제리똥나온다. vo저장후 맵퍼에 보내자. 저장하라고
			riviewvo.setRE_WRITER(nick);
			
			//회원client_num 갖고오자. 디비에 넣어야한다. 
			String num = (String) request.getSession().getAttribute("id");
			System.out.println("닉네임의 번호:" + num);
			//맞는 17번 나온다, 저장하자, 혜인님이만든 유저 vo의 클라인트넘버는 인트로, 나는 스트링으로 바꿔주는 작업
			riviewvo.setCLIENT_NUM(num);
		
			//라디오체크박스 값을 맴퍼에 보내기위해 가지고오기
			String type= request.getParameter("RE_TYPE");
			
			//vo에 갖고온값 저장.
			riviewvo.setRE_TYPE(type);
			
			//비밀글 체크시 제목앞에 붙이기.
			String lock =  request.getParameter("secret_flag");
			System.out.println("비밀글여부  : " + lock);  //1이 비밀글 0은 일반
			
			
			//[비밀] 을 붙일 제목가져오기
			String sub = riviewvo.getRE_SUBJECT();
			System.out.println(sub);
			
			if(lock.equals("1")) {
				
				riviewvo.setRE_LOCK("1");
				riviewvo.setRE_SUBJECT(sub);
			}else {
				riviewvo.setRE_LOCK("0");
				riviewvo.setRE_SUBJECT(sub);
			}
			

			int result = bbsService.getReviewUpdateOk(riviewvo);
			
			
			if(result >0) {
				mv.setViewName("redirect:/bbs_review_onelist.do");
				return mv;
			}else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	
	@PostMapping("/bbs_ev_search.do")
	public ModelAndView goQaSearch(HttpServletRequest request,
			@RequestParam("searchText")String searchText,
			@RequestParam("searchType")String searchType) {
		
		ModelAndView mv = new ModelAndView();
		
		System.out.println("검색눌러서 불러온 단어: " + searchText);
		System.out.println("검색눌러서 불러온 검색조건타입 : " + searchType);
		
		if(searchType.equals("내용")) {
			//내용이 체크되어 넘어올떄 검색 일처리
			List<EV_BBS_VO> s_result_con = bbsService.EvSearchResultByCon(searchText);
			
			System.out.println("맞는내용을 검색하여 갖고배열: " + s_result_con);
			EV_BBS_VO evo = new EV_BBS_VO();
			
			for (EV_BBS_VO k : s_result_con) {
				System.out.println("갖고온 번호: " + k.getEVENT_NUM());
				System.out.println("갖고온 제목: "+k.getEVENT_SUBJECT());
				System.out.println("갖고온 파일: "+k.getEVENT_FILE());
				System.out.println("갖고온 내용: "+k.getEVENT_CONTENT());
				System.out.println("갖고온 작성자: "+k.getEVENT_WRITER());
				System.out.println("갖고온 날짜: "+k.getEVENT_DATE());
				System.out.println("갖고온 조회수: "+k.getEVENT_HIT());
				
				
				evo.setEVENT_NUM(k.getEVENT_NUM());
				evo.setEVENT_SUBJECT(k.getEVENT_SUBJECT());
				evo.setEVENT_CONTENT(k.getEVENT_CONTENT());
				evo.setEVENT_WRITER(k.getEVENT_WRITER());
				evo.setEVENT_DATE(k.getEVENT_DATE());
				evo.setEVENT_HIT(k.getEVENT_HIT());
				evo.setEVENT_FILE(k.getEVENT_FILE());

				
				
				
			} //결과가 잘나오나 뽑아보았다. 근데 결과가 한개가 아닌 여러개라면? 
			
			mv.addObject("s_result_con", s_result_con);
			return mv;
			
			
		}else if (searchType.equals("제목")) {
			
		}else if (searchType.equals("작성자")) {
			
		}else {
			//널값을 입력했을때, 
		}
		
		return null;
		
	}
	

	
}//마지막괄호

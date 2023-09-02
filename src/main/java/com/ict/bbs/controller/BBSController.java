package com.ict.bbs.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.bbs.model.service.BBS_Service;
import com.ict.bbs.model.vo.EV_BBS_VO;
import com.ict.bbs.model.vo.FA_BBS_VO;
import com.ict.bbs.model.vo.NO_BBS_VO;
import com.ict.bbs.model.vo.QA_BBS_VO;
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
	public ModelAndView goBbsQa(HttpServletRequest request) {
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
		
		String qna_num = request.getParameter("BOARD_NUM");

		
		QA_BBS_VO qnavo = bbsService.getQnaOneList(qna_num);
		
		
		
		mv.addObject("list", list);
		mv.addObject("qnavo", qnavo);
		mv.addObject("paging", paging);



		return mv;

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
	public ModelAndView goBbsQAOneList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("bbs/qa_onelist");
		
		String qna_num = request.getParameter("BOARD_NUM");
		String cPage = request.getParameter("cPage");
				
		//onelist
		QA_BBS_VO qnavo = bbsService.getQnaOneList(qna_num);
		
		mv.addObject("qnavo", qnavo);
		mv.addObject("cPage", cPage);

		return mv;
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
	
	
	@GetMapping("/bbs_qa_writeform.do")
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
	@PostMapping("/bbs_qa_writeOk.do")
	public ModelAndView BbsQaWriteOk(QA_BBS_VO qnavo, HttpServletRequest request) {
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
	
	
	
	
	
	//각 삭제폼으로
	@RequestMapping("/bbs_qa_deleteform.do")
	public ModelAndView goBbsQaDelete(
			@ModelAttribute("BOARD_NUM")String BOARD_NUM,
			@ModelAttribute("cPage")String cPage) {
		ModelAndView mv = new ModelAndView("bbs/qa_delete");
		
		return mv;

	}

	@RequestMapping("/bbs_review_deleteform.do")
	public ModelAndView goBbsReviewDelete() {
		return new ModelAndView("bbs/review_delete");
	}
	
	
	//삭제완료되는 일처리
	/*@RequestMapping("/bbs_deleteOk.do")
	public ModelAndView BbsQaDeleteOk(
			@RequestParam("pwd")String pwd,
			@ModelAttribute("BOARD_NUM")String BOARD_NUM,
			@ModelAttribute("cPage")String cPage) {
		
		ModelAndView mv = new ModelAndView();
		QA_BBS_VO qnavo = bbsService.getQnaOneList(BOARD_NUM);
		
		
		return mv;
	}*/
	
	

	//각 수정폼으로
	
	@RequestMapping("/bbs_qa_updateform.do")
	public ModelAndView goBbsQaUpdate(
			@ModelAttribute("BOARD_NUM")String BOARD_NUM,
			@ModelAttribute("cPage")String cPage) {
		
		ModelAndView mv = new ModelAndView("bbs/qa_update");
		
		QA_BBS_VO qnavo = bbsService.getQnaOneList(BOARD_NUM);
		mv.addObject("qnavo", qnavo);
		return mv;
		
	}
	@RequestMapping("/bbs_review_updateform.do")
	public ModelAndView goBbsReviewUpdate() {
		return new ModelAndView("bbs/review_update");
	}
	
	
	
	//수정완료 컨트롤러
	@RequestMapping("/bbs_qa_updateOk.do")
	public ModelAndView BbsQaUpdateOk(QA_BBS_VO qnavo,HttpServletRequest request,
			@ModelAttribute("cPage")String cPage,
			@ModelAttribute("BOARD_NUM")String BOARD_NUM){
		
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
				qnavo.setBOARD_SUBJECT(sub);
				qnavo.setBOARD_LOCK("1");
			}else {
				qnavo.setBOARD_SUBJECT(sub);
				qnavo.setBOARD_LOCK("0");
			}

			int result = bbsService.getQnaUpdateOk(qnavo);
			
			
			if(result >0) {
				mv.setViewName("redirect:/bbs_qa_go.do");
				return mv;
			}else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	
	
	
}

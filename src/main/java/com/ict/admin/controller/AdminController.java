package com.ict.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.admin.model.service.AdminService;
import com.ict.admin.model.vo.AdminVO;
import com.ict.admin.model.vo.OrderVO;
import com.ict.common.Paging;
import com.ict.user.model.vo.UserVO;

@Controller
public class AdminController {
	@Autowired
	private Paging paging;

	@Autowired
	private AdminService adminService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	// 관리자로그인
	@RequestMapping("/admin_loginok.do")
	public ModelAndView getAdminLoginOk(AdminVO adVO, HttpSession session) {
		// 입력한 id의 패스워드를 DB에 가져와서 입력한 pwd와 비교해서 맞으면 성공 틀리면 실패
		// id로 DB에 저장된 pwd 가져오기
		ModelAndView mv = new ModelAndView("/admin_main/index");
		AdminVO advo = adminService.getAdminPw(adVO.getADMIN_ID());
		// System.out.println(adminService.getAdminPw(adVO.getADMIN_ID()));
		if (!passwordEncoder.matches(adVO.getADMIN_PW(), advo.getADMIN_PW())) {
			session.setAttribute("loginChk", "fail");
			System.out.println("관리자 로그인 실패");
			return mv;
		} else {
			session.setAttribute("advo", advo);
			session.setAttribute("loginChk", "ok");
			// System.out.println("LoginChk: " + session.getAttribute("loginChk"));
			System.out.println("관리자 로그인 됨");

			return mv;
		}
	}

	// 관리자 등록폼
	@RequestMapping("/registmanager.do")
	public ModelAndView getRegistManager() {
		return new ModelAndView("/admin_main/manage/registmanager");
	}

	// 관리자 등록취소
	@RequestMapping("adminManageCancel.do")
	public ModelAndView getAdminManageCancel() {
		return new ModelAndView("/admin_main/manage/adminManagement");
	}

	// 관리자화면
	@RequestMapping("/adminlogin.do")
	public ModelAndView getLoginForm() {
		return new ModelAndView("user/adminlogin");
	}

	// 관리자 등록완료
	@RequestMapping("/adminManageGo.do")
	public ModelAndView getUserManageGo(AdminVO adVO) {
		ModelAndView mv = new ModelAndView("/admin_main/index");
		adVO.setADMIN_PW(passwordEncoder.encode(adVO.getADMIN_PW()));
		int result = adminService.getAdminAdd(adVO);
		if (result > 0) {
			// 성공
			return mv;
		} else {
			// 실패
			return new ModelAndView("errorPage");
		}
	}

	// 닉 중복
	@ResponseBody
	@RequestMapping("/checkAdminNickDuplicate.do")
	public String checkAdminNickDuplicate(@RequestParam String ADMIN_NICK) {
		System.out.println("닉중복콘");
		boolean isDuplicate = adminService.isAdminNickDuplicate(ADMIN_NICK);
		if (isDuplicate) {
			System.out.println("duplicate");
			return "duplicate";
		} else {
			System.out.println("not_duplicate");
			return "not_duplicate";
		}
	}

	// 아이디 중복
	@ResponseBody
	@RequestMapping("checkAdminIdDuplicate.do")
	public String checkAdminIdDuplicate(@RequestParam String ADMIN_ID) {
		System.out.println("넣은아이디" + ADMIN_ID);
		boolean isDuplicate = adminService.isAdminIdDuplicate(ADMIN_ID);
		System.out.println("ADMIN_ID" + ADMIN_ID);
		System.out.println("isDuplicate:" + isDuplicate);
		if (isDuplicate) {
			System.out.println("duplicate");
			return "duplicate";
		} else {
			System.out.println("not_duplicate");
			return "not_duplicate";
		}
	}

	// 관리자관리(들어가면 전체보기)
	@RequestMapping("/adminManagement.do")
	public ModelAndView getAdminManagement(HttpServletRequest request, HttpSession session) {
	    ModelAndView mv = new ModelAndView("/admin_main/manage/adminManagement");
	    
	    // 페이징을 위해 전체개수 구하기(활성 관리자 수)
	    int count = adminService.getCountAdmins();
	    paging.setTotalRecord(count);
	    
	    // 페이징처리
	    if (paging.getTotalRecord() <= paging.getNumPerPage()) {
	        paging.setTotalPage(1);
	    } else {
	        paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
	        if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
	            paging.setTotalPage(paging.getTotalPage() + 1);
	        }
	    }

	    String cPage = request.getParameter("cPage");
	    paging.setNowPage(cPage == null ? 1 : Integer.parseInt(cPage));
	    paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

	    paging.setBeginBlock((int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
	    paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);
	    if (paging.getEndBlock() > paging.getTotalPage()) {
	        paging.setEndBlock(paging.getTotalPage());
	    }

	    // adminManagement.jsp에서 제출한 검색 키워드 및 카테고리를 받기
	    String keyword = request.getParameter("keyword");
	    String category = request.getParameter("category");
	    
	    List<AdminVO> adminList = null;
	    if (keyword != null && !keyword.trim().isEmpty() && category != null && !category.trim().isEmpty()) {
	        // 검색어와 카테고리가 제출된 경우 검색 쿼리를 실행
	        adminList = adminService.getAdminlistByKeyword(category, keyword, paging.getOffset(), paging.getNumPerPage());
	    } else {
	        // 검색어와 카테고리가 제출되지 않은 경우 기존의 전체 목록 쿼리를 실행
	        adminList = adminService.getAdminlist(paging.getOffset(), paging.getNumPerPage());
	    }

	    List<AdminVO> deactivatedAdminList = adminService.getDeactivatedAdminlist(paging.getOffset(), paging.getNumPerPage());
	    int countAdmins = adminList.size();
	    int countDeactivatedAdmins = deactivatedAdminList.size();
	    
	    mv.addObject("paging", paging);
	    mv.addObject("adminList", adminList);
	    mv.addObject("countDeactivatedAdmins", countDeactivatedAdmins);
	    mv.addObject("countAdmins", countAdmins);

	    return mv;
	}


	// 관리자 개인정보
	@RequestMapping("/infoManager.do")
	public ModelAndView viewAdminInfo(@RequestParam("ADMIN_NUM") int ADMIN_NUM) {
		// System.out.println("11111");
		ModelAndView mv = new ModelAndView("/admin_main/manage/infoManager");
		// System.out.println("22222222");
		System.out.println(ADMIN_NUM); // 1이 나옴
		// 데이터베이스에서 해당 관리자 정보 검색
		AdminVO adVO = adminService.getAdminDetail(ADMIN_NUM);
//	    System.out.println(adVO.getADMIN_ADDR());//없음
//	    System.out.println(adVO.getADMIN_BIRTH());//있음
//	    System.out.println(adVO.getADMIN_ID());//있음
//	    System.out.println(adVO.getADMIN_MAIL());//있음
//	    System.out.println(adVO.getADMIN_NAME());//있음
//	    System.out.println(adVO.getADMIN_NICK());//있음
//	    System.out.println(adVO.getADMIN_NUM());//있음
//	    System.out.println(adVO.getADMIN_PHONE());//없음
//	    System.out.println(adVO.getADMIN_PW());//있음
//	    System.out.println(adVO.getADMIN_ST());//있음
		mv.addObject("adVO", adVO);
		return mv;
	}

	// 관리자 개인정보 수정
	@Transactional
	@RequestMapping("/admin_fixok.do")
	public ModelAndView AdminInfoFixOk(@ModelAttribute AdminVO adVO, HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
		try {
			System.out.println("넘어온 아이디" + adVO.getADMIN_ID());
			System.out.println("넘어온 비번" + adVO.getADMIN_PW());
			System.out.println("넘어온 닉넴" + adVO.getADMIN_NICK());
			System.out.println("넘어온 생일" + adVO.getADMIN_BIRTH());
			System.out.println("넘어온 폰" + adVO.getADMIN_PHONE());
			System.out.println("넘어온 메일" + adVO.getADMIN_MAIL());
			System.out.println("넘어온 주소" + adVO.getADMIN_ADDR());
			System.out.println("넘어온 클라아디" + adVO.getADMIN_NUM());

			// If a password is passed, encrypt it
			if (adVO.getADMIN_PW() != null && !adVO.getADMIN_PW().trim().isEmpty()) {
				adVO.setADMIN_PW(passwordEncoder.encode(adVO.getADMIN_PW()));
				System.out.println("수정한 비밀번호" + adVO.getADMIN_PW());
			}
			// 먼저 현재 사용자 정보를 가져옵니다.
			AdminVO currentAdmin = adminService.getAdminPw(adVO.getADMIN_ID());
			// System.out.println("디비 회원비번" + currentAdmin.getADMIN_PW());
			// 각 필드에 대해 값이 없는 경우 현재 값으로 채웁니다.
			if (adVO.getADMIN_PW() == null || adVO.getADMIN_PW().trim().isEmpty()) {
				adVO.setADMIN_PW(currentAdmin.getADMIN_PW());
				System.out.println("DB비번" + currentAdmin.getADMIN_PW());
			}
			if (adVO.getADMIN_BIRTH() == null || adVO.getADMIN_BIRTH().trim().isEmpty()) {
				adVO.setADMIN_BIRTH(currentAdmin.getADMIN_BIRTH());
			}
			if (adVO.getADMIN_NICK() == null || adVO.getADMIN_NICK().trim().isEmpty()) {
				adVO.setADMIN_NICK(currentAdmin.getADMIN_NICK());
			}
			if (adVO.getADMIN_PHONE() == null || adVO.getADMIN_PHONE().trim().isEmpty()) {
				adVO.setADMIN_PHONE(currentAdmin.getADMIN_PHONE());
			}
			if (adVO.getADMIN_MAIL() == null || adVO.getADMIN_MAIL().trim().isEmpty()) {
				adVO.setADMIN_MAIL(currentAdmin.getADMIN_MAIL());
			}
			if (adVO.getADMIN_ADDR() == null || adVO.getADMIN_ADDR().trim().isEmpty()) {
				adVO.setADMIN_ADDR(currentAdmin.getADMIN_ADDR());
			}
			adVO.setADMIN_NAME(currentAdmin.getADMIN_NAME());
			String ADMIN_ID = adVO.getADMIN_ID();
			int ADMIN_NUM = adVO.getADMIN_NUM();
			// 관리자업데이트
			int updatedRows = adminService.updateAdmin(adVO);
			System.out.println("updatedRows" + updatedRows);
			if (updatedRows > 0) {
				httpSession.setAttribute("adVO", adVO);
				httpSession.setAttribute("ADMIN_ID", ADMIN_ID);
				httpSession.setAttribute("message", "관리자 업데이트를 성공했습니다.");
				mv.addObject("ADMIN_NUM", ADMIN_NUM);
				mv.setViewName("redirect:/infoManager.do");
				System.out.println("수정 성공");
			} else {
				httpSession.setAttribute("updateMessage", "실패");
				throw new Exception("관리자 업데이트 실패");
			}
		} catch (Exception e) {
			// 예외 메시지와 스택 트레이스 출력
			e.printStackTrace();
			mv.addObject("error", "관리자를 업데이트하는 동안 오류가 발생했습니다.");
			mv.setViewName("redirect:/infoManager.do");
			System.out.println("업데이트하는 동안 오류");

		}
		return mv;
	}

	// 선택한 관리자(들) 삭제
	@RequestMapping(value = "/deletemanager.do", method = RequestMethod.POST)
	public ResponseEntity<String> deactivateAdmins(@RequestParam String adminIDs, HttpSession session) {
		// 문자열 형태의 관리자 ID를 정수 리스트로 변환
		List<Integer> adminIdList = Arrays.stream(adminIDs.split(",")).map(Integer::parseInt)
				.collect(Collectors.toList());

		try {
			adminService.deactivateAdmins(adminIdList);
			return new ResponseEntity<>("Success", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>("Failure", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 비활성화된 관리자
	@RequestMapping("/getDeactivatedAdmins.do")
	public ModelAndView getDeactivatedAdmins(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("/admin_main/manage/adminManagement");
		// 페이징을 위해 전체개수 구하기(활성 관리자 수)
		int count = adminService.countDeactivatedAdmins();
		paging.setTotalRecord(count);
		
		// 페이징처리
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
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

		List<AdminVO> adminList = adminService.getAdminlist(paging.getOffset(), paging.getNumPerPage());
		List<AdminVO> deactivatedAdminList = adminService.getDeactivatedAdminlist(paging.getOffset(),paging.getNumPerPage());
		// 앞에 몇명인지 보여주는 용도
		int countAdmins = adminList.size();
		int countDeactivatedAdmins = deactivatedAdminList.size();
		mv.addObject("paging", paging);
		mv.addObject("adminList", deactivatedAdminList); // 비활성화된 관리자 목록
		mv.addObject("countAdmins", countAdmins);
		mv.addObject("countDeactivatedAdmins", countDeactivatedAdmins);
		return mv;
	}
	// ==========================================================================================완료

	// 사용자관리
	@RequestMapping("/userManagement.do")
	public ModelAndView getUserManagement(HttpServletRequest request, HttpSession session) {
		return new ModelAndView("/admin_main/manage/userManagement");
	}

	// 이메일 보내기
	@RequestMapping("/emaillist.do")
	public ModelAndView getEmailList() {
		return new ModelAndView("/admin_main/manage/emaillist");
	}

	// 이메일 폼
	@RequestMapping("/emailForm.do")
	public ModelAndView getEmailForm() {
		return new ModelAndView("/admin_main/manage/emailForm");
	}

	// 이메일 폼->목록
	@RequestMapping("/emaillist_go.do")
	public ModelAndView getEmailFormBack() {
		return new ModelAndView("/admin_main/manage/emaillist");
	}

	// 이메일 리스트->세부사항
	@RequestMapping("/emailonelist_go.do")
	public ModelAndView getEmailOneList() {
		return new ModelAndView("/admin_main/manage/mailonelist");
	}

	// 통계
	@RequestMapping("/statistics.do")
	public ModelAndView getStatistics() {
		return new ModelAndView("/admin_main/statistics");
	}

}
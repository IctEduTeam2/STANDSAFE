package com.ict.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.admin.model.service.AdminService;
import com.ict.admin.model.vo.AdminVO;
import com.ict.admin.model.vo.OrderVO;

@Controller
public class AdminController {
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
	public ModelAndView getAdminManagement(HttpSession session) {
	    ModelAndView mv = new ModelAndView("/admin_main/manage/adminManagement");
	    //전체보여주기
	    List<AdminVO> adminList = adminService.getAllAdmins();
	    //관리자 수 카운트
	    int countAdmins = adminService.getCountAdmins();
	    session.setAttribute("adminList", adminList);
	    mv.addObject("countAdmins", countAdmins);
	    mv.addObject("adminList", adminList);
	    return mv;
	}	
// ==========================================================================================완료	
	//관리자 개인정보
	@RequestMapping("/infoManager.do")
	public ModelAndView viewAdminInfo(@RequestParam("ADMIN_NUM") int ADMIN_NUM) {
		System.out.println("11111");
		ModelAndView mv = new ModelAndView("/admin_main/manage/infoManager");
		System.out.println("22222222");
		System.out.println(ADMIN_NUM); //1이 나옴
	    // 데이터베이스에서 해당 관리자 정보 검색
	    AdminVO adVO = adminService.getAdminDetail(ADMIN_NUM);
	    System.out.println(adVO.getADMIN_ADDR());//없음
	    System.out.println(adVO.getADMIN_BIRTH());//있음
	    System.out.println(adVO.getADMIN_ID());//있음
	    System.out.println(adVO.getADMIN_MAIL());//있음
	    System.out.println(adVO.getADMIN_NAME());//있음
	    System.out.println(adVO.getADMIN_NICK());//있음
	    System.out.println(adVO.getADMIN_NUM());//있음
	    System.out.println(adVO.getADMIN_PHONE());//없음
	    System.out.println(adVO.getADMIN_PW());//있음
	    System.out.println(adVO.getADMIN_ST());//있음
	    mv.addObject("adVO", adVO);
	    
	    return mv;
	}
	
	//관리자 개인정보 수정
	//@RequestMapping("")
	//public ModelAndView

	// 사용자관리
	@RequestMapping("/userManagement.do")
	public ModelAndView getUserManagement() {
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
package com.ict.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.user.model.service.PointService;
import com.ict.user.model.service.UserService;
import com.ict.user.model.vo.PointVO;
import com.ict.user.model.vo.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private PointService pointService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	// 로고눌렀을때
	@RequestMapping("/user_logo.do")
	public ModelAndView getUserLogo() {
		return new ModelAndView("index");
	}

	// 관리자에서 로고눌렀을때
	@RequestMapping("/admin_logo.do")
	public ModelAndView getLAdminLogo() {
		return new ModelAndView("admin_main/index");
	}

	// 가입화면으로
	@RequestMapping("/user_joinpage.do")
	public ModelAndView getJoinPage() {
		return new ModelAndView("user/joinpage");
	}

	// 로그인화면
	@RequestMapping("/user_loginform.do")
	public ModelAndView getLoginForm() {
		return new ModelAndView("user/loginform");
	}

	// 로그인작업->메인
	@RequestMapping("/user_loginok.do")
	public ModelAndView getUserLoginOk(UserVO uVO, PointVO pVO, HttpSession session) {
		// 입력한 id의 패스워드를 DB에 가져와서 입력한 pwd와 비교해서 맞으면 성공 틀리면 실패
		// id로 DB에 저장된 pwd 가져오기
		ModelAndView mv = new ModelAndView("index");
		UserVO uvo = userService.getUserPw(uVO.getID());
		System.out.println(userService.getUserPw(uVO.getID()));
		
		//지혜추가.
		String c_id = uvo.getNICKNAME();
		System.out.println("로그인한 닉넴은1 :" + c_id);
		int c_num = uvo.getCLIENT_NUM();
		System.out.println("로그인한 아이디의 번호는 : " + c_num);
		String pw = uvo.getPW();
		System.out.println("로그인한 아이디의 비번은 :" + pw);
		
		
		
		
		if (!passwordEncoder.matches(uVO.getPW(), uvo.getPW())) {
			session.setAttribute("loginChk", "fail");
			System.out.println("로그인 실패");
			return mv;
		} else {
			// 유저의 포인트 보내기
			// PointVO pvo = pointService.getPointsByUserId(uvo.getID());
			// System.out.println("user:" +uvo.getNICKNAME());
			session.setAttribute("uvo", uvo);
			// session.setAttribute("pvo", pvo);
			
			//지혜추가
			session.setAttribute("c_id", c_id);
			session.setAttribute("c_num", c_num);
			session.setAttribute("pw", pw);
			//까지.
			
			session.setAttribute("loginChk", "ok");
			System.out.println("LoginChk: " + session.getAttribute("loginChk"));
			System.out.println("유저 로그인 됨");

			return mv;
		}
	}

	// 로그아웃
	@GetMapping("/logoutGo.do")
	public ModelAndView getLogout(HttpSession session) {
		// 세션 초기화
		// session.invalidate();
		session.removeAttribute("uvo");
		session.removeAttribute("loginChk");
		session.removeAttribute("pvo");
		session.removeAttribute("advo");
		
		//지혜추가
		session.removeAttribute("c_id");
		session.removeAttribute("c_num");
		session.removeAttribute("pw");
		
		return new ModelAndView("redirect:/");
	}

	// 회원가입폼
	@RequestMapping("/user_joinform.do")
	public ModelAndView getJoinForm() {
		return new ModelAndView("user/joinform");
	}

	// 회원가입 완료->메인
	@RequestMapping("/user_joinok.do")
	public ModelAndView getJoinOk(UserVO uVO) {
//		System.out.println("getPW"+uVO.getPW());
//		System.out.println("getADDR"+uVO.getADDR());
//		System.out.println("getEMAIL_ST"+uVO.getEMAIL_ST());
		ModelAndView mv = new ModelAndView("redirect:/");
		// 패스워드 암호화 하자
		uVO.setPW(passwordEncoder.encode(uVO.getPW()));
//		System.out.println("getPW"+passwordEncoder.encode(uVO.getPW()));
		int result = userService.getUserAdd(uVO);
//		System.out.println("2uVO:"+uVO);
//		System.out.println("result:"+result);
		if (result > 0) {
			// 성공
			return mv;
		} else {
			// 실패
			return new ModelAndView("errorPage");
		}
	}

//	// 카카오 회원가입 완료->메인
//	@RequestMapping("/sns_joinok.do")
//	public ModelAndView getSnsJoinOk(UserVO uVO, PointVO pVO, HttpSession session) {
//		ModelAndView mv = new ModelAndView("redirect:/");
//		String NICKNAME = (String) session.getAttribute("NICKNAME");
//		String BIRTH = (String) session.getAttribute("BIRTH");
//		String MAIL = (String) session.getAttribute("MAIL");
//		// 1. Kakao에서 받은 정보를 이용하여 사용자가 이미 존재하는지 확인
//		UserVO uvo = userService.getUserByEmail(uVO.getMAIL());
//
//		if (uvo != null) {
//			// 2-1. 이미 존재하는 사용자이므로 로그인 처리
//			if (!passwordEncoder.matches(uVO.getMAIL(), uvo.getMAIL())) {
//				session.setAttribute("loginChk", "fail");
//				System.out.println("로그인 실패");
//				return mv;
//			} else {
//				// 유저의 포인트 보내기
//				// PointVO pvo = pointService.getPointsByUserId(uvo.getID());
//				// System.out.println("user:" +uvo.getNICKNAME());
//				session.setAttribute("uvo", uvo);
//				// session.setAttribute("pvo", pvo);
//				session.setAttribute("loginChk", "ok");
//				System.out.println("LoginChk: " + session.getAttribute("loginChk"));
//				System.out.println("유저 로그인 됨");
//
//				return mv;
//			}
//		} else {
//			// 2-2. 존재하지 않는 사용자이므로 회원가입 처리
//			uVO.setMAIL(MAIL);
//		    uVO.setNICKNAME(NICKNAME);
//		    uVO.setBIRTH(BIRTH);
//			int result = userService.getUserAdd(uVO);
//			if (result > 0) {
//				// 회원가입 성공 후 로그인 처리
//				UserVO uvo = userService.getUserPw(uVO.getID());
//				System.out.println(userService.getUserPw(uVO.getID()));
//				// 유저의 포인트 보내기
//				// PointVO pvo = pointService.getPointsByUserId(uvo.getID());
//				// System.out.println("user:" +uvo.getNICKNAME());
//				session.setAttribute("uvo", uvo);
//				// session.setAttribute("pvo", pvo);
//				session.setAttribute("loginChk", "ok");
//				System.out.println("LoginChk: " + session.getAttribute("loginChk"));
//				System.out.println("유저 로그인 됨");
//				return mv;
//
//			} else {
//				// 회원가입 실패
//				return new ModelAndView("errorPage");
//			}
//		}
//	}

	// 가입취소->로그인폼
	@RequestMapping("/user_joincancel.do")
	public ModelAndView getJoinCancel() {
		return new ModelAndView("user/loginform");
	}

	// 아이디 찾기 폼
	@RequestMapping("/find_id_form.do")
	public ModelAndView getFindIdForm() {
		return new ModelAndView("user/find_id_form");
	}

	// 비밀번호 찾기 폼
	@RequestMapping("/find_pw_form.do")
	public ModelAndView getFindPwForm() {
		return new ModelAndView("user/find_pw_form");
	}

	// 마이페이지-> 회원정보
	@RequestMapping("/userinfoform.do")
	public ModelAndView getUserInfoForm() {
		return new ModelAndView("user/userinfo");
	}

	// 회원정보->완료버튼
	@RequestMapping("/userInfoFixOk.do")
	public ModelAndView getUserInfoFixOk() {
		return new ModelAndView("user/mypage");
	}

	// 회원정보->취소버튼
	@RequestMapping("/userInfoFixCancel.do")
	public ModelAndView getUserInfoFixCancel() {
		return new ModelAndView("user/mypage");
	}

	// 주문
	@RequestMapping("/order.do")
	public ModelAndView getOrderGo() {
		return new ModelAndView("shopping/order");
	}

	// 위시리스트
	@RequestMapping("/wishlist.do")
	public ModelAndView getWishlistGo() {
		return new ModelAndView("shopping/wishlist");
	}

	// 장바구니
	@RequestMapping("/basket.do")
	public ModelAndView getBasketGo() {
		return new ModelAndView("shopping/basket");
	}

	// 내 게시글
	@RequestMapping("/myboard.do")
	public ModelAndView getMyBoardGo() {
		return new ModelAndView("user/myboard");
	}

	// 탈퇴
	@RequestMapping("/userWithdrawal.do")
	public ModelAndView getWithdrawalGo() {
		return new ModelAndView("index");
	}

	// 개인정보처리방침
	@RequestMapping("/privacypolicy.do")
	public ModelAndView getPrivacypolicyGo() {
		return new ModelAndView("privacypolicy");
	}

	// 팀
	@RequestMapping("/team.do")
	public ModelAndView getTeamGo() {
		return new ModelAndView("team");
	}
}

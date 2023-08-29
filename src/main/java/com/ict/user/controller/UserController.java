package com.ict.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

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

	// 로그인완료->메인
	@RequestMapping("/admin_loginok.do")
	public ModelAndView getAdminLoginOk() {
		return new ModelAndView("admin_main/index");
	}

	// 회원가입폼
	@RequestMapping("/user_joinform.do")
	public ModelAndView getJoinForm() {
		return new ModelAndView("user/joinform");
	}

	// 회원가입 완료->메인
	@RequestMapping("/user_joinok.do")
	public ModelAndView getJoinOk() {
		return new ModelAndView("index");
	}

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

	// 다음주소
	@RequestMapping("/kakaoaddr.do")
	public ModelAndView Kakaoaddr() {
		return new ModelAndView("user/kakao_addr");
	}
	/*
	 * @RequestMapping("/kakao_addr_ok.do") public ModelAndView kakaoAddrOk(Addr_VO
	 * addrVO) { ModelAndView mv = new ModelAndView("redirect:/"); //DB처리, 기타 등
	 * System.out.println(addrVO.getAddress());
	 * System.out.println(addrVO.getPostcode()); if(addrVO.getDetailAddress() ==
	 * null || addrVO.getDetailAddress() == ""){ System.out.println("상세없음"); }else{
	 * System.out.println(addrVO.getDetailAddress()); }
	 * System.out.println(addrVO.getExtraAddress()); return mv; }
	 */

}

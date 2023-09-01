package com.ict.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.shopping.model.vo.PopUpVO;
import com.ict.user.model.service.UserService;
import com.ict.user.model.vo.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
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
	@PostMapping("/admin_loginok.do")
	public ModelAndView getAdminLoginOk(UserVO uVO, HttpSession session) {
		// 입력한 id의 패스워드를 DB에 가져와서 입력한 pwd와 비교해서 맞으면 성공 틀리면 실패
		// id로 DB에 저장된 pwd 가져오기 
		ModelAndView mv = new ModelAndView("index");
		UserVO uvo = userService.getUserPw(uVO.getID());
		System.out.println(userService.getUserPw(uVO.getID()));
		if (!passwordEncoder.matches(uVO.getPW(), uvo.getPW())) {
			System.out.println("로그인 안될때 이전비번?"+uVO.getPW());
			System.out.println("로그인 안될때 현재비번?"+uvo.getPW());
			session.setAttribute("loginChk", "fail");
			System.out.println("로그인 실패");
			return mv;
		} else {
			System.out.println("user:" +uvo.getNICKNAME());
			System.out.println("로그인 될때 이전비번?"+uVO.getPW());
			System.out.println("로그인 될때 현재비번?"+uvo.getPW());
			session.setAttribute("uvo", uvo);
			session.setAttribute("loginChk", "ok");
			System.out.println("유저 로그인 됨");
			// admin 성공시
			if (uvo.getID().equals("admin")) {
				session.setAttribute("admin", "ok");
				System.out.println("관리자 로그인 됨");
			}
			return mv;
		}
	}
	//로그아웃
	@GetMapping("/logoutGo.do")
	public ModelAndView getLogout(HttpSession session) {
		// 세션 초기화
		// session.invalidate();
		session.removeAttribute("uvo");
		session.removeAttribute("loginChk");
		session.removeAttribute("admin");
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
		System.out.println("getPW"+uVO.getPW());
		System.out.println("getADDR"+uVO.getADDR());
		System.out.println("getEMAIL_ST"+uVO.getEMAIL_ST());
		ModelAndView mv = new ModelAndView("redirect:/");
		// 패스워드 암호화 하자
		uVO.setPW(passwordEncoder.encode(uVO.getPW()));
		System.out.println("getPW"+passwordEncoder.encode(uVO.getPW()));
		int result = userService.getUserAdd(uVO);
		System.out.println("2uVO:"+uVO);
		System.out.println("result:"+result);
		if(result > 0) {
			//성공
			return mv;
		}else {
			//실패
			return new ModelAndView("errorPage");
		}
	}
	
	
	///아이디 중복체크
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("ID") String ID) {	
		int cnt = userService.idCheck(ID);
		return cnt;
	}
	
	/// 아이디 중복체크
	@PostMapping("/nickCheck")
	@ResponseBody
	public int nickCheck(@RequestParam("NICKNAME") String NICKNAME) {
		int cnt = userService.nickCheck(NICKNAME);
		return cnt;
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

	// 다음주소
	@RequestMapping("/kakaoaddr.do")
	public ModelAndView Kakaoaddr() {
		return new ModelAndView("user/kakao_addr");
	}
}

package com.ict.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
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
	public ModelAndView getUserLoginOk(UserVO uVO, PointVO pVO, HttpSession session, HttpServletRequest request) {
		// 입력한 id의 패스워드를 DB에 가져와서 입력한 pwd와 비교해서 맞으면 성공 틀리면 실패
		// id로 DB에 저장된 pwd 가져오기
		ModelAndView mv = new ModelAndView();
	    // DB에서 ID에 해당하는 유저가 있는지 boolean으로 확인
		//uVO.getID():입력한 아이디
		System.out.println("로그인1");
		
		
			/*//지혜추가.
				String pw = uVO.getPW();
				System.out.println("로그인한 아이디의 비번은 :" + pw);*/
		
		boolean userExists = userService.isIdDuplicate(uVO.getID());
	    // 아이디가 존재하지 않을 때
	    if (!userExists) {
	        session.setAttribute("loginChk", "noUser");
	        System.out.println("아이디가 존재하지 않습니다.");
	        mv.setViewName("user/loginform");
	        return mv;
	    }
	    // DB에서 ID에 해당하는 패스워드 가져오기
	    UserVO uvo = userService.getUserPw(uVO.getID());
	    // 패스워드가 일치하지 않을 때
	    if (!passwordEncoder.matches(uVO.getPW(), uvo.getPW())) {
	        session.setAttribute("loginChk", "fail");
	        System.out.println("로그인 실패");
	        mv.setViewName("user/loginform");
	        return mv;
	    }  
	    // 로그인 성공
	    session.setAttribute("uvo", uvo);
	    if (uvo != null) {
	        System.out.println("CLIENT_NUM: " + uvo.getCLIENT_NUM());
	        int POINT_REM = pointService.getPointsByUserId(uvo.getCLIENT_NUM());
	        
	      //지혜추가
	        int c_id = uvo.getCLIENT_NUM();
	        String id=Integer.toString(c_id);
	        
	        String dbpw = uvo.getPW();
	        String nick = uvo.getNICKNAME();
	        System.out.println("지혜가받을세션번호:id" + id);
	        System.out.println("지혜가받을세션비번임:pw" + dbpw);
	        System.out.println("지혜가받을세션닉넴임:nick" + nick);
			session.setAttribute("id", id);
			session.setAttribute("dbpw", dbpw);
			session.setAttribute("nick", nick);
			
			//까지.
			
	        session.setAttribute("POINT_REM", POINT_REM);
	        session.setAttribute("loginChk", "ok");
	        System.out.println("유저 로그인 됨");
	        
	        mv.setViewName("redirect:/");
	    }
	    return mv;
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
		session.removeAttribute("id");
		session.removeAttribute("dbpw");
		session.removeAttribute("nick");
		session.removeAttribute("reponelist");
        session.removeAttribute("qaonelist");
        session.removeAttribute("revonelist"); //까지

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
		ModelAndView mv = new ModelAndView("redirect:/");
		// 패스워드 암호화 하자
		uVO.setPW(passwordEncoder.encode(uVO.getPW()));
		int result = userService.getUserAdd(uVO);
		//내부 DAO에 포인트 금액 넣는것 있음 
		if (result > 0) {
			// 성공
			return mv;
		} else {
			// 실패
			return new ModelAndView("errorPage");
		}
	}
	//비번 중복
	@ResponseBody
	@RequestMapping("/checkPwDuplicate.do")
	public String checkPwDuplicate(@RequestParam String PW, @RequestParam String ID) {
		System.out.println("가져온 PW"+PW);
		System.out.println("가져온 ID"+ID);
	    // DB에서 ID에 해당하는 패스워드 가져오기
	    UserVO uvo = userService.getUserPw(ID);
	    System.out.println("DB PW"+uvo.getID());
	    // 패스워드가 일치하지 않을 때
	    if (!passwordEncoder.matches(PW, uvo.getPW())) {
	        System.out.println("not_duplicate");
	        return "not_duplicate";
	    } else {
	        System.out.println("duplicate");
	        return "duplicate";
	    }
	}

	   

	
	// 닉 중복
		@ResponseBody
		@RequestMapping("/checkNickDuplicate.do")
		public String checkNickDuplicate(@RequestParam String NICKNAME) {
		    System.out.println("닉중복콘");
		    boolean isDuplicate = userService.isNickDuplicate(NICKNAME);
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
		@RequestMapping("/checkIdDuplicate.do")
		public String checkIdDuplicate(@RequestParam String ID) {
			boolean isDuplicate = userService.isIdDuplicate(ID);
			System.out.println("ID"+ID);
			System.out.println("isDuplicate:"+isDuplicate);
			if (isDuplicate) {
				System.out.println("duplicate");
				return "duplicate";
			} else {
				System.out.println("not_duplicate");
				return "not_duplicate";
			}
		}
		
	// 카카오 회원가입 완료->메인
	@RequestMapping("/sns_loginok.do")
	public ModelAndView getSNSJoinOk(HttpSession session, UserVO uVO, PointVO pVO) {
		System.out.println("카카오 진입");
	    ModelAndView mv = new ModelAndView();
	  
	 // 세션에서 정보 가져오기
	    String ID = (String) session.getAttribute("MAIL");
	    String NICKNAME = (String) session.getAttribute("NICKNAME");
	    String BIRTH = (String) session.getAttribute("BIRTH");

	    // 기존 코드에서 누락된 필드에 대한 기본값 설정
	    String PW = "defaultPassword";  // 또는 null 대신 적절한 값을 설정
	    String TEMP_PW = "defaultTempPassword";  // 또는 null 대신 적절한 값을 설정
	    String PHONE = "defaultPhone";  // 또는 null 대신 적절한 값을 설정
	    String ADDR = "defaultAddress";  // 또는 null 대신 적절한 값을 설정

	    uVO.setID(ID);
	    uVO.setPW(PW);
	    uVO.setTEMP_PW(TEMP_PW);
	    uVO.setM_NAME(NICKNAME);
	    uVO.setNICKNAME(NICKNAME);
	    uVO.setMAIL(ID);
	    uVO.setBIRTH(BIRTH);
	    uVO.setPHONE(PHONE);
	    uVO.setADDR(ADDR);
	    uVO.setEMAIL_ST(1);

	    // DB에서 이메일에 해당하는 유저 정보 조회(메일을 아이디로 비교할거임)
	    boolean userExists = userService.isIdDuplicate(ID); // Changed from uVO.getID()

	    if (!userExists) {
	        // 회원가입 로직        
	        System.out.println(uVO.toString());      
	        // 회원가입
	        userService.getUserAdd(uVO);
	        
	        // 로그인 처리
	        session.setAttribute("uvo", uVO);
	    }
	    
	    // 로그인 체크
	    if (uVO != null) { 
	    	System.out.println("로그인 체크");
	        int POINT_REM = pointService.getPointsByUserId(uVO.getCLIENT_NUM());
	        session.setAttribute("POINT_REM", POINT_REM);
	        session.setAttribute("loginChk", "ok");
	        System.out.println("유저 로그인 됨");
	    }
	    mv.setViewName("index");
	    return mv;
	}

	
//==========================================================================================완료
	
	// 유저정보 수정
	@Transactional
	@RequestMapping("/user_userfixok.do")
	public ModelAndView getUserFixOk(UserVO userVO) {
		ModelAndView mv = new ModelAndView();
		try {
			boolean isUpdated = userService.updateUser(userVO);

			if (isUpdated) {
				mv.addObject("message", "사용자 업데이트를 성공했습니다.");
				mv.setViewName("redirect:/userinfoform.do"); // 같은페이지 ㄱㄱ
			} else {
				// If update is not successful
				throw new Exception("사용자 업데이트 실패");
			}
		} catch (Exception e) {
			// 예외를 기록하고 트랜잭션 롤백
			mv.addObject("error", "사용자를 업데이트하는 동안 오류가 발생했습니다.");
			//mv.setViewName("redirect:/userinfoform.do"); /// 같은페이지 ㄱㄱ
		}
		return mv;
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
}
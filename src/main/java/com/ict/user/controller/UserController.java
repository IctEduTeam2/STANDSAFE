package com.ict.user.controller;

import java.text.SimpleDateFormat;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

import com.ict.user.model.service.MailService;
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
	private MailService mailService;

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
	public ModelAndView getUserLoginOk(@ModelAttribute UserVO uVO, PointVO pVO, HttpSession session,
	        HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();

	    boolean userExists = userService.isIdDuplicate(uVO.getID());
	    if (!userExists) {
	        session.setAttribute("loginChk", "noUser");
	        mv.setViewName("user/loginform");
	        return mv;
	    }

	    UserVO uvo = userService.getUserPw(uVO.getID());
	    if (uvo != null) {
	        if (uvo.getOUT_ST() == 0) {
	            session.setAttribute("loginChk", "withdraw");
	            mv.setViewName("user/loginform");
	            return mv;
	        }

	        String tempPassword = uvo.getTEMP_PW();
	        boolean isTempPasswordMatch = tempPassword != null && !tempPassword.isEmpty() && passwordEncoder.matches(uVO.getPW(), tempPassword);
	        boolean isOriginalPasswordMatch = passwordEncoder.matches(uVO.getPW(), uvo.getPW());

	        if (isTempPasswordMatch || isOriginalPasswordMatch) {
	            // 로그인 성공 처리
	            session.setAttribute("uvo", uvo);
	            session.setAttribute("id", Integer.toString(uvo.getCLIENT_NUM()));
	            session.setAttribute("dbpw", uvo.getPW());
	            session.setAttribute("nick", uvo.getNICKNAME());
	            session.setAttribute("ID", uvo.getID());
	            //session.setAttribute("POINT_REM", pointService.getPointsByUserId(uvo.getCLIENT_NUM()));
	            mv.addObject("POINT_REM", pointService.getPointsByUserId(uvo.getCLIENT_NUM()));
	            session.setAttribute("loginChk", "ok");
	            mv.setViewName("redirect:/");
	        } else {
	            // 로그인 실패 처리
	            session.setAttribute("loginChk", "fail");
	            mv.setViewName("user/loginform");
	        }
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

		// 지혜추가
		session.removeAttribute("id");
		session.removeAttribute("dbpw");
		session.removeAttribute("nick");
		session.removeAttribute("reponelist");
		session.removeAttribute("qaonelist");
		session.removeAttribute("revonelist"); // 까지

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
		// 내부 DAO에 포인트 금액 넣는것 있음
		if (result > 0) {
			// 성공
			return mv;
		} else {
			// 실패
			return new ModelAndView("errorPage");
		}
	}

	// 비번 중복
	@ResponseBody
	@RequestMapping("/checkPwDuplicate.do")
	public String checkPwDuplicate(@RequestParam String PW, @RequestParam String ID) {
		System.out.println("가져온 PW" + PW);
		System.out.println("가져온 ID" + ID);
		// DB에서 ID에 해당하는 패스워드 가져오기
		UserVO uvo = userService.getUserPw(ID);
		System.out.println("DB PW" + uvo.getID());
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
		System.out.println("ID" + ID);
		System.out.println("isDuplicate:" + isDuplicate);
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
		String PW = "defaultPassword"; // 또는 null 대신 적절한 값을 설정
		String TEMP_PW = "defaultTempPassword"; // 또는 null 대신 적절한 값을 설정
		String PHONE = "defaultPhone"; // 또는 null 대신 적절한 값을 설정
		String ADDR = "defaultAddress"; // 또는 null 대신 적절한 값을 설정

		uVO.setID(ID);
		uVO.setPW(PW);
		uVO.setTEMP_PW(TEMP_PW);
		uVO.setM_NAME(NICKNAME);

		Random rand = new Random();
		int randomNum = rand.nextInt(10000); // 0~9999 사이의 값
		char randomChar = (char) ('A' + rand.nextInt(26)); // A~Z 사이의 문자
		uVO.setNICKNAME("User" + randomChar + randomNum); // 결과 예: UserA1234

		uVO.setMAIL(ID);
		uVO.setBIRTH(BIRTH);
		uVO.setPHONE(PHONE);
		uVO.setADDR(ADDR);
		uVO.setEMAIL_ST(1);
		

		// DB에서 이메일에 해당하는 유저 정보 조회(메일을 아이디로 비교할거임)
		boolean userExists = userService.isIdDuplicate(ID); // Changed from uVO.getID()
		System.out.println(userExists);
		if (!userExists) {
			// 회원가입 로직
			System.out.println(uVO.toString());
			// 회원가입
			userService.getUserAdd(uVO);
			//TempPW삭제
			userService.resetTempPW(ID);

			// 로그인 처리
			session.setAttribute("uvo", uVO);
		}

		// 로그인 체크
		UserVO existingUser = userService.getUserPw(ID);
		if (existingUser != null) {
			System.out.println("로그인 체크");
			int POINT_REM = pointService.getPointsByUserId(existingUser.getCLIENT_NUM());
			session.setAttribute("POINT_REM", POINT_REM);
			session.setAttribute("nick", existingUser.getNICKNAME());
			session.setAttribute("uvo", uVO);
			session.setAttribute("loginChk", "ok");
			System.out.println("유저 로그인 됨");
		}
		mv.setViewName("redirect:/");
		return mv;
	}

	// 유저수정
	@Transactional
	@RequestMapping("/user_userfixok.do")
	public ModelAndView getUserFixOk(@ModelAttribute UserVO userVO, HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
		try {
//	    	System.out.println("넘어온 아이디"+userVO.getID());
//	    	System.out.println("넘어온 비번"+userVO.getPW());
//	    	System.out.println("넘어온 닉넴"+userVO.getNICKNAME());
//	    	System.out.println("넘어온 생일"+userVO.getBIRTH());
//	    	System.out.println("넘어온 폰"+userVO.getPHONE());
//	    	System.out.println("넘어온 메일"+userVO.getMAIL());
//	    	System.out.println("넘어온 주소"+userVO.getADDR());
//	    	System.out.println("넘어온 클라아디"+userVO.getCLIENT_NUM());

			// If a password is passed, encrypt it
			if (userVO.getPW() != null && !userVO.getPW().trim().isEmpty()) {
				userVO.setPW(passwordEncoder.encode(userVO.getPW()));
				System.out.println("수정한 비밀번호" + userVO.getPW());
			}
			// 먼저 현재 사용자 정보를 가져옵니다.
			UserVO currentUser = userService.getUserPw(userVO.getID());
			System.out.println("디비 회원비번" + currentUser.getPW());
			// 각 필드에 대해 값이 없는 경우 현재 값으로 채웁니다.
			if (userVO.getPW() == null || userVO.getPW().trim().isEmpty()) {
				userVO.setPW(currentUser.getPW());
				System.out.println("DB비번" + currentUser.getPW());
			}
			if (userVO.getBIRTH() == null || userVO.getBIRTH().trim().isEmpty()) {
				userVO.setBIRTH(currentUser.getBIRTH());
			}
			if (userVO.getNICKNAME() == null || userVO.getNICKNAME().trim().isEmpty()) {
				userVO.setNICKNAME(currentUser.getNICKNAME());
			}
			if (userVO.getPHONE() == null || userVO.getPHONE().trim().isEmpty()) {
				userVO.setPHONE(currentUser.getPHONE());
			}
			if (userVO.getMAIL() == null || userVO.getMAIL().trim().isEmpty()) {
				userVO.setMAIL(currentUser.getMAIL());
			}
			if (userVO.getADDR() == null || userVO.getADDR().trim().isEmpty()) {
				userVO.setADDR(currentUser.getADDR());
			}
			userVO.setM_NAME(currentUser.getM_NAME());
			String ID = userVO.getID();
			int updatedRows = userService.updateUser(userVO);
			//TempPW삭제
			userService.resetTempPW(ID);
			System.out.println("updatedRows" + updatedRows);
			if (updatedRows > 0) {
				httpSession.setAttribute("uvo", userVO);
				httpSession.setAttribute("message", "사용자 업데이트를 성공했습니다.");
				mv.setViewName("redirect:/userinfoform.do");
				System.out.println("수정 성공");
			} else {
				httpSession.setAttribute("updateMessage", "실패");
				throw new Exception("사용자 업데이트 실패");
			}
		} catch (Exception e) {
			// 예외 메시지와 스택 트레이스 출력
			e.printStackTrace();
			mv.addObject("error", "사용자를 업데이트하는 동안 오류가 발생했습니다.");
			mv.setViewName("redirect:/userinfoform.do");
			System.out.println("업데이트하는 동안 오류");

		}
		return mv;
	}

	// 가입취소->로그인폼
	@RequestMapping("/user_joincancel.do")
	public ModelAndView getJoinCancel() {
		return new ModelAndView("user/loginform");
	}

	// 탈퇴
	@Transactional
	@RequestMapping("/userWithdrawal.do")
	public ModelAndView getWithdrawalGo(@ModelAttribute UserVO uVO, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String ID = (String) session.getAttribute("ID");
		uVO.setID(ID);
		UserVO existingUser = userService.getUserPw(ID); // 전체불러오기
		System.out.println("아이디:" + ID);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentTime = sdf.format(new Date());
		uVO.setOUT_TIME(currentTime);// 현재시간 등록-뽑아오기
		try {
			int outupdate = userService.userOut(existingUser);
			if (outupdate > 0) {
				session.setAttribute("withdrawalChk", "success");
				session.invalidate();
				System.out.println("탈퇴 성공");

				return new ModelAndView("redirect:/");
			} else {
				throw new Exception("탈퇴 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("error", "오류가 발생했습니다.");
			mv.setViewName("user/mypage");
			System.out.println("오류");
			return mv;
		}
	}

	// 로그인 => 아이디 찾기 폼
	@RequestMapping("/find_id_form.do")
	public ModelAndView getFindIdForm() {
		return new ModelAndView("user/find_id_form");
	}

	// 아이디찾기->아이디 결과폼
	@RequestMapping("/find_id_result")
	public ModelAndView searchId(HttpServletRequest request, UserVO uVO, HttpSession session,
			@RequestParam String M_NAME, @RequestParam String MAIL) {
		ModelAndView mv = new ModelAndView("user/find_id_result");
		try {
			uVO.setM_NAME(M_NAME);
			uVO.setMAIL(MAIL);

			System.out.println("넣은 이름:" + uVO.getM_NAME());
			System.out.println("넣은 메일:" + MAIL);

			// ID 꺼내오기
			UserVO userResult = userService.findMemberId(uVO);

			if (userResult != null && userResult.getID() != null) {
				String ID = userResult.getID();
				System.out.println("가져온 아이디:" + ID);
				mv.addObject("M_NAME", M_NAME);
				mv.addObject("ID", ID);
			}

		} catch (Exception e) {
			mv.addObject("msg", "오류가 발생되었습니다.");
			e.printStackTrace();
		}
		return mv;
	}

	// 로그인 => 비밀번호 찾기 폼
	@RequestMapping("/find_pw_form.do")
	public ModelAndView getFindPwForm() {
		return new ModelAndView("user/find_pw_form");
	}

//	// 비밀번호 찾아서 메일보내기
//	// 아이디찾기->아이디 결과폼
//	//@Transactional
//	@RequestMapping("/find_pw_result")
//	public ModelAndView searchPw(HttpServletRequest request, UserVO uVO, HttpSession session, @RequestParam String ID, @RequestParam String MAIL) {
//	    ModelAndView mv = new ModelAndView("user/find_pw_result");
//	    try {
//	        uVO.setID(ID);
//	        uVO.setMAIL(MAIL);
//
//	        UserVO userResult = userService.findMemberMail(uVO);
//
//	        if (userResult != null && userResult.getMAIL() != null) {
//	            //내부 이메일 뽑기
//	        	String resultMAIL = userResult.getMAIL();
//	            //임시비번 null만들기
//	            userService.resetTempPW(ID);
//	            //임시비번 만들어넣기
//	            String TEMP_PWtxt = UUID.randomUUID().toString().substring(0, 6);
//	            //암호화해야함.
//	            uVO.setTEMP_PW(passwordEncoder.encode(TEMP_PWtxt));
//	            userService.upsertTempPW(uVO);
//	            
//	            // Use MailService to send the email
//	            mailService.sendEmail(TEMP_PWtxt, resultMAIL);
//	            
//	            session.setAttribute("mailChk", "success");
//	            mv.addObject("MAIL", resultMAIL);
//	        }
//
//	    } catch (Exception e) {
//	        mv.addObject("msg", "오류가 발생되었습니다.");
//	        session.setAttribute("mailChk", "success");
//	        mv.setViewName("find_pw_form");
//	        e.printStackTrace();
//	    }
//	    return mv;
//	}
	
	//내 포인트
		@RequestMapping("/pointRecords.do")
		public ModelAndView viewPoints(HttpSession session) {
		    ModelAndView mv = new ModelAndView("user/pointRecords");
		    
		 // 세션에서 로그인한 사용자의 세부 정보 검색
		    UserVO uvo = (UserVO) session.getAttribute("uvo");
		    
		    if (uvo == null) {
		    	//로그인 페이지로 리디렉션하거나 오류 메시지를 표시하는 등의 경우 처리
		        mv.setViewName("user/loginform");
		        return mv;
		    }

		 // CLIENT_NUM을 기반으로 로그인한 사용자의 포인트 레코드 검색
		    List<PointVO> records = pointService.getPointRecordsForUser(uvo.getCLIENT_NUM());
		    mv.addObject("pointRecords", records);
		    return mv;
		}
		
	//
		
		
// ==========================================================================================완료
	
	// 내 게시글
	@RequestMapping("/myboard.do")
	public ModelAndView getMyBoardGo() {
		return new ModelAndView("user/myboard");
	}
// ==========================================================================================게시글만 남음
	
	
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
package com.ict.user.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ict.user.model.dao.PointDAO;
import com.ict.user.model.dao.UserDAO;
import com.ict.user.model.vo.PointVO;
import com.ict.user.model.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO userDAO;
	@Autowired
    private PointDAO pointDAO;
	
	//1.일반 로그인
	@Override
	public UserVO getUserPw(String ID) {
		return userDAO.getUserPw(ID);
	}
	
	// 회원가입
	@Transactional
	public int getUserAdd(UserVO uVO) {
	    // 회원 가입 처리
	    int result  = userDAO.getUserAdd(uVO);  // CLIENT_NUM을 반환하도록 수정
	    // 회원 가입이 성공적으로 이루어진 경우
	    if (result > 0) {
	    	int CLIENT_NUM = uVO.getCLIENT_NUM();
	        PointVO pVO = new PointVO();
	        pVO.setCLIENT_NUM(CLIENT_NUM); // 회원 번호 설정
	        System.out.println(CLIENT_NUM);
	        pVO.setPOINT_REM(10000); // 초기 보유 포인트는 10000
	        // 포인트 부여 처리
	        int pointResult = pointDAO.getJoinpoint(pVO);

	        if (pointResult > 0) {
	            return result; // 회원 가입과 포인트 부여가 모두 성공적으로 이루어졌을 경우
	        } else {
	            throw new RuntimeException("초기 포인트를 부여하지 못함"); // 포인트 부여 실패
	        }
	    } else {
	        return -1; // 회원 가입 실패
	    }
	}
	
	
	//아이디중복
	public boolean isIdDuplicate(String ID) {
	    int cnt = userDAO.isIdDuplicate(ID);
	    return cnt > 0;
	}
	
	//닉네임중복
	@Override
	public boolean isNickDuplicate(String NICKNAME) {
	    int cnt = userDAO.isNickDuplicate(NICKNAME);
	    return cnt > 0; 
	}
	
	//회원정보 업데이트
	@Override
	public int updateUser(UserVO userVO) {
	    return userDAO.updateUser(userVO);
	}
	
	
	//sns로그인 이메일 비교
	@Override
	public UserVO getUserByEmail(String MAIL) {
		return userDAO.getUserByEmail(MAIL);
	}
	//탈퇴
	@Override
	public int userOut(UserVO uVO) {
		return userDAO.userOut(uVO);
	}
	//아이디찾기
	@Override
	public UserVO findMemberId(UserVO uVO) {
		return userDAO.findMemberId(uVO);
	}
	//아이디 찾아서 비번교체
	@Override
	public UserVO findMemberMail(UserVO uVO) {
		return userDAO.findMemberMail(uVO);
	}
	//비번교체용 인서트(업서트는 유니크키 문제로 안함)
	@Override
	public UserVO upsertTempPW(UserVO uVO) {
		return userDAO.upsertTempPW(uVO);
	}
	//TEMP_PW 비우기
	@Override
	public int resetTempPW(String ID) {
		return userDAO.resetTempPW(ID);
	}


	
}

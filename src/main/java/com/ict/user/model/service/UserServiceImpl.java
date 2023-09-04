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
	@Override
	public int getUserAdd(UserVO uVO) {
		return userDAO.getUserAdd(uVO);
	}
	
	
	/*@Transactional // 이 어노테이션을 통해 이 메서드 내의 작업이 하나의 트랜잭션으로 처리됩니다.
    public int getUserAdd(UserVO uVO) {
        // 회원 가입 처리
        int userResult = userDAO.getUserAdd(uVO);

        // 회원 가입이 성공적으로 이루어진 경우
        if (userResult > 0) {
            PointVO pVO = new PointVO();
            pVO.setCLIENT_NUM(uVO.getCLIENT_NUM()); // 회원 번호 설정
            pVO.setPOINT_REM(10000); // 초기 보유 포인트는 10000

            // 포인트 부여 처리
            int pointResult = pointDAO.insertPoints(pVO);
            System.out.println("pointResult"+pointResult);
            if (pointResult > 0) {
                return userResult; // 회원 가입과 포인트 부여가 모두 성공적으로 이루어졌을 경우
            } else {
                throw new RuntimeException("초기 포인트를 부여하지 못함"); // 포인트 부여 실패
            }
        } else {
            return userResult; // 회원 가입 실패
        }
    }*/
	
	
	//아이디중복
	@Override
	public int idCheck(String ID) {
		int cnt = userDAO.idCheck(ID);
		System.out.println("cnt: " + cnt);
		return cnt;
	}
	
	//닉네임중복
	@Override
	public int nickCheck(String NICKNAME) {
		int cnt = userDAO.nickCheck(NICKNAME);
		System.out.println("cnt: " + cnt);
		return cnt;
	}
	
	//sns로그인 이메일 비교
	@Override
	public UserVO getUserByEmail(String MAIL) {
		return userDAO.getUserByEmail(MAIL);
	}
	
	
}

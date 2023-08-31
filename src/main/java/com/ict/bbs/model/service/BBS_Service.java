package com.ict.bbs.model.service;

import java.util.List;

import com.ict.bbs.model.vo.EV_BBS_VO;
import com.ict.bbs.model.vo.FA_BBS_VO;
import com.ict.bbs.model.vo.NO_BBS_VO;

public interface BBS_Service {

	//공지사항 
	//전체리스트 
	public List<NO_BBS_VO> getnoticelist();
	
	//페이징을 위한 전체게시물 구하기
	public int getTotalNoticeCount();
	//시작과 끝 블럭 구하기
	public List<NO_BBS_VO> getnoticelist(int offset, int limit);
	
	//조회수
	int getNoticeHitUpdate(String notice_num);
	
	//onelist
	public NO_BBS_VO getNoticeOneList(String notice_num);
	
	
	
	
	//이벤트
	//전체리스트 
	public List<EV_BBS_VO> geteventlist();
	
	//페이징을 위한 전체게시물 구하기
	public int getTotalEventCount();
	//시작과 끝 블럭 구하기
	public List<EV_BBS_VO> geteventlist(int offset, int limit);
	
	
	int getEventHitUpdate(String event_num);
	
	//onelist
	public EV_BBS_VO getEventOneList(String event_num);
	
	
	//이용안내 FAQ
	//전체리스트 
	public List<FA_BBS_VO> getfaqlist();
	
	//페이징을 위한 전체게시물 구하기
	public int getTotalFaqCount();
	//시작과 끝 블럭 구하기
	public List<FA_BBS_VO> getfaqlist(int offset, int limit);
	
	FA_BBS_VO getFaqOneList(String faq_num);
	
	int getFaqHitUpdate(String faq_num);
	
	
	
}

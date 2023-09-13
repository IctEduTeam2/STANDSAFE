package com.ict.admin.model.service;

import java.util.List;

import com.ict.admin.model.vo.NoticeVO;

public interface NoticeService {
	
	//공지사
	//전체보기
	List<NoticeVO> getadnoticelist();
	
	//페이징을 위한 전체게시물 구하기
	public int getTotalRecord();
	
	//시작과 끝 블럭 구하기
	public List<NoticeVO> getadnoticelist(int offset, int limit);
	
	//조회수
	int getAdNoticeHitUpdate(String notice_num);
	
	//onelist
	public NoticeVO getAdNoticeOneList(String notice_num);
	
	//검색 
	
	//삭제된 게시물 보기 
	List<NoticeVO> getDeletedNotices();

	
	
	
}

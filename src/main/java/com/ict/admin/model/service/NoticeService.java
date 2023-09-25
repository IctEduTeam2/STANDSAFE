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
	
	//테이블 삭제 버튼
	int getupdateNoticeById(String notice_num);
	
	//삭제게시물 검색 버튼
	List<NoticeVO> getDeletedNoti();
	//int getDeletedNoti(String notice_num);
	
	
	//검색(전체리스트)
	List<NoticeVO> getAllNotices();
	
	//검색 (특정 추출)
	//searchKey,searchText,searchTitle,start1,close1
	public List<NoticeVO> adNotiSearch(String searchKey,String searchText,String searchTitle,String start1,String close1,String mg_type);

	//int getRecordByStatus(int statusCode);

}

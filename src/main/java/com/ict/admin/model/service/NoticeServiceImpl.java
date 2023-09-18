package com.ict.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.admin.model.dao.NoticeDAO;
import com.ict.admin.model.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDAO noticeDAO;
	
	//공지사항
	@Override
	public List<NoticeVO> getadnoticelist(){
		return noticeDAO.getadnoticelist();
	}
	
	@Override
	public int getTotalRecord() {
		return noticeDAO.getTotalRecord();
	}
	
	@Override
	public List<NoticeVO> getadnoticelist(int offset, int limit){
		return noticeDAO.getadnoticelist(offset, limit);
	}
	
	@Override
	public int getAdNoticeHitUpdate(String notice_num) {
		return noticeDAO.getAdNoticeHitUpdate(notice_num);
	}
	
	@Override
	public NoticeVO getAdNoticeOneList(String notice_num) {
		return noticeDAO.getAdNoticeOneList(notice_num);
	}
	
	//테이블 삭제 버튼
	@Override
	public int getupdateNoticeById(String notice_num) {
		return noticeDAO.getupdateNoticeById(notice_num);
	}
	
	//삭제게시물 검색 버튼
	@Override
	public List<NoticeVO> getDeletedNoti(int noticeNum) {
		return noticeDAO.getDeletedNoti(noticeNum);
		
	}
//	public int getDeletedNoti(String notice_num) {
//		return noticeDAO.getDeletedNoti(notice_num);
//	}
//	
	
	
	
	//검색
	@Override
	public List<NoticeVO> adNotiSearch(String searchKey,String searchText,String searchTitle,String start1,String close1) {
		return noticeDAO.adNotiSearch(searchKey,searchText,searchTitle,start1,close1);
	}
}

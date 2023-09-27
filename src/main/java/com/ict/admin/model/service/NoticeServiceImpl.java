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
	
//	@Override
//	public int getRecordByStatus(int statusCode) {
//		return noticeDAO.getRecordByStatus(statusCode);
//	}
	
	//공지사항
	//공지사항 실시간 게시글
	@Override
	public int getTotalNotices() {
		return noticeDAO.getTotalNotices();
	}
	@Override
	public int getRegisteredNotices() {
		return noticeDAO.getRegisteredNotices();
	}
	@Override
	public int getDeletedNotices() {
		return noticeDAO.getDeletedNotices();
	}

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
	public int updateNoticeStatus(String notice_num) {
	    return noticeDAO.updateNoticeStatus(notice_num);
	}
	
	//홈페이지 등록 버튼
	@Override
    public boolean updateNoticeStatus(String notice_num, int notice_st) {
        // 여기에서 데이터베이스 업데이트 로직을 수행합니다.
        // noticeDAO를 이용하여 업데이트를 수행합니다.
        int result = noticeDAO.updateNoticeStatus(notice_num, notice_st);
        return result > 0; // 업데이트 성공 여부를 반환합니다.
    }
	
	//삭제게시물 검색 버튼
	@Override
	public List<NoticeVO> getDeletedNoti() {
		return noticeDAO.getDeletedNoti();	
	}

	//검색(전체리스트)
	public List<NoticeVO> getAllNotices() {
		return noticeDAO.getAllNotices();
	}
	
	//검색(특정 추출)
	@Override
	public List<NoticeVO> adNotiSearch(String searchKey,String searchText,String searchTitle,String start1,String close1,String mg_type) {
		return noticeDAO.adNotiSearch(searchKey,searchText,searchTitle,start1,close1,mg_type);
	}
	
	
	

}

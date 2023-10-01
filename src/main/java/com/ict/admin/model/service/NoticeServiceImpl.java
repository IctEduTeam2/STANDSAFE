package com.ict.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.admin.model.dao.NoticeDAO;
import com.ict.admin.model.vo.FaqVO;
import com.ict.admin.model.vo.NoticeVO;
import com.ict.admin.model.vo.QaVO;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDAO noticeDAO;
	
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
	//notice 수정완료
	@Override
	public int getNoticeUpdateOk(NoticeVO mvo) {
		return noticeDAO.getNoticeUpdateOk(mvo);
	}
	//notice 단독삭제
	@Override
	public int NoticeDeleteOk(String notice_num) {
		return noticeDAO.NoticeDeleteOk(notice_num);
	}
	//notice 작성완료
	@Override
	public int getNotiWriteOk(NoticeVO mvo) {
		return noticeDAO.getNotiWriteOk(mvo);
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
	    public int upNotitabst(String notice_num) {
	        return noticeDAO.upNotitabst(notice_num);
	 }
	//홈페이지 등록 버튼
	@Override
		public int updateNoticeStatus(String notice_num) {
			return noticeDAO.updateNoticeStatus(notice_num);
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
	//===============================================================================================
	//QA
	//QA 전체 게시글
	@Override
	public int getTotalQa() {
		return noticeDAO.getTotalQa();
	}
	//QA 삭제 게시글
	@Override
	public int getDeletedQa() {
		return noticeDAO.getDeletedQa();
	}
	//삭제게시물 검색 버튼
	@Override
	public List<QaVO> getDeleQa() {
		return noticeDAO.getDeleQa();	
	}
	//검색(전체리스트)
	@Override
	public List<QaVO> getAllQa() {
		return noticeDAO.getAllQa();
	}
	//검색(특정 추출)
	@Override
	public List<QaVO> adSearchQa(String searchKey,String searchText,String searchTitle,String start1,String close1,String mg_type) {
		return noticeDAO.adSearchQa(searchKey,searchText,searchTitle,start1,close1,mg_type);
	}
	//테이블 삭제 버튼
	 @Override
	 public int upQatabst(String board_num) {
	    return noticeDAO.upQatabst(board_num);
	 }
	 
	 //
	 @Override
	 public QaVO getQaOneList(String board_num) {
		 return noticeDAO.getQaOneList(board_num);
	 }
	 //삭제 폼
	 @Override
	 public int QaDeleteOk(String board_num) {
		 return noticeDAO.QaDeleteOk(board_num);
	 }
	 //답글
	 @Override
		public int getLevUpdate(Map<String, Integer> map) {
			return noticeDAO.getLevUpdate(map);
	}
	 //
	 @Override
	 public int getAnsWriteOk(QaVO qvo) {
		 return noticeDAO.getAnsWriteOk(qvo);
	 }
	//===============================================================================================
	//QA
	//전체게시물
	@Override
	public int getTotalFaq() {
		return noticeDAO.getTotalFaq();
	}
	//등록게시물
	@Override
	public int getRegisteredFaq() {
		return noticeDAO.getRegisteredFaq();
	}
	//삭제게시물
	@Override
	public int getDeletedFaq() {
		return noticeDAO.getDeletedFaq();
	}
	//삭제게시물 검색버튼
	@Override
	public List<FaqVO> getDeleFaq() {
		return noticeDAO.getDeleFaq();	
	}

}

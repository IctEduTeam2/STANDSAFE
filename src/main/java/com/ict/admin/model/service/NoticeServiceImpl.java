package com.ict.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.admin.model.dao.NoticeDAO;
import com.ict.admin.model.vo.EventVO;
import com.ict.admin.model.vo.FaqVO;
import com.ict.admin.model.vo.NoticeVO;
import com.ict.admin.model.vo.PopUpSVO;
import com.ict.admin.model.vo.QaVO;
import com.ict.admin.model.vo.ReVO;
import com.ict.admin.model.vo.ReportVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;

	// 공지사항
	// 공지사항 실시간 게시글
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
	public List<NoticeVO> getadnoticelist() {
		return noticeDAO.getadnoticelist();
	}

	// notice 수정완료
	@Override
	public int getNoticeUpdateOk(NoticeVO mvo) {
		return noticeDAO.getNoticeUpdateOk(mvo);
	}

	// notice 단독삭제
	@Override
	public int NoticeDeleteOk(String notice_num) {
		return noticeDAO.NoticeDeleteOk(notice_num);
	}

	// notice 작성완료
	@Override
	public int getNotiWriteOk(NoticeVO mvo) {
		return noticeDAO.getNotiWriteOk(mvo);
	}

	@Override
	public int getTotalRecord() {
		return noticeDAO.getTotalRecord();
	}

	@Override
	public List<NoticeVO> getadnoticelist(int offset, int limit) {
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

	// 테이블 삭제 버튼
	@Override
	public int upNotitabst(String notice_num) {
		return noticeDAO.upNotitabst(notice_num);
	}

	// 홈페이지 등록 버튼
	@Override
	public int updateNoticeStatus(String notice_num) {
		return noticeDAO.updateNoticeStatus(notice_num);
	}

	// 삭제게시물 검색 버튼
	@Override
	public List<NoticeVO> getDeletedNoti() {
		return noticeDAO.getDeletedNoti();
	}

	// 검색(전체리스트)
	@Override
	public List<NoticeVO> getAllNotices() {
		return noticeDAO.getAllNotices();
	}

	// 검색(특정 추출)
	@Override
	public List<NoticeVO> adNotiSearch(String searchKey, String searchText, String searchTitle, String start1,
			String close1, String mg_type) {
		return noticeDAO.adNotiSearch(searchKey, searchText, searchTitle, start1, close1, mg_type);
	}

	// ===============================================================================================
	// QA
	// QA 전체 게시글
	@Override
	public int getTotalQa() {
		return noticeDAO.getTotalQa();
	}

	// QA 삭제 게시글
	@Override
	public int getDeletedQa() {
		return noticeDAO.getDeletedQa();
	}

	// 삭제게시물 검색 버튼
	@Override
	public List<QaVO> getDeleQa() {
		return noticeDAO.getDeleQa();
	}

	// 검색(전체리스트)
	@Override
	public List<QaVO> getAllQa() {
		return noticeDAO.getAllQa();
	}

	// 검색(특정 추출)
	@Override
	public List<QaVO> adSearchQa(String searchKey, String searchText, String searchTitle, String start1, String close1,
			String mg_type) {
		return noticeDAO.adSearchQa(searchKey, searchText, searchTitle, start1, close1, mg_type);
	}

	// 테이블 삭제 버튼
	@Override
	public int upQatabst(String board_num) {
		return noticeDAO.upQatabst(board_num);
	}

	//
	@Override
	public QaVO getQaOneList(String board_num) {
		return noticeDAO.getQaOneList(board_num);
	}

	// 삭제 폼
	@Override
	public int QaDeleteOk(String board_num) {
		return noticeDAO.QaDeleteOk(board_num);
	}

	// 답글
	@Override
	public int getLevUpdate(Map<String, Integer> map) {
		return noticeDAO.getLevUpdate(map);
	}

	//
	@Override
	public int getAnsWriteOk(QaVO qvo) {
		return noticeDAO.getAnsWriteOk(qvo);
	}
	//답변상태
	@Override
	public int getStUpdate(String board_num) {
		return noticeDAO.getStUpdate(board_num);
	}

	// ===============================================================================================
	// FAQ
	// 전체게시물
	@Override
	public int getTotalFaq() {
		return noticeDAO.getTotalFaq();
	}

	// 등록게시물
	@Override
	public int getRegisteredFaq() {
		return noticeDAO.getRegisteredFaq();
	}

	// 삭제게시물
	@Override
	public int getDeletedFaq() {
		return noticeDAO.getDeletedFaq();
	}

	// 삭제게시물 검색버튼
	@Override
	public List<FaqVO> getDeleFaq() {
		return noticeDAO.getDeleFaq();
	}

	// 검색(전체리스트)
	@Override
	public List<FaqVO> getAllFaq() {
		return noticeDAO.getAllFaq();
	}

	// 검색(특정 추출)
	@Override
	public List<FaqVO> adFaqSearch(String searchKey, String searchText, String searchTitle, String start1,
			String close1, String mg_type) {
		return noticeDAO.adFaqSearch(searchKey, searchText, searchTitle, start1, close1, mg_type);
	}

	// 테이블 삭제 버튼
	@Override
	public int upFaqtabst(String fa_num) {
		return noticeDAO.upFaqtabst(fa_num);
	}

	// 홈페이지 등록 버튼
	@Override
	public int updateFaqStatus(String fa_num) {
		return noticeDAO.updateFaqStatus(fa_num);
	}
	// faq 작성완료
	@Override
	public int getFaqWriteOk(FaqVO faqvo) {
		return noticeDAO.getFaqWriteOk(faqvo);
	}

	// ===============================================================================================
	// Event
	// 전체게시물
	@Override
	public int getTotalEvent() {
		return noticeDAO.getTotalEvent();
	}

	// 등록게시물
	@Override
	public int getRegisteredEvent() {
		return noticeDAO.getRegisteredEvent();
	}

	// 삭제게시물
	@Override
	public int getDeletedEvent() {
		return noticeDAO.getDeletedEvent();
	}

	// 삭제게시물 검색 버튼
	@Override
	public List<EventVO> getDeletedEve() {
		return noticeDAO.getDeletedEve();
	}

	// 검색(전체리스트)
	@Override
	public List<EventVO> getAllEvent() {
		return noticeDAO.getAllEvent();
	}

	// 검색(특정 추출)
	@Override
	public List<EventVO> adEventSearch(String searchKey, String searchText, String searchTitle, String start1,
			String close1, String mg_type) {
		return noticeDAO.adEventSearch(searchKey, searchText, searchTitle, start1, close1, mg_type);
	}

	// 테이블 삭제 버튼
	@Override
	public int upevetabst(String event_num) {
		return noticeDAO.upevetabst(event_num);
	}

	// 홈페이지 등록 버튼
	@Override
	public int updateEventStatus(String event_num) {
		return noticeDAO.updateEventStatus(event_num);
	}

	// 조회수
	@Override
	public int getAdEveHitUpdate(String event_num) {
		return noticeDAO.getAdEveHitUpdate(event_num);
	}

	// onelist
	@Override
	public EventVO getAdEveOnelist(String event_num) {
		return noticeDAO.getAdEveOnelist(event_num);
	}

	// event 작성완료
	@Override
	public int getEveWriteOk(EventVO evevo) {
		return noticeDAO.getEveWriteOk(evevo);
	}

	// event 수정완료
	@Override
	public int getEeUpdateOk(EventVO evevo) {
		return noticeDAO.getEeUpdateOk(evevo);
	}

	// event 단독삭제
	@Override
	public int EventDeleteOk(String event_num) {
		return noticeDAO.EventDeleteOk(event_num);
	}
	
	// ===============================================================================================
	// 리뷰
	// 리뷰 전체 게시글
	@Override
	public int getTotalReview() {
		return noticeDAO.getTotalReview();
	}
	// QA 삭제 게시글
	@Override
	public int getDeletedReview() {
		return noticeDAO.getDeletedReview();
	}
	// 삭제게시물 검색 버튼
	@Override
	public List<ReVO> getDeleRev() {
		return noticeDAO.getDeleRev();
	}
	// 검색(전체리스트)
	@Override
	public List<ReVO> getAllRev() {
		return noticeDAO.getAllRev();
	}
	// 검색(특정 추출)
	@Override
	public List<ReVO> adSearchRev(String searchKey, String searchText, String searchTitle, String start1,
			String close1, String mg_type) {
		return noticeDAO.adSearchRev(searchKey, searchText, searchTitle, start1, close1, mg_type);
	}
	// 테이블 삭제 버튼
	@Override
	public int upRevtabst(String re_num) {
		return noticeDAO.upRevtabst(re_num);
	}
	// onelist
	@Override
	public ReVO getReOneList(String re_num) {
		return noticeDAO.getReOneList(re_num);
	}
	// 리뷰 단독삭제
	@Override
	public int ReviewDeleteOk(String re_num) {
		return noticeDAO.ReviewDeleteOk(re_num);
	}
	// 답글
	@Override
	public int getReLevUpdate(Map<String, Integer> map) {
		return noticeDAO.getReLevUpdate(map);
	}
	//
	@Override
	public int ReplyWriteOk(ReVO rvo) {
		return noticeDAO.ReplyWriteOk(rvo);
	}
	//답변상태
	@Override
	public int getReStUpdate(String re_num) {
		return noticeDAO.getReStUpdate(re_num);
	}
	
	// ===============================================================================================
	// 신고
	// 전체 신고 게시글
	@Override
	public int getTotalReport() {
		return noticeDAO.getTotalReport();
	}
	// 삭제 신고 게시글
	@Override
	public int getDeletedReport() {
		return noticeDAO.getDeletedReport();
	}
	// 삭제게시물 검색 버튼
	@Override
	public List<ReportVO> getDeleRep() {
		return noticeDAO.getDeleRep();
	}
	// 검색(전체리스트)
	@Override
	public List<ReportVO> getAllRep() {
		return noticeDAO.getAllRep();
	}
	// 검색(특정 추출)
	@Override
	public List<ReportVO> adSearchRep(String searchKey, String searchText, String searchTitle, String start1,
			String close1, String mg_type) {
		return noticeDAO.adSearchRep(searchKey, searchText, searchTitle, start1, close1, mg_type);
	}
	// 테이블 삭제 버튼
	@Override
	public int upReptabst(String report_num) {
		return noticeDAO.upReptabst(report_num);
	}
	// onelist
	@Override
	public ReportVO getRepOneList(String report_num) {
		return noticeDAO.getRepOneList(report_num);
	}
	// 리뷰 단독삭제
	@Override
	public int ReportDeleteOk(String report_num) {
		return noticeDAO.ReportDeleteOk(report_num);
	}
	// 답글
	@Override
	public int getReLepUpdate(Map<String, Integer> map) {
		return noticeDAO.getReLepUpdate(map);
	}
	//
	@Override
	public int ReportWriteOk(ReportVO rpvo) {
		return noticeDAO.ReplyWriteOk(rpvo);
	}
	//답변상태
	@Override
	public int getRepStUpdate(String report_num) {
		return noticeDAO.getRepStUpdate(report_num);
	}
	// ===============================================================================================
	// 팝업/슬라이드
	// 전체게시물
	@Override
	public int getTotalPopup() {
		return noticeDAO.getTotalPopup();
	}

	// 등록게시물
	@Override
	public int getRegisteredPopup() {
		return noticeDAO.getRegisteredPopup();
	}
	// 미등록게시물
	@Override
	public int getUnRegisteredPopup() {
		return noticeDAO.getUnRegisteredPopup();
	}

	// 삭제게시물
	@Override
	public int getDeletedPopup() {
		return noticeDAO.getDeletedPopup();
	}
	// 삭제게시물 검색 버튼
	@Override
	public List<PopUpSVO> getDeletedPop() {
		return noticeDAO.getDeletedPop();
	}
	// 검색(전체리스트)
	@Override
	public List<PopUpSVO> getAllPopup() {
		return noticeDAO.getAllPopup();
	}
	// 검색(특정 추출)
	@Override
	public List<PopUpSVO> adPopupSearch(String searchKey, String searchText, String searchTitle, String start1,
			String close1, String mg_type) {
		return noticeDAO.adPopupSearch(searchKey, searchText, searchTitle, start1, close1, mg_type);
	}
	// 테이블 삭제 버튼
	@Override
	public int upPopUptabst(String popup_num) {
		return noticeDAO.upPopUptabst(popup_num);
	}
	// 홈페이지 등록 버튼
	@Override
	public int updatePopStatus1(String popup_num) {
		return noticeDAO.updatePopStatus1(popup_num);
	}
	@Override
	public int updatePopStatus2(String popup_num) {
		return noticeDAO.updatePopStatus2(popup_num);
	}
	@Override
	public int getPopupWriteOk(PopUpSVO popvo) {
		return noticeDAO.getPopupWriteOk(popvo);
	}

}

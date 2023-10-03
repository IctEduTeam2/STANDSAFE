package com.ict.admin.model.service;

import java.util.List;
import java.util.Map;

import com.ict.admin.model.vo.EventVO;
import com.ict.admin.model.vo.FaqVO;
import com.ict.admin.model.vo.NoticeVO;
import com.ict.admin.model.vo.PopUpSVO;
import com.ict.admin.model.vo.QaVO;
import com.ict.admin.model.vo.ReVO;
import com.ict.admin.model.vo.ReportVO;

public interface NoticeService {
	
	//공지사항
	//공지사항 실시간 게시물
	int getTotalNotices();
	// 등록된 공지사항 게시물
	int getRegisteredNotices();
	// 삭제된 공지사항 게시물
	int getDeletedNotices();
	
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
	
	//notice 수정완료
	int getNoticeUpdateOk(NoticeVO mvo);
	
	//notice 단독삭제
	public int NoticeDeleteOk(String notice_num);
	
	//notice 작성완료
	public int getNotiWriteOk(NoticeVO mvo);
	
	//테이블 삭제 버튼
	int upNotitabst(String notice_num);
	
	//삭제게시물 검색 버튼
	List<NoticeVO> getDeletedNoti();

	//검색(전체리스트)
	List<NoticeVO> getAllNotices();
	
	//검색 (특정 추출)
	public List<NoticeVO> adNotiSearch(String searchKey,String searchText,String searchTitle,String start1,String close1,String mg_type);

	//홈페이지 등록
	public int updateNoticeStatus(String notice_num);
	
	//===============================================================================================
	//QA
	//공지사항 QA 게시물
	int getTotalQa();
	// 삭제된 QA 게시물
	int getDeletedQa();
	//삭제게시물 검색 버튼
	List<QaVO> getDeleQa();	
	//검색(전체리스트)
	List<QaVO> getAllQa();
	//검색 (특정 추출)
	public List<QaVO> adSearchQa(String searchKey,String searchText,String searchTitle,String start1,String close1,String mg_type);
	//테이블 삭제 버튼
	int upQatabst(String board_num);
	//
	public QaVO getQaOneList(String board_num);
	//삭제폼
	public int QaDeleteOk(String board_num);
	//답글
	int getLevUpdate(Map<String, Integer> map);
	//작성완료
	int getAnsWriteOk(QaVO qvo);
	//답변완료 상태
	int getStUpdate(String board_num);
	
	//===============================================================================================
	//FQA
	//FQA 전체 게시물
	int getTotalFaq();
	// 등록된 FQA 게시물
	int getRegisteredFaq();
	// 삭제된 FQA 게시물
	int getDeletedFaq();
	//삭제게시물 검색 버튼
	List<FaqVO> getDeleFaq();
	//검색(전체리스트)
	List<FaqVO> getAllFaq();
	//검색 (특정 추출) 
	public List<FaqVO> adFaqSearch(String searchKey,String searchText,String searchTitle,String start1,String close1,String mg_type);
	//테이블 삭제 버튼
	int upFaqtabst(String fa_num);
	//홈페이지 등록
	public int updateFaqStatus(String fa_num);
	//faq 작성완료
	public int getFaqWriteOk(FaqVO faqvo);
	
	
	
	//===============================================================================================
	//Event
	//Event 전체 게시물
	int getTotalEvent();
	// 등록된 Event 게시물
	int getRegisteredEvent();
	// 삭제된 Event 게시물
	int getDeletedEvent();
	//삭제게시물 검색 버튼
	List<EventVO> getDeletedEve();
	//검색(전체리스트)
	List<EventVO> getAllEvent();
	//검색 (특정 추출)
	public List<EventVO> adEventSearch(String searchKey,String searchText,String searchTitle,String start1,String close1,String mg_type);
	//테이블 삭제 버튼
	public int upevetabst(String event_num);
	//홈페이지 등록
	public int updateEventStatus(String event_num);
	//조회수
	int getAdEveHitUpdate(String event_num);
	//onelist
	public EventVO getAdEveOnelist(String event_num);
	//event 작성완료
	public int getEveWriteOk(EventVO evevo);
	//event 수정완료 
	int getEeUpdateOk(EventVO evevo);
	//event 단독삭제
	public int EventDeleteOk(String event_num);
	
	
	//===============================================================================================
	//Review
	//리뷰 전체 게시물
	int getTotalReview();
	//삭제된 리뷰 게시물
	int getDeletedReview();
	//삭제게시물 검색 버튼
	List<ReVO> getDeleRev();
	//검색(전체리스트)
	List<ReVO> getAllRev();
	//검색 (특정 추출) 
	public List<ReVO> adSearchRev(String searchKey,String searchText,String searchTitle,String start1,String close1,String mg_type);
	//테이블 삭제 버튼
	int upRevtabst(String re_num);
	//onelist
	public ReVO getReOneList(String re_num);
	//리뷰 단독삭제
	public int ReviewDeleteOk(String re_num);
	//답글
	int getReLevUpdate(Map<String, Integer> map);
	//작성완료
	int ReplyWriteOk(ReVO rvo);
	//답변완료 상태
	int getReStUpdate(String re_num);
	
	//===============================================================================================
	//Report
	//전체 신고 게시물
	int getTotalReport();
	//삭제된 신고 게시물
	int getDeletedReport();
	//삭제게시물 검색 버튼
	List<ReportVO> getDeleRep();
	//검색(전체리스트)
	List<ReportVO> getAllRep();
	//검색 (특정 추출) 
	public List<ReportVO> adSearchRep(String searchKey,String searchText,String searchTitle,String start1,String close1,String mg_type);
	//테이블 삭제 버튼
	int upReptabst(String report_num);
	//onelist
	public ReportVO getRepOneList(String report_num);
	//리뷰 단독삭제
	public int ReportDeleteOk(String report_num);
	//답글
	int getReLepUpdate(Map<String, Integer> map);
	//작성완료
	int ReportWriteOk(ReportVO rpvo);
	//답변완료 상태
	int getRepStUpdate(String report_num);
	
	//===============================================================================================
	//팝업/슬라이드
	// 전체 팝업/슬라이드 게시물
	int getTotalPopup();
	// 등록된 팝업/슬라이드 게시물
	int getRegisteredPopup();
	// 미등록된 팝업/슬라이드 게시물
	int getUnRegisteredPopup();
	// 삭제된 팝업/슬라이드 게시물
	int getDeletedPopup();
	//삭제게시물 검색 버튼
	List<PopUpSVO> getDeletedPop();
	//검색(전체리스트)
	List<PopUpSVO> getAllPopup();
	//검색 (특정 추출)
	public List<PopUpSVO> adPopupSearch(String searchKey,String searchText,String searchTitle,String start1,String close1,String mg_type);
	//테이블 삭제 버튼
	int upPopUptabst(String popup_num);
	//홈페이지 등록
	public int updatePopStatus1(String popup_num);
	public int updatePopStatus2(String popup_num);
	//작성완료
	int getPopupWriteOk(PopUpSVO popvo);
	
}

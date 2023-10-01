package com.ict.admin.model.service;

import java.util.List;
import java.util.Map;

import com.ict.admin.model.vo.FaqVO;
import com.ict.admin.model.vo.NoticeVO;
import com.ict.admin.model.vo.QaVO;

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
	//
	int getAnsWriteOk(QaVO qvo);
	
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
	
}

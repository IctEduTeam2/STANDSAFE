package com.ict.bbs.model.service;

import java.util.List;

import com.ict.bbs.model.vo.EV_BBS_VO;
import com.ict.bbs.model.vo.FA_BBS_VO;
import com.ict.bbs.model.vo.NO_BBS_VO;
import com.ict.bbs.model.vo.QA_BBS_VO;
import com.ict.bbs.model.vo.REP_BBS_VO;
import com.ict.bbs.model.vo.RE_BBS_VO;
import com.ict.bbs.model.vo.Review_comVO;
import com.ict.shopping.model.vo.ProductVO;


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

	
	
	
	//Q&A
	//전체리스트 
	public List<QA_BBS_VO> getqnalist();
	//페이징을 위한 전체게시물 구하기
	public int getTotalQnaCount();
	//시작과 끝 블럭 구하기
	public List<QA_BBS_VO> getqnalist(int offset, int limit);
	//onelist
	public QA_BBS_VO getQnaOneList(String qna_num);
	//작성
	int getQnaWriteOk(QA_BBS_VO qnavo);
	//수정
	int getQnaUpdateOk(QA_BBS_VO qnavo);
	
	int BbsQaDeleteOk(String BOARD_NUM);

	public List<QA_BBS_VO> getQnqGList(String g_num);
	int getQna_re_del(String k);
	
	//신고
	public List<REP_BBS_VO> getreportlist();
	//페이징을 위한 전체게시물 구하기
	public int getTotalReportCount();
	//시작과 끝 블럭 구하기
	public List<REP_BBS_VO> getreportlist(int offset, int limit);
	//onelist
	public REP_BBS_VO getReportOneList(String rep_num);
	//작성
	int getReportWriteOk(REP_BBS_VO repvo);

	
	
	
	
	//review
	//전체리스트 
	public List<RE_BBS_VO> getreviewlist();
		
	//페이징을 위한 전체게시물 구하기
	public int getTotalReviewCount();
	//시작과 끝 블럭 구하기
	public List<RE_BBS_VO> getreviewlist(int offset, int limit);
	//onelist
	public RE_BBS_VO getReviewOneList(String review_num);
	//작성
	int getReviewWriteOk(RE_BBS_VO reivewvo);
	//수정
	int getReviewUpdateOk(RE_BBS_VO reivewvo);
	int BbsReviewDeleteOk(String RE_NUM);
	public List<RE_BBS_VO> getReGList(String g_num);
	int getRe_re_del(String k);
	int getCartnumSt(String c_num);
	
	//=========================================================================
	//검색 이벤트 -검색
	public List<EV_BBS_VO> EvSearchResultByCon(String searchText);
	public List<EV_BBS_VO> EvSearchResultBySub(String searchText);
	
	//검색 faq -검색
	public List<FA_BBS_VO> FaSearchResultByCon(String searchText);
	public List<FA_BBS_VO> FaSearchResultBySub(String searchText);
	
	//검색 공지사항 -검색
	public List<NO_BBS_VO> NoticeSearchResultByCon(String searchText);
	public List<NO_BBS_VO> NoticeSearchResultBySub(String searchText);

	//검색 qa -검색
	public List<QA_BBS_VO> QaSearchResultByCon(String searchText);
	public List<QA_BBS_VO> QaSearchResultBySub(String searchText);
	public List<QA_BBS_VO> QaSearchResultByWriter(String searchText);
	
	//검색 reivew -검색
	public List<RE_BBS_VO> RevSearchResultByCon(String searchText);
	public List<RE_BBS_VO> RevSearchResultBySub(String searchText);
	public List<RE_BBS_VO> RevSearchResultByWriter(String searchText);
	
	//============================================================================

	
	//검색2 : 검색페이지에서 검색
	public List<NO_BBS_VO> searchNotice(String s_type,String word,String start,String end);
	public List<FA_BBS_VO> searchFaq(String s_type,String word,String start,String end);
	public List<EV_BBS_VO> searchEvent(String s_type,String word,String start,String end);
	public List<QA_BBS_VO> searchQa(String s_type,String word,String start,String end);
	public List<RE_BBS_VO> searchReview(String s_type,String word,String start,String end);
	
	
	
	
	//콤보
	public List<ProductVO> getProductList(String high, String low);
	
	
	//물품번호 찾기
	public String getProdName(String p_num);
	
	//리뷰리스트 찾기
	public List<Review_comVO> getReviewcomList(String sessionid);
	
	//pay_t의 review_st 1로 변경하기
	int updateReviewStonPayT(String p_num);
}

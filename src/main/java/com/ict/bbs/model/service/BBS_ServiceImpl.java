package com.ict.bbs.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.bbs.model.dao.BBS_DAO;
import com.ict.bbs.model.vo.EV_BBS_VO;
import com.ict.bbs.model.vo.FA_BBS_VO;
import com.ict.bbs.model.vo.NO_BBS_VO;
import com.ict.bbs.model.vo.QA_BBS_VO;
import com.ict.bbs.model.vo.REP_BBS_VO;
import com.ict.bbs.model.vo.RE_BBS_VO;
import com.ict.bbs.model.vo.Review_comVO;
import com.ict.shopping.model.vo.ProductVO;


@Service
public class BBS_ServiceImpl implements BBS_Service{
	
	@Autowired
	BBS_DAO bbsDAO;

	
	//공지사항 부분
	@Override
	public List<NO_BBS_VO> getnoticelist() {
		
		return bbsDAO.getnoticelist();
	}
	@Override
	public int getTotalNoticeCount() {
		return bbsDAO.getTotalNoticeCount();
	}
	@Override
	public List<NO_BBS_VO> getnoticelist(int offset, int limit) {
		return bbsDAO.getnoticelist(offset, limit);
	}
	@Override
	public int getNoticeHitUpdate(String notice_num) {	
		return bbsDAO.getNoticeHitUpdate(notice_num);
	}
	@Override
	public NO_BBS_VO getNoticeOneList(String notice_num) {
		return bbsDAO.getNoticeOneList(notice_num);
	}

	
	
	//이벤트부분
	@Override
	public List<EV_BBS_VO> geteventlist() {
		return bbsDAO.geteventlist();
	}
	@Override
	public int getTotalEventCount() {
		return bbsDAO.getTotalEventCount();
	}
	@Override
	public List<EV_BBS_VO> geteventlist(int offset, int limit) {
		return bbsDAO.geteventlist(offset, limit);
	}
	@Override
	public int getEventHitUpdate(String event_num) {
		return bbsDAO.getEventHitUpdate(event_num);
	}
	@Override
	public EV_BBS_VO getEventOneList(String event_num) {
		return bbsDAO.getEventOneList(event_num);
	}

	
	
	//FAQ
	
	@Override
	public List<FA_BBS_VO> getfaqlist() {
		return bbsDAO.getfaqlist();
	}
	@Override
	public int getTotalFaqCount() {
		return bbsDAO.getTotalFaqCount();
	}
	@Override
	public List<FA_BBS_VO> getfaqlist(int offset, int limit) {
		return bbsDAO.getfaqlist(offset, limit);
	}
	@Override
	public int getFaqHitUpdate(String faq_num) {
		return bbsDAO.getFaqHitUpdate(faq_num);
	}
	@Override
	public FA_BBS_VO getFaqOneList(String faq_num) {		
		return bbsDAO.getFaqOneList(faq_num);
	}

	
	//qna
	@Override
	public List<QA_BBS_VO> getqnalist() {
		return bbsDAO.getqnalist();
	}
	@Override
	public int getTotalQnaCount() {
		return bbsDAO.getTotalQnaCount();
	}
	@Override
	public List<QA_BBS_VO> getqnalist(int offset, int limit) {
		return bbsDAO.getqnatlist(offset, limit);
	}
	@Override
	public QA_BBS_VO getQnaOneList(String qna_num) {
		return bbsDAO.getQnaOneList(qna_num);
	}
	@Override
	public int getQnaWriteOk(QA_BBS_VO qnavo) {
		return bbsDAO.getQnaWriteOk(qnavo);
	}	
	@Override
	public int getQnaUpdateOk(QA_BBS_VO qnavo) {
		return  bbsDAO.getQnaUpdateOk(qnavo);
	}	
	@Override
	public int BbsQaDeleteOk(String BOARD_NUM) {
		return bbsDAO.BbsQaDeleteOk(BOARD_NUM);
	}

	
	
	
	
	//신고
	@Override
	public List<REP_BBS_VO> getreportlist() {
		return bbsDAO.getreportlist();
	}	
	@Override
	public int getTotalReportCount() {
		return bbsDAO.getTotalReportCount();
	}	
	@Override
	public List<REP_BBS_VO> getreportlist(int offset, int limit) {
		return bbsDAO.getreportlist(offset, limit);
	}	
	@Override
	public REP_BBS_VO getReportOneList(String rep_num) {
		return bbsDAO.getReportOneList(rep_num);
	}	
	@Override
	public int getReportWriteOk(REP_BBS_VO repvo) {
		return bbsDAO.getReportWriteOk(repvo);
	}

	
	
	
	//review
	@Override
	public List<RE_BBS_VO> getreviewlist() {
		return bbsDAO.getreviewlist();
	}
	@Override
	public int getTotalReviewCount() {
		return bbsDAO.getTotalReviewCount();
	}
	@Override
	public List<RE_BBS_VO> getreviewlist(int offset, int limit) {
		return bbsDAO.getreviewlist(offset, limit);
	}
	@Override
	public RE_BBS_VO getReviewOneList(String review_num) {
		return bbsDAO.getReviewOneList(review_num);
	}
	@Override
	public int getReviewWriteOk(RE_BBS_VO reivewvo) {
		return bbsDAO.getReviewWriteOk(reivewvo);
	}
	@Override
	public int getReviewUpdateOk(RE_BBS_VO reivewvo) {
		return bbsDAO.getReviewUpdateOk(reivewvo);
	}
	@Override
	public int BbsReviewDeleteOk(String RE_NUM) {
		return bbsDAO.BbsReviewDeleteOk(RE_NUM);
	}
	
	
	//====================================================================
	//검색 : 이벤트- 검색
	@Override
	public List<EV_BBS_VO> EvSearchResultByCon(String searchText) {
		return bbsDAO.EvSearchResultByCon(searchText);
	}
	@Override
	public List<EV_BBS_VO> EvSearchResultBySub(String searchText) {
		return bbsDAO.EvSearchResultBySub(searchText);
	}
	//검색 : faq- 검색
	@Override
	public List<FA_BBS_VO> FaSearchResultByCon(String searchText) {
		return bbsDAO.FaSearchResultByCon(searchText);
	}
	@Override
	public List<FA_BBS_VO> FaSearchResultBySub(String searchText) {
		return bbsDAO.FaSearchResultBySub(searchText);
	}
	//검색 : 공지사항- 검색
	@Override
	public List<NO_BBS_VO> NoticeSearchResultByCon(String searchText) {
		return bbsDAO.NoticeSearchResultByCon(searchText);
	}
	@Override
	public List<NO_BBS_VO> NoticeSearchResultBySub(String searchText) {
		return bbsDAO.NoticeSearchResultBySub(searchText);
	}
	//검색 : 상품Q&A- 검색
	@Override
	public List<QA_BBS_VO> QaSearchResultByCon(String searchText) {
		return bbsDAO.QaSearchResultByCon(searchText);
	}
	@Override
	public List<QA_BBS_VO> QaSearchResultBySub(String searchText) {
		return bbsDAO.QaSearchResultBySub(searchText);
	}
	@Override
	public List<QA_BBS_VO> QaSearchResultByWriter(String searchText) {
		return bbsDAO.QaSearchResultByWriter(searchText);
	}
	//검색 : 리뷰- 검색
	@Override
	public List<RE_BBS_VO> RevSearchResultByCon(String searchText) {
		return bbsDAO.RevSearchResultByCon(searchText);
	}
	@Override
	public List<RE_BBS_VO> RevSearchResultBySub(String searchText) {
		return bbsDAO.RevSearchResultBySub(searchText);
	}
	@Override
	public List<RE_BBS_VO> RevSearchResultByWriter(String searchText){
		return bbsDAO.RevSearchResultByWriter(searchText);
	}
	
	//============================================================================================


	//검색2 : 검색페이지에서 검색
	@Override
	public List<NO_BBS_VO> searchNotice(String s_type, String word, String start, String end) {
		return bbsDAO.searchNotice(s_type,word,start,end);
	}
	@Override
	public List<FA_BBS_VO> searchFaq(String s_type, String word, String start, String end) {
		return bbsDAO.searchFaq(s_type,word,start,end);
	}
	@Override
	public List<EV_BBS_VO> searchEvent(String s_type, String word, String start, String end) {
		return bbsDAO.searchEvent(s_type,word,start,end);
	}
	@Override
	public List<QA_BBS_VO> searchQa(String s_type, String word, String start, String end) {
		return bbsDAO.searchQa(s_type,word,start,end);
	}

	@Override
	public List<RE_BBS_VO> searchReview(String s_type, String word, String start, String end) {
		return bbsDAO.searchReview(s_type,word,start,end);
	}
	
	
	//콤보
	@Override
	public List<ProductVO> getProductList(String high, String low) {
		return bbsDAO.getProductList(high, low);
	}
	
	
	//물품찾기
	@Override
	public String getProdName(String p_num) {
		return bbsDAO.getProdName(p_num);
	}
	
	//리뷰리스트
	@Override
	public List<Review_comVO> getReviewcomList(String sessionid) {
		return bbsDAO.getReviewcomList(sessionid);
	}
	
	@Override
	public List<Review_comVO> getReviewprodList(List<Review_comVO> recom) {
		return bbsDAO.getReviewprodList(recom);
	}
}

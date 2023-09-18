package com.ict.bbs.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestAttribute;

import com.ict.bbs.model.vo.EV_BBS_VO;
import com.ict.bbs.model.vo.FA_BBS_VO;
import com.ict.bbs.model.vo.NO_BBS_VO;
import com.ict.bbs.model.vo.QA_BBS_VO;
import com.ict.bbs.model.vo.REP_BBS_VO;
import com.ict.bbs.model.vo.RE_BBS_VO;
import com.ict.bbs.model.vo.Review_comVO;
import com.ict.shopping.model.vo.ProductVO;

@Repository
public class BBS_DAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	//공지사항 부분
	public List<NO_BBS_VO> getnoticelist() {
		List<NO_BBS_VO> list = sqlSessionTemplate.selectList("bbs.noticelist");
		return list;
	}
	
	
	public int getTotalNoticeCount() {
		return sqlSessionTemplate.selectOne("bbs.noticecount");
	}


	public List<NO_BBS_VO> getnoticelist(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("bbs.noticelist", map);

	}
	
	public int getNoticeHitUpdate(String notice_num) {	
		return sqlSessionTemplate.update("bbs.noticehitup", notice_num);
	}


	public NO_BBS_VO getNoticeOneList(String notice_num) {
		return sqlSessionTemplate.selectOne("bbs.noticeonelist",notice_num);
	}
	
	
	//이벤트 부분
	public List<EV_BBS_VO> geteventlist() {
		List<EV_BBS_VO> list = sqlSessionTemplate.selectList("bbs.eventlist");
		return list;
	}
	
	
	public int getTotalEventCount() {
		return sqlSessionTemplate.selectOne("bbs.eventcount");
	}


	public List<EV_BBS_VO> geteventlist(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("bbs.eventlist", map);

	}
	
	public int getEventHitUpdate(String event_num) {	
		return sqlSessionTemplate.update("bbs.eventhitup", event_num);
	}


	public EV_BBS_VO getEventOneList(String event_num) {
		return sqlSessionTemplate.selectOne("bbs.eventonelist",event_num);
	}
	
	
	//이용안내
	public List<FA_BBS_VO> getfaqlist() {
		List<FA_BBS_VO> list = sqlSessionTemplate.selectList("bbs.faqlist");
		return list;
	}
	public int getTotalFaqCount() {
		return sqlSessionTemplate.selectOne("bbs.faqcount");
	}


	public List<FA_BBS_VO> getfaqlist(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("bbs.faqlist", map);

	}
	
	public int getFaqHitUpdate(String faq_num) {	
		return sqlSessionTemplate.update("bbs.faqhitup", faq_num);
	}
	
	public FA_BBS_VO getFaqOneList(String faq_num) {
		return sqlSessionTemplate.selectOne("bbs.faqonelist",faq_num);
	}
	
	
	//상품 Q&A 부분
	public List<QA_BBS_VO> getqnalist() {
		List<QA_BBS_VO> list = sqlSessionTemplate.selectList("bbs.qnalist");
		return list;
	}
	
	
	public int getTotalQnaCount() {
		return sqlSessionTemplate.selectOne("bbs.qnacount");
	}


	public List<QA_BBS_VO> getqnatlist(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("bbs.qnalist", map);

	}
	

	public QA_BBS_VO getQnaOneList(String qna_num) {
		return sqlSessionTemplate.selectOne("bbs.qnaonelist",qna_num);
	}
	
	public int getQnaWriteOk(QA_BBS_VO qnavo) {
	
		
		return sqlSessionTemplate.insert("bbs.qnainsert", qnavo);
	}
	
	public int getQnaUpdateOk(QA_BBS_VO qnavo) {
		return sqlSessionTemplate.update("bbs.qnaupdate", qnavo);
	}

	public int BbsQaDeleteOk(String BOARD_NUM) {
		return sqlSessionTemplate.update("bbs.qnadelete",BOARD_NUM );
	}
	
	
	
	//신고
	public List<REP_BBS_VO> getreportlist() {
		List<REP_BBS_VO> list = sqlSessionTemplate.selectList("bbs.reportlist");
		return list;
	}
	
	public int getTotalReportCount() {
		int result = sqlSessionTemplate.selectOne("bbs.reportcount");
		return result;
	}
	

	public List<REP_BBS_VO> getreportlist(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("bbs.reportlist", map);
	}
	

	public REP_BBS_VO getReportOneList(String rep_num) {
		return sqlSessionTemplate.selectOne("bbs.reportonelist",rep_num);
	}
	

	public int getReportWriteOk(REP_BBS_VO repvo) {
		return sqlSessionTemplate.insert("bbs.reportinsert", repvo);
	}
	
	
	
	//리뷰
	public List<RE_BBS_VO> getreviewlist() {
		return sqlSessionTemplate.selectList("bbs.reviewlist");
	}

	public int getTotalReviewCount() {
		return sqlSessionTemplate.selectOne("bbs.reviewcount");
	}


	public List<RE_BBS_VO> getreviewlist(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("bbs.reviewlist", map);
	}


	public RE_BBS_VO getReviewOneList(String review_num) {
		return sqlSessionTemplate.selectOne("bbs.reviewonelist",review_num );
	}


	public int getReviewWriteOk(RE_BBS_VO reivewvo) {
		return sqlSessionTemplate.insert("bbs.reviewinsert", reivewvo);
	}


	public int getReviewUpdateOk(RE_BBS_VO reivewvo) {
		return sqlSessionTemplate.update("bbs.reviewupdate", reivewvo);
	}

	public int BbsReviewDeleteOk(String RE_NUM) {
		return sqlSessionTemplate.update("bbs.reviewdelete", RE_NUM);
	}
	
	
	
	
	//===============================================================
	//검색  : 이벤트 - 검색
	public List<EV_BBS_VO> EvSearchResultByCon(String searchText){
		return sqlSessionTemplate.selectList("bbs.searchevscon", searchText);
	}
	public List<EV_BBS_VO> EvSearchResultBySub(String searchText){
		return sqlSessionTemplate.selectList("bbs.searchevsub", searchText);
	}
	
	//검색 : faq - 검색
	public List<FA_BBS_VO> FaSearchResultByCon(String searchText) {
		return sqlSessionTemplate.selectList("bbs.searchfaqcon", searchText);
	}

	public List<FA_BBS_VO> FaSearchResultBySub(String searchText) {
		return sqlSessionTemplate.selectList("bbs.searchfaqsub", searchText);
	}
	
	//검색 : 공지사항 - 검색
	public List<NO_BBS_VO> NoticeSearchResultByCon(String searchText) {
		return sqlSessionTemplate.selectList("bbs.searchnoticecon",searchText );
	}
	public List<NO_BBS_VO> NoticeSearchResultBySub(String searchText) {
		return sqlSessionTemplate.selectList("bbs.searchnoticesub",searchText );
	}
	
	//검색 : 상품Q&A- 검색
	public List<QA_BBS_VO> QaSearchResultByCon(String searchText) {
		return sqlSessionTemplate.selectList("bbs.searchqacon",searchText );
	}
	public List<QA_BBS_VO> QaSearchResultBySub(String searchText) {
		return sqlSessionTemplate.selectList("bbs.searchqasub",searchText );

	}
	public List<QA_BBS_VO> QaSearchResultByWriter(String searchText) {
		return sqlSessionTemplate.selectList("bbs.searchqawriter",searchText);
	}
	//검색 : 리뷰- 검색
	public List<RE_BBS_VO> RevSearchResultByCon(String searchText) {
		return sqlSessionTemplate.selectList("bbs.searchreviewcon",searchText );
	}
	public List<RE_BBS_VO> RevSearchResultBySub(String searchText) {
		return sqlSessionTemplate.selectList("bbs.searchreviewsub",searchText );

	}
	public List<RE_BBS_VO> RevSearchResultByWriter(String searchText){
		return sqlSessionTemplate.selectList("bbs.searchreviewwriter",searchText );
	}


	
	
	
	//검색2  : 검색페이지에서 검색
	//공지사항
	public List<NO_BBS_VO> searchNotice( String s_type, String word, String start, String end) {
		Map<String, Object> params = new HashMap<>();
		
		params.put("s_type", s_type);
		params.put("word", word);
		params.put("start", start);
		params.put("end", end);
		
		return sqlSessionTemplate.selectList("bbs.searchNotice", params);
	}
	//faq
	public List<FA_BBS_VO> searchFaq( String s_type, String word, String start, String end) {
		Map<String, Object> params = new HashMap<>();
		
		params.put("s_type", s_type);
		params.put("word", word);
		params.put("start", start);
		params.put("end", end);
		
		return sqlSessionTemplate.selectList("bbs.searchFaq", params);
	}
	//event
	public List<EV_BBS_VO> searchEvent(String s_type, String word, String start, String end) {
		Map<String, Object> params = new HashMap<>();
		
		params.put("s_type", s_type);
		params.put("word", word);
		params.put("start", start);
		params.put("end", end);
		
		return sqlSessionTemplate.selectList("bbs.searchEvent", params);
	}
	//상품qa
	public List<QA_BBS_VO> searchQa(String s_type, String word, String start, String end) {
		Map<String, Object> params = new HashMap<>();
		
		params.put("s_type", s_type);
		params.put("word", word);
		params.put("start", start);
		params.put("end", end);
		
		return sqlSessionTemplate.selectList("bbs.searchQa", params);
	}
	//리뷰
	public List<RE_BBS_VO> searchReview(String s_type, String word, String start, String end) {
		Map<String, Object> params = new HashMap<>();
			
		params.put("s_type", s_type);
		params.put("word", word);
		params.put("start", start);
		params.put("end", end);
			
		return sqlSessionTemplate.selectList("bbs.searchReview", params);
		
	}

	
	
	//콤보
	public List<ProductVO> getProductList(String high, String low) {
		Map<String, String> combo = new HashMap<>();
		
		combo.put("high", high);
		combo.put("low", low);
		return sqlSessionTemplate.selectList("bbs.productcombo", combo);
	}
	
	
	//물품번호
	public String getProdName(String p_num) {
		return sqlSessionTemplate.selectOne("bbs.productname", p_num);
	}
	
	//리뷰리스트
	public List<Review_comVO> getReviewcomList(String sessionid) {
		return sqlSessionTemplate.selectList("bbs.reviewcomlist",sessionid);
	}
	public List<Review_comVO> getReviewprodList(List<Review_comVO> recom) {
		return sqlSessionTemplate.selectList("bbs.reviewprodlist", recom);
	}
	
}
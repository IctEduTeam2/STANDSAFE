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
	
	
	//검색
	

	public List<EV_BBS_VO> EvSearchResultByCon(String searchText){
		return sqlSessionTemplate.selectList("bbs.searchevscon", searchText);
	}
	
	public List<EV_BBS_VO> EvSearchResultBySub(String searchText){
		return sqlSessionTemplate.selectList("bbs.searchevsub", searchText);
	}
	

	
	
}
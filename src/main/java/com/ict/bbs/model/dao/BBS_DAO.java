package com.ict.bbs.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.bbs.model.vo.EV_BBS_VO;
import com.ict.bbs.model.vo.FA_BBS_VO;
import com.ict.bbs.model.vo.NO_BBS_VO;
import com.ict.bbs.model.vo.QA_BBS_VO;

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

	public int getQnaWriteOk2(QA_BBS_VO qnavo, String type) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("subject", qnavo.getBOARD_SUBJECT());
		map.put("writer", qnavo.getBOARD_WRITER());
		map.put("content", qnavo.getBOARD_CONTENT());
		map.put("file", qnavo.getBOARD_FILE());
		//map.put("lock", qnavo.getBOARD_LOCK());
		
		if(qnavo.getBOARD_LOCK().equals("on")) {
			System.out.println("dao" + qnavo.getBOARD_LOCK());
			qnavo.setBOARD_LOCK("1");
			map.put("lock", qnavo.getBOARD_LOCK());		
		} else {
			System.out.println("dao2" + qnavo.getBOARD_LOCK());
			qnavo.setBOARD_LOCK("0");
			map.put("lock", qnavo.getBOARD_LOCK());
		}
		map.put("client", qnavo.getCLIENT_NUM());
		map.put("prod", qnavo.getPROD_NUM());
		
		return sqlSessionTemplate.insert("bbs.qnainsert2", map);

	}



	
}
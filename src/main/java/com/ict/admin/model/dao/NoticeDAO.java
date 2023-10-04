package com.ict.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.admin.model.vo.EventVO;
import com.ict.admin.model.vo.FaqVO;
import com.ict.admin.model.vo.NoticeVO;
import com.ict.admin.model.vo.PopUpSVO;
import com.ict.admin.model.vo.QaVO;
import com.ict.admin.model.vo.ReVO;
import com.ict.admin.model.vo.ReportVO;

@Repository
public class NoticeDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 공지사항
	// 전체 게시물
	public int getTotalNotices() {
		return sqlSessionTemplate.selectOne("notice.getTotalNotices");
	}

	// 등록된 게시물
	public int getRegisteredNotices() {
		return sqlSessionTemplate.selectOne("notice.getRegisteredNotices");
	}

	// 삭제된 게시물
	public int getDeletedNotices() {
		return sqlSessionTemplate.selectOne("notice.getDeletedNotices");
	}

	public List<NoticeVO> getadnoticelist() {
		List<NoticeVO> list = sqlSessionTemplate.selectList("notice.noticelist");
		return list;
	}

	// 전체게시글 수
	public int getTotalRecord() {
		return sqlSessionTemplate.selectOne("notice.noticecount");
	}

	public List<NoticeVO> getadnoticelist(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("notice.noticelist", map);
	}

	// 조회수
	public int getAdNoticeHitUpdate(String notice_num) {
		return sqlSessionTemplate.update("notice.noticehitup", notice_num);
	}

	// onelist
	public NoticeVO getAdNoticeOneList(String notice_num) {
		return sqlSessionTemplate.selectOne("notice.noticeonelist", notice_num);
	}

	// notice 수정완료
	public int getNoticeUpdateOk(NoticeVO mvo) {
		return sqlSessionTemplate.update("notice.notiupcom", mvo);
	}

	// notice 단독삭제
	public int NoticeDeleteOk(String notice_num) {
		return sqlSessionTemplate.update("notice.noitupdelcom", notice_num);
	}

	// notice 작성완료
	public int getNotiWriteOk(NoticeVO mvo) {
		return sqlSessionTemplate.insert("notice.notiwricom", mvo);
	}

	// 테이블 삭제 버튼
	public int upNotitabst(String notice_num) {
		return sqlSessionTemplate.update("notice.deluptab", notice_num);
	}

	// 삭제게시물 검색 버튼
	public List<NoticeVO> getDeletedNoti() {
		return sqlSessionTemplate.selectList("notice.seldelbtn");
	}

	// 검색(전체리스트)
	public List<NoticeVO> getAllNotices() {
		return sqlSessionTemplate.selectList("notice.allsel");
	}

	// 검색
	public List<NoticeVO> adNotiSearch(String searchKey, String searchText, String searchTitle, String start1,
			String close1, String mg_type) {
		Map<String, Object> params = new HashMap<>();

		params.put("searchKey", searchKey);
		params.put("searchText", searchText);
		params.put("searchTitle", searchTitle);
		params.put("start1", start1);
		params.put("close1", close1);
		params.put("mg_type", mg_type);

		return sqlSessionTemplate.selectList("notice.adsearchnoti", params);
	}
	// 홈페이지 등록
	public int updateNoticeStatus(String notice_num) {
		return sqlSessionTemplate.update("notice.upnotihome", notice_num);
	}

	// ===============================================================================================
	// QA
	// 전체 게시물
	public int getTotalQa() {
		return sqlSessionTemplate.selectOne("notice.getTotalQa");
	}
	// 삭제된 게시물
	public int getDeletedQa() {
		return sqlSessionTemplate.selectOne("notice.getDeletedQa");
	}
	// 삭제게시물 검색 버튼
	public List<QaVO> getDeleQa() {
		return sqlSessionTemplate.selectList("notice.seldelqabtn");
	}
	// 검색(전체리스트)
	public List<QaVO> getAllQa() {
		return sqlSessionTemplate.selectList("notice.allselqa");
	}
	// 검색
	public List<QaVO> adSearchQa(String searchKey, String searchText, String searchTitle, String start1,
			String close1, String mg_type) {
		Map<String, Object> params = new HashMap<>();

		params.put("searchKey", searchKey);
		params.put("searchText", searchText);
		params.put("searchTitle", searchTitle);
		params.put("start1", start1);
		params.put("close1", close1);
		params.put("mg_type", mg_type);

		return sqlSessionTemplate.selectList("notice.adsearchqa", params);
	}
	// 테이블 삭제 버튼
	public int upQatabst(String board_num) {
		return sqlSessionTemplate.update("notice.delqauptab", board_num);
	}
	
	//
	public QaVO getQaOneList(String board_num) {
		return sqlSessionTemplate.selectOne("notice.onelist", board_num);
	}
	//삭제 폼
	public int QaDeleteOk(String board_num) {
		return sqlSessionTemplate.update("notice.dellist", board_num);
	}
	//답글
	public int getLevUpdate(Map<String, Integer> map) {
		return sqlSessionTemplate.update("notice.levup",map);
	}
	//
	public int getAnsWriteOk(QaVO qvo) {
		return sqlSessionTemplate.insert("notice.levup2", qvo);
	}
	//답변상태
	public int getStUpdate(String board_num) {
		return sqlSessionTemplate.update("notice.ansup", board_num);
	}
	
	// ===============================================================================================
	// FAQ
	// 전체 게시물
	public int getTotalFaq() {
		return sqlSessionTemplate.selectOne("notice.getTotalFqa");
	}
	// 등록된 게시물
	public int getRegisteredFaq() {
		return sqlSessionTemplate.selectOne("notice.getRegisteredFqa");
	}
	// 삭제된 게시물
	public int getDeletedFaq() {
		return sqlSessionTemplate.selectOne("notice.getDeletedFqa");
	}
	// 삭제게시물 검색 버튼
	public List<FaqVO> getDeleFaq() {
		return sqlSessionTemplate.selectList("notice.seldelfaqbtn");
	}
	// 검색(전체리스트)
	public List<FaqVO> getAllFaq() {
		return sqlSessionTemplate.selectList("notice.allfaqsel");
	}
	// 검색
	public List<FaqVO> adFaqSearch(String searchKey, String searchText, String searchTitle, String start1,
			String close1, String mg_type) {
		Map<String, Object> params = new HashMap<>();

		params.put("searchKey", searchKey);
		params.put("searchText", searchText);
		params.put("searchTitle", searchTitle);
		params.put("start1", start1);
		params.put("close1", close1);
		params.put("mg_type", mg_type);

		return sqlSessionTemplate.selectList("notice.adsearchfaq", params);
	}
	// 테이블 삭제 버튼
	public int upFaqtabst(String fa_num) {
		return sqlSessionTemplate.update("notice.delfaqtab", fa_num);
	}
	// 홈페이지 등록
	public int updateFaqStatus(String fa_num) {
		return sqlSessionTemplate.update("notice.upfaqhome", fa_num);
	}
	// faq 작성완료
	public int getFaqWriteOk(FaqVO faqvo) {
		return sqlSessionTemplate.insert("notice.faqwricom", faqvo);
	}

	
	
	
	
	// ===============================================================================================
	// Event
	// 전체 게시물
	public int getTotalEvent() {
		return sqlSessionTemplate.selectOne("notice.getTotalevent");
	}
	// 등록된 게시물
	public int getRegisteredEvent() {
		return sqlSessionTemplate.selectOne("notice.getRegisteredevent");
	}
	// 삭제된 게시물
	public int getDeletedEvent() {
		return sqlSessionTemplate.selectOne("notice.getDeletedevent");
	}
	// 삭제게시물 검색 버튼
	public List<EventVO> getDeletedEve() {
		return sqlSessionTemplate.selectList("notice.seldelevebtn");
	}
	// 검색(전체리스트)
	public List<EventVO> getAllEvent() {
		return sqlSessionTemplate.selectList("notice.allselevent");
	}
	// 검색
	public List<EventVO> adEventSearch(String searchKey, String searchText, String searchTitle, String start1,
			String close1, String mg_type) {
		Map<String, Object> params = new HashMap<>();

		params.put("searchKey", searchKey);
		params.put("searchText", searchText);
		params.put("searchTitle", searchTitle);
		params.put("start1", start1);
		params.put("close1", close1);
		params.put("mg_type", mg_type);

		return sqlSessionTemplate.selectList("notice.adsearchevent", params);
	}	
	// 테이블 삭제 버튼
	public int upevetabst(String event_num) {
		return sqlSessionTemplate.update("notice.deleventab", event_num);
	}
	// 홈페이지 등록
	public int updateEventStatus(String event_num) {
		return sqlSessionTemplate.update("notice.upevehome", event_num);
	}
	// 조회수
	public int getAdEveHitUpdate(String event_num) {
		return sqlSessionTemplate.update("notice.evehitup", event_num);
	}
	// onelist
	public EventVO getAdEveOnelist(String event_num) {
		return sqlSessionTemplate.selectOne("notice.eveonelist", event_num);
	}
	// event 작성완료
	public int getEveWriteOk(EventVO evevo) {
		return sqlSessionTemplate.insert("notice.evewricom", evevo);
	}
	// notice 수정완료
	public int getEeUpdateOk(EventVO evevo) {
		return sqlSessionTemplate.update("notice.eveupcom", evevo);
	}
	// event 단독삭제
	public int EventDeleteOk(String event_num) {
		return sqlSessionTemplate.update("notice.eveupdelcom", event_num);
	}
	
	// ===============================================================================================
	// 리뷰
	// 전체 리뷰 게시물
	public int getTotalReview() {
		return sqlSessionTemplate.selectOne("notice.getTotalReview");
	}
	// 삭제된 리뷰 게시물
	public int getDeletedReview() {
		return sqlSessionTemplate.selectOne("notice.getDeletedReview");
	}
	// 삭제게시물 검색 버튼
	public List<ReVO> getDeleRev() {
		return sqlSessionTemplate.selectList("notice.seldelrevbtn");
	}
	// 검색(전체리스트)
	public List<ReVO> getAllRev() {
		return sqlSessionTemplate.selectList("notice.allselrev");
	}
	// 검색
	public List<ReVO> adSearchRev(String searchKey, String searchText, String searchTitle, String start1,
			String close1, String mg_type) {
		Map<String, Object> params = new HashMap<>();
		params.put("searchKey", searchKey);
		params.put("searchText", searchText);
		params.put("searchTitle", searchTitle);
		params.put("start1", start1);
		params.put("close1", close1);
		params.put("mg_type", mg_type);
		return sqlSessionTemplate.selectList("notice.adsearchrev", params);
	}	
	// 테이블 삭제 버튼
	public int upRevtabst(String re_num) {
		return sqlSessionTemplate.update("notice.delrevtab", re_num);
	}
	// onelist
	public ReVO getReOneList(String re_num) {
		return sqlSessionTemplate.selectOne("notice.reonelist", re_num);
	}
	//리뷰 단독삭제
	public int ReviewDeleteOk(String re_num) {
		return sqlSessionTemplate.update("notice.revupdelcom", re_num);
	}
	//답글
	public int getReLevUpdate(Map<String, Integer> map) {
		return sqlSessionTemplate.update("notice.relevup",map);
	}
	//
	public int ReplyWriteOk(ReVO rvo) {
		return sqlSessionTemplate.insert("notice.relevup2", rvo);
	}
	//답변상태
	public int getReStUpdate(String re_num) {
		return sqlSessionTemplate.update("notice.revreplyup", re_num);
	}
	
	// ===============================================================================================
	// 신고
	// 전체 신고 게시물
	public int getTotalReport() {
		return sqlSessionTemplate.selectOne("notice.getTotalReport");
	}
	// 삭제된 신고 게시물
	public int getDeletedReport() {
		return sqlSessionTemplate.selectOne("notice.getDeletedReport");
	}
	// 삭제게시물 검색 버튼
	public List<ReportVO> getDeleRep() {
		return sqlSessionTemplate.selectList("notice.seldelrepbtn");
	}
	// 검색(전체리스트)
	public List<ReportVO> getAllRep() {
		return sqlSessionTemplate.selectList("notice.allselrep");
	}
	// 검색
	public List<ReportVO> adSearchRep(String searchKey, String searchText, String searchTitle, String start1,
			String close1, String mg_type) {
		Map<String, Object> params = new HashMap<>();
		params.put("searchKey", searchKey);
		params.put("searchText", searchText);
		params.put("searchTitle", searchTitle);
		params.put("start1", start1);
		params.put("close1", close1);
		params.put("mg_type", mg_type);
		return sqlSessionTemplate.selectList("notice.adsearchrep", params);
	}
	// 테이블 삭제 버튼
	public int upReptabst(String report_num) {
		return sqlSessionTemplate.update("notice.delreptab", report_num);
	}
	// onelist
	public ReportVO getRepOneList(String report_num) {
		return sqlSessionTemplate.selectOne("notice.reponelist", report_num);
	}
	//리뷰 단독삭제
	public int ReportDeleteOk(String report_num) {
		return sqlSessionTemplate.update("notice.repupdelcom", report_num);
	}
	//답글
	public int getReLepUpdate(Map<String, Integer> map) {
		return sqlSessionTemplate.update("notice.replevup",map);
	}
	//
	public int ReplyWriteOk(ReportVO rpvo) {
		return sqlSessionTemplate.insert("notice.replevup2", rpvo);
	}
	//답변상태
	public int getRepStUpdate(String report_num) {
		return sqlSessionTemplate.update("notice.repreportup", report_num);
	}
	
	// ===============================================================================================
	// 팝업/슬라이드
	// 전체 게시물
	public int getTotalPopup() {
		return sqlSessionTemplate.selectOne("notice.getTotalpop");
	}
	// 등록된 게시물
	public int getUnRegisteredPopup() {
		return sqlSessionTemplate.selectOne("notice.getunRegisteredpop");
	}
	// 등록된 게시물
	public int getRegisteredPopup() {
		return sqlSessionTemplate.selectOne("notice.getRegisteredpop");
	}
	// 삭제된 게시물
	public int getDeletedPopup() {
		return sqlSessionTemplate.selectOne("notice.getDeletedpop");
	}
	// 삭제게시물 검색 버튼
	public List<PopUpSVO> getDeletedPop() {
		return sqlSessionTemplate.selectList("notice.seldelpopbtn");
	}
	// 검색(전체리스트)
	public List<PopUpSVO> getAllPopup() {
		return sqlSessionTemplate.selectList("notice.allselpop");
	}
	// 검색
	public List<PopUpSVO> adPopupSearch(String searchKey, String searchText, String searchTitle, String start1,
			String close1, String mg_type) {
		Map<String, Object> params = new HashMap<>();
		params.put("searchKey", searchKey);
		params.put("searchText", searchText);
		params.put("searchTitle", searchTitle);
		params.put("start1", start1);
		params.put("close1", close1);
		params.put("mg_type", mg_type);
		return sqlSessionTemplate.selectList("notice.adsearchpop", params);
	}
	// 테이블 삭제 버튼
	public int upPopUptabst(String popup_num) {
		return sqlSessionTemplate.update("notice.delpoptab", popup_num);
	}
	// 홈페이지 등록
	public int updatePopStatus1(String popup_num) {
		return sqlSessionTemplate.update("notice.uppophome1", popup_num);
	}
	// 홈페이지 등록
	public int updatePopStatus2(String popup_num) {
		return sqlSessionTemplate.update("notice.uppophome2", popup_num);
	}
	//
	public int getPopupWriteOk(PopUpSVO popvo) {
		return sqlSessionTemplate.insert("notice.writepops", popvo);
	}

}

package com.ict.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.admin.model.vo.FaqVO;
import com.ict.admin.model.vo.NoticeVO;
import com.ict.admin.model.vo.QaVO;

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

}

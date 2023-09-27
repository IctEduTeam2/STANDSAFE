package com.ict.admin.model.dao;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.admin.model.vo.NoticeVO;



@Repository
public class NoticeDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//등록한 공지사항 게시글 수
//	public int getRecordByStatus(int statusCode) {
//		return sqlSessionTemplate.selectOne("notice.getrecordbystatus", statusCode);
//	}
	
	//공지사항 
	//공지사항 실시간 게시물
	//전체 게시물
	public int getTotalNotices() {
		return sqlSessionTemplate.selectOne("notice.getTotalNotices");
	}
	//등록된 게시물
	public int getRegisteredNotices() {
		return sqlSessionTemplate.selectOne("notice.getRegisteredNotices");
	}
	//삭제된 게시물
	public int getDeletedNotices() {
		return sqlSessionTemplate.selectOne("notice.getDeletedNotices");
	}
	
	
	public List<NoticeVO> getadnoticelist() {
		List<NoticeVO> list = sqlSessionTemplate.selectList("notice.noticelist");
		return list;
	}
	//전체게시글 수
	public int getTotalRecord() {
		return sqlSessionTemplate.selectOne("notice.noticecount");
	}
	
	public List<NoticeVO> getadnoticelist(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("notice.noticelist", map);
	}
	//조회수 
	public int getAdNoticeHitUpdate(String notice_num) {
		return sqlSessionTemplate.update("notice.noticehitup", notice_num);
	}
	//onelist
	public NoticeVO getAdNoticeOneList(String notice_num) {
		return sqlSessionTemplate.selectOne("notice.noticeonelist", notice_num);
	}
	
	//테이블 삭제 버튼
	public int updateNoticeStatus(String notice_num) {
	    return sqlSessionTemplate.update("notice.deluptab", notice_num);
	}
	
	//삭제게시물 검색 버튼
	public List<NoticeVO> getDeletedNoti() {	
		return sqlSessionTemplate.selectList("notice.seldelbtn");	
	}

	//검색(전체리스트)
	public List<NoticeVO> getAllNotices() {
		return sqlSessionTemplate.selectList("notice.allsel");
	}
	
	//검색
	//공지사항
	public List<NoticeVO> adNotiSearch(String searchKey,String searchText,String searchTitle,String start1,String close1,String mg_type) {
		Map<String, Object> params = new HashMap<>();
		
		params.put("searchKey", searchKey);
		params.put("searchText", searchText);
		params.put("searchTitle", searchTitle);
		params.put("start1", start1);
		params.put("close1", close1);
		params.put("mg_type", mg_type);
		
		return sqlSessionTemplate.selectList("notice.adsearchnoti", params);
	}
	
	//홈페이지 등록
	public int updateNoticeStatus(String notice_num, int notice_st) {
        // 여기에서 데이터베이스 업데이트 SQL을 실행합니다.
        // UPDATE 쿼리를 사용하여 NOTICE_T 테이블에서 해당 공지사항의 상태를 업데이트합니다.
        int result = sqlSessionTemplate.update("notice.upnotihome", notice_num);
        return result;
    }
	
}

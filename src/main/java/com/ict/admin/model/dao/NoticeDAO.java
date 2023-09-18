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
	
	//공지사항 
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
	public int getupdateNoticeById(String notice_num) {
		return sqlSessionTemplate.update("notice.noticeupdate", notice_num);
	}
	
	//삭제게시물 검색 버튼
	public List<NoticeVO> getDeletedNoti(int noticeNum) {
		
		return sqlSessionTemplate.selectList("notice.seldelbtn");
		
	}
//	public int getDeletedNoti(String notice_num) {
//		return sqlSessionTemplate.selectOne("notice.seldelbtn", notice_num);
//	}
	
	
	
	//검색
	//공지사항
	public List<NoticeVO> adNotiSearch(String searchKey,String searchText,String searchTitle,String start1,String close1) {
		Map<String, Object> params = new HashMap<>();
		
		params.put("searchKey", searchKey);
		params.put("searchText", searchText);
		params.put("searchTitle", searchTitle);
		params.put("start1", start1);
		params.put("close1", close1);
		
		return sqlSessionTemplate.selectList("notice.adsearchnoti", params);
		
	}
	
	
}

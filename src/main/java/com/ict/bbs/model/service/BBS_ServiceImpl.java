package com.ict.bbs.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.bbs.model.dao.BBS_DAO;
import com.ict.bbs.model.vo.EV_BBS_VO;
import com.ict.bbs.model.vo.FA_BBS_VO;
import com.ict.bbs.model.vo.NO_BBS_VO;
import com.ict.bbs.model.vo.QA_BBS_VO;


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
	public String getClientPwd(String c_num) {
		return bbsDAO.getClientPwd(c_num);
	}

	
	
	
	
	
}

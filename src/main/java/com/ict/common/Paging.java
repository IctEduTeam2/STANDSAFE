package com.ict.common;

import org.springframework.stereotype.Service;

@Service
public class Paging {
	
	private int nowPage = 1; //현재 페이지  //이게 리밋트가 되는거다.(?)
	private int nowBlock=1;  //현재 블럭 
	
	private int totalRecord = 0; //전체 페이지의 수 (원글의수)
	private int totalBlock = 0; //전체 블럭의 수 
	private int totalPage = 0; //현재 페이지의 수 
	
	private int numPerPage = 10; //한 페이지안에 존재하는 원글의 수 (게시물의 수)
	private int pagePerBlock = 3; //한 블락안에 존재하는 페이지의 수 (123,456,789같은)
	
	//구하고자 하는 변수 
	private int begin = 0;  // 시작번호
	private int end = 0;	//끝번호
	
	private int beginBlock= 0;	//시작블럭
	private int endBlock = 0;	//끝블럭
	
	private int offset =0;
	
	//삭제된 게시물 보
	public void calculatePaging() {
        // 전체 페이지 수 계산
        totalPage = (int) Math.ceil((double) totalRecord / numPerPage);

        // 전체 블럭 수 계산
        totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

        // 현재 블럭 번호 계산
        nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);

        // 현재 블럭의 시작 페이지와 끝 페이지 계산
        beginBlock = (nowBlock - 1) * pagePerBlock + 1;
        endBlock = nowBlock * pagePerBlock;

        // 마지막 블럭에서 끝 페이지 조정
        if (nowBlock == totalBlock) {
            endBlock = totalPage;
        }

        // 시작 번호와 끝 번호 계산
        begin = (nowPage - 1) * numPerPage + 1;
        end = nowPage * numPerPage;

        // 오프셋(offset) 계산
        offset = (nowPage - 1) * numPerPage;
    }
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getBeginBlock() {
		return beginBlock;
	}
	public void setBeginBlock(int beginBlock) {
		this.beginBlock = beginBlock;
	}
	public int getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}

}

package com.ict.bbs.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class RE_BBS_VO {

		private String REPORT_NUM, REPORT_SUBJECT, REPORT_WRITER, REPORT_CONTENT, REPORT_FILE,
		REPORT_TYPE, REPORT_DATE, REPORT_ST,PROD_NUM, CLIENT_NUM;
		
		
		private MultipartFile file;


		public String getREPORT_NUM() {
			return REPORT_NUM;
		}


		public void setREPORT_NUM(String rEPORT_NUM) {
			REPORT_NUM = rEPORT_NUM;
		}


		public String getREPORT_SUBJECT() {
			return REPORT_SUBJECT;
		}


		public void setREPORT_SUBJECT(String rEPORT_SUBJECT) {
			REPORT_SUBJECT = rEPORT_SUBJECT;
		}


		public String getREPORT_WRITER() {
			return REPORT_WRITER;
		}


		public void setREPORT_WRITER(String rEPORT_WRITER) {
			REPORT_WRITER = rEPORT_WRITER;
		}


		public String getREPORT_CONTENT() {
			return REPORT_CONTENT;
		}


		public void setREPORT_CONTENT(String rEPORT_CONTENT) {
			REPORT_CONTENT = rEPORT_CONTENT;
		}


		public String getREPORT_FILE() {
			return REPORT_FILE;
		}


		public void setREPORT_FILE(String rEPORT_FILE) {
			REPORT_FILE = rEPORT_FILE;
		}


		public String getREPORT_TYPE() {
			return REPORT_TYPE;
		}


		public void setREPORT_TYPE(String rEPORT_TYPE) {
			REPORT_TYPE = rEPORT_TYPE;
		}


		public String getREPORT_DATE() {
			return REPORT_DATE;
		}


		public void setREPORT_DATE(String rEPORT_DATE) {
			REPORT_DATE = rEPORT_DATE;
		}


		public String getREPORT_ST() {
			return REPORT_ST;
		}


		public void setREPORT_ST(String rEPORT_ST) {
			REPORT_ST = rEPORT_ST;
		}


		public String getPROD_NUM() {
			return PROD_NUM;
		}


		public void setPROD_NUM(String pROD_NUM) {
			PROD_NUM = pROD_NUM;
		}


		public String getCLIENT_NUM() {
			return CLIENT_NUM;
		}


		public void setCLIENT_NUM(String cLIENT_NUM) {
			CLIENT_NUM = cLIENT_NUM;
		}


		public MultipartFile getFile() {
			return file;
		}


		public void setFile(MultipartFile file) {
			this.file = file;
		}
		
		
}

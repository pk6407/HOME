package com.coffeesazo.mypages.model.vo;
import java.util.Date;
import java.sql.Connection;
public class MyQnaList {
	private int qnaIndex;
	private String qnaTitle;
	private String userId;
	private Date writeDate;
	private int qnaCheck;

	
	
	public int getQnaCheck() {
		return qnaCheck;
	}
	public void setQnaCheck(int qnaCheck) {
		this.qnaCheck = qnaCheck;
	}
	
	public int getQnaIndex() {
		return qnaIndex;
	}
	public void setQnaIndex(int qnaIndex) {
		this.qnaIndex = qnaIndex;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}


}

package com.coffeesazo.qna.model.vo;

import java.util.Date;

public class QnAVo {
	
	int qnaIndex;
	String fkMemberId;
	String qnaTitle;
	Date qnaDate;
	String qnaText;
	String qnaImage;
	int qnaCheck;
	

	public int getQnaIndex() {
		return qnaIndex;
	}
	
	
	public void setQnaIndex(int qnaIndex) {
		this.qnaIndex = qnaIndex;
	}
	public String getFkMemberId() {
		return fkMemberId;
	}
	public void setFkMemberId(String fkMemberId) {
		this.fkMemberId = fkMemberId;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	public String getQnaText() {
		return qnaText;
	}
	public void setQnaText(String qnaText) {
		this.qnaText = qnaText;
	}
	public String getQnaImage() {
		return qnaImage;
	}
	public void setQnaImage(String qnaImage) {
		this.qnaImage = qnaImage;
	}
	public int getQnaCheck() {
		return qnaCheck;
	}
	public void setQnaCheck(int qnaCheck) {
		this.qnaCheck = qnaCheck;
	}
	
	

}

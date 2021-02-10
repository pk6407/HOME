package com.coffeesazo.member.model.vo;

import java.sql.Date;

public class MemberVo {
	private int memberIndex;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberEmail;
	private String memberPhone;
	private String memberZipcode;
	private String memberAddress;
	private String memberAdmin;
	private Date memberJoinedDate;
	
	public int getMemberIndex() {
		return memberIndex;
	}
	
	public void setMemberIndex(int memberIndex) {
		this.memberIndex = memberIndex;
	}
	
	public String getMemberId() {
		return memberId;
	}
	
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	public String getMemberPwd() {
		return memberPwd;
	}
	
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	
	public String getMemberName() {
		return memberName;
	}
	
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	public String getMemberEmail() {
		return memberEmail;
	}
	
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	
	public String getMemberPhone() {
		return memberPhone;
	}
	
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	
	public String getMemberZipcode() {
		return memberZipcode;
	}
	
	public void setMemberZipcode(String memberZipcode) {
		this.memberZipcode = memberZipcode;
	}
	public String getMemberAddress() {
		return memberAddress;
	}
	
	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}
	
	public String getMemberAdmin() {
		return memberAdmin;
	}
	
	public void setMemberAdmin(String memberAdmin) {
		this.memberAdmin = memberAdmin;
	}

	public Date getMemberJoinedDate() {
		return memberJoinedDate;
	}

	public void setMemberJoinedDate(Date memberJoinedDate) {
		this.memberJoinedDate = memberJoinedDate;
	}

	@Override
	public String toString() {
		return "MemberVo [memberIndex=" + memberIndex + ", memberId=" + memberId + ", memberPwd=" + memberPwd
				+ ", memberName=" + memberName + ", memberEmail=" + memberEmail + ", memberPhone=" + memberPhone
				+ ", memberZipcode=" + memberZipcode + ", memberAddress=" + memberAddress + ", memberAdmin="
				+ memberAdmin + ", memberJoinedDate=" + memberJoinedDate + "]";
	}
	
	
	
}

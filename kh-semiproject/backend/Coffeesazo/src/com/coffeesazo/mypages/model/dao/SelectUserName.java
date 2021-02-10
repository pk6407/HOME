package com.coffeesazo.mypages.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.coffeesazo.Application;
import com.coffeesazo.member.model.vo.MemberVo;

public class SelectUserName {
	Connection conn; 
	PreparedStatement pstmt; 
	ResultSet rs;

	public SelectUserName() {

		conn = new Application().getConn();

	}

	public List<MemberVo> selectMemerName(String name , String memberid) {
		List<MemberVo> memberInfoList = new ArrayList<>();


		try {
			String sql ="SELECT membername FROM cs_mebmber WHERE member id = ?  ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberid);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				MemberVo memberVo = new MemberVo();
				memberVo.setMemberId(rs.getString("member_id"));
				memberVo.setMemberName(rs.getString("member_name"));

				memberInfoList.add(memberVo);
			}
		}catch(Exception e) {

		} finally {
			try {
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}

		return memberInfoList;
	}

	//

}

package com.coffeesazo.qna.model.dao;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.coffeesazo.Application;
import com.coffeesazo.Page;
import com.coffeesazo.member.model.vo.MemberVo;
import com.coffeesazo.qna.model.vo.QnAVo;

import common.JDBCTemplate;




public class QnADao {


	Connection conn; // db의 연결 정보 
	PreparedStatement pstmt; // 문자열로 되어 있는 sql 문장을 실행 
	ResultSet rs; // select문의 실행 결과 

	public QnADao() {
		conn = new Application().getConn();

	}
	
	public int getTotListSize(String findStr) throws Exception {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalListSize = 0;

		try {
			String sql = "select count(*) cnt from cs_qna where qna_title like ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  "%" + findStr + "%");


			rs = pstmt.executeQuery();
			while(rs.next()) {
				totalListSize = rs.getInt("cnt");

			}

		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}

		return totalListSize;

	}

	public ArrayList<QnAVo> selectQnAList(Connection conn, Page page) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<QnAVo> qnaList = null;

		try {
			qnaList = new ArrayList<QnAVo>();
			// 넘겨받은 검색어를 사용하여 totListSize값을 구해야함.
			String f = page.getFindStr();
			page.setTotalListSize(getTotListSize(f));
			page.pageCompute();

			String sql = " select * from ("
					   + " select rownum no, m.* from ("
					   + "   select * from cs_qna "
					   + "   where qna_title like ? "
					   + "   order by qna_index DESC) m  "
			           + " ) where no between ? and ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  "%" + page.getFindStr() + "%");
			pstmt.setInt(2, page.getStartNo());
			pstmt.setInt(3, page.getEndNo());	
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QnAVo qnavo = new QnAVo(); 
				qnavo.setQnaIndex(rs.getInt("qna_index"));
				qnavo.setQnaTitle(rs.getString("qna_title"));
				qnavo.setQnaDate(rs.getDate("qna_date"));
				qnavo.setFkMemberId(rs.getString("fk_member_id"));
				qnavo.setQnaImage(rs.getString("qna_image"));
				qnaList.add(qnavo);

			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);	
		}
		return qnaList;
	}


	public int updateqna( String id, String qnaTitle, String qnaText, String qnaImage) {


		try {
			String sql  = "INSERT INTO CS_QNA VALUES(seq_qna_index.nextval, ?, ?, SYSDATE, ?, ?, default)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, qnaTitle);
			pstmt.setString(3, qnaText);
			pstmt.setString(4, qnaImage);
			

			int row = pstmt.executeUpdate();

			if(row ==1) {

				return 1;
			}
			
					
			else
				return 0 ;
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
		
	}

	public String[] viewqna(int index, String memberid) {
		String title =null;
		String text = null;
		String image = null;


		try {
			String sql  = "select QNA_TITLE, QNA_TEXT, QNA_IMAGE from CS_QNA where QNA_INDEX=? AND FK_MEMBER_ID=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, index);
			pstmt.setString(2, memberid);

			ResultSet rs = pstmt.executeQuery();

			if(rs.next()) {
				title = rs.getString("QNA_TITLE");
				text = rs.getString("QNA_TEXT");
				image = rs.getString("QNA_IMAGE");
				
				if(image == null) {
					image = "첨부파일 없음";
				}
				String[] view = {title, text, image};
				
				return view;
			}
			else
				return null ;
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}

	public int modifyqna(int index, String memberid, String qnaTitle, String qnaText, String qnaImage) {

		try {
			String sql  = "UPDATE CS_QNA SET QNA_TITLE =? , QNA_TEXT =?, QNA_IMAGE =? WHERE QNA_INDEX=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, qnaTitle);
			pstmt.setString(2, qnaText);
			pstmt.setString(3, qnaImage);
			pstmt.setInt(4, index);
			

			int row = pstmt.executeUpdate();

			if(row ==1) {

				return 1;
			}
			else
				return 0 ;
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
		
	}

	public int deleteqna(int index) {

		try {
			String sql  = "DELETE cs_qna WHERE qna_index = ? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, index);


			int row = pstmt.executeUpdate();

			if(row ==1) {

				return 1;
			}
			else
				return 0 ;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;

	}

	
}

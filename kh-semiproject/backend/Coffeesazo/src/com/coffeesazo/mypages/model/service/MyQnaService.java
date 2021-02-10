package com.coffeesazo.mypages.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.coffeesazo.Application;
import com.coffeesazo.Page;
import com.coffeesazo.mypages.model.dao.MyQnaListDao;
import com.coffeesazo.mypages.model.vo.MyQnaList;
import com.coffeesazo.notice.model.dao.NoticeDao;
import com.coffeesazo.notice.model.vo.NoticeVo;

import common.JDBCTemplate;

public class MyQnaService {
	

	public List<MyQnaList> selectQnaPageList(Page page, String memberid) {
		List<MyQnaList> qnaSearchList = null;
		
		
		try {
			Connection conn = new Application().getConn();
			qnaSearchList =  new MyQnaListDao().selectQnaPageList(conn, page , memberid);
			
			JDBCTemplate.close(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return qnaSearchList;
	}

	


	
	public ArrayList<MyQnaList> SelectQnaList(String memberid) {
		ArrayList<MyQnaList> qnaList = null;
		try {
			
			Connection conn = new Application().getConn();
			qnaList = new MyQnaListDao().SelectQnaList(conn, memberid);
			JDBCTemplate.close(conn);
			} catch (Exception e) {
			e.printStackTrace();
		}
		return qnaList;
		
	}
	
	
	
}

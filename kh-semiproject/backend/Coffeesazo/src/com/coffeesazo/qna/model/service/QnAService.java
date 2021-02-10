package com.coffeesazo.qna.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.coffeesazo.Application;
import com.coffeesazo.Page;
import com.coffeesazo.qna.model.dao.QnADao;
import com.coffeesazo.qna.model.vo.QnAVo;

import common.JDBCTemplate;

public class QnAService {

	public ArrayList<QnAVo> selectQnAList(Page page) {
		ArrayList<QnAVo> qnaList = null;

		try {
			Connection conn = new Application().getConn();
			qnaList = new QnADao().selectQnAList(conn, page);
			JDBCTemplate.close(conn);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return qnaList;
	}
}
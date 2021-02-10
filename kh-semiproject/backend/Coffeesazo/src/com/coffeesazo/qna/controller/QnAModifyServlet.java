package com.coffeesazo.qna.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coffeesazo.qna.model.dao.QnADao;
import com.coffeesazo.qna.model.vo.QnAVo;

//조회 페이지에서 수정 눌렀을 때 수정페이지 값 세팅 위한 서블릿
@WebServlet("/qnamodify")
public class QnAModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession(); 
		String memberid = ((String)session.getAttribute("id"));
		System.out.println(memberid);

		int index = Integer.parseInt(request.getParameter("id"));
		System.out.println(index);
		
		QnADao dao = new QnADao();
		QnAVo vo = new QnAVo();
		System.out.println("dao객체가 생성되었습니다.");
		
		String[] result = dao.viewqna(index,memberid); 
		System.out.println("DB 조회 결과값 :" + result + "(성공 : 1 / 실패 : 0)");
		
		if(result != null) {
			//select성공시
			String title = result[0];
			System.out.println(title);
			String text = result[1];
			System.out.println(text);
			String image = result[2];
			System.out.println(image);
			
			request.setAttribute("title",title);
			request.setAttribute("text",text);
			request.setAttribute("image",image);
			request.setAttribute("index",index);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp?inc=view/qna/qna_modify.jsp");
			dispatcher.forward(request, response);
		}
		/*
		 * else
		 * out.println("<script>alert('작성자만 접근이 가능합니다.'); history.back();</script>");
		 */

	}
}
